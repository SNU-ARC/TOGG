#include <efanna2e/index_nsg.h>
#include <efanna2e/util.h>
#include <efanna2e/exp_data.h>
#include <chrono>
#include <string>
#include <set>
#include <omp.h>

void load_data(char* filename, float*& data, unsigned& num,
               unsigned& dim) {  // load data with sift10K pattern
  std::ifstream in(filename, std::ios::binary);
  if (!in.is_open()) {
    std::cout << "open file error" << std::endl;
    exit(-1);
  }
  in.read((char*)&dim, 4);
  // std::cout<<"data dimension: "<<dim<<std::endl;
  in.seekg(0, std::ios::end);
  std::ios::pos_type ss = in.tellg();
  size_t fsize = (size_t)ss;
  num = (unsigned)(fsize / (dim + 1) / 4);
  data = new float[(size_t)num * (size_t)dim];

  in.seekg(0, std::ios::beg);
  for (size_t i = 0; i < num; i++) {
    in.seekg(4, std::ios::cur);
    in.read((char*)(data + i * dim), dim * 4);
  }
  in.close();
}

float cal_recall(std::vector<std::vector<unsigned> > results, std::vector<std::vector<unsigned> > true_data, unsigned num, unsigned k) {
  float mean_acc = 0;
  for(size_t i = 0; i < num; i++) {
    float acc = 0;
    for(size_t j = 0; j < k; j++) {
      for(size_t m = 0; m < k; m++) {
        if(results[i][j] == true_data[i][m]) {
          acc++;
          break;
        }
      }
    }
    mean_acc += acc / k;
  }
  return mean_acc / num ;
}

void load_ivecs_data(const char* filename, std::vector<std::vector<unsigned> >& results) {
  std::ifstream in(filename, std::ios::binary);
  if (!in.is_open()) {
    std::cout << "open file error" << std::endl;
    exit(-1);
  }
  unsigned dim, num;
  in.read((char*)&dim, 4);
  //std::cout<<"data dimension: "<<dim<<std::endl;
  in.seekg(0, std::ios::end);
  std::ios::pos_type ss = in.tellg();
  size_t fsize = (size_t)ss;
  num = (unsigned)(fsize / (dim + 1) / 4);
  results.resize(num);
  for (unsigned i = 0; i < num; i++) results[i].resize(dim);

  in.seekg(0, std::ios::beg);
  for (size_t i = 0; i < num; i++) {
    in.seekg(4, std::ios::cur);
    in.read((char*)results[i].data(), dim * 4);
  }
  in.close();
}

void get_range(const float* data, unsigned dim, unsigned num, float* &range) {
  float *max = new float[(size_t)dim];
  float *min = new float[(size_t)dim];
  range = new float[(size_t)dim];
  for(size_t i = 0; i < dim; i++) { //初始化为第一行数据
    max[i] = min[i] = data[i];
  }
  for(size_t i = 0; i < dim; i++) {
    for(size_t j = i; j < num * dim; j += dim) {
      if(max[i] < data[j]) max[i] = data[j];
      if(min[i] > data[j]) min[i] = data[j];
    }
  }
  for (size_t i = 0; i < dim; i++) {
      range[i] = max[i] - min[i];
  }
}

int main(int argc, char** argv) {
  std::cout << "argc: " << argc << std::endl;
  if (argc < 4) {
    std::cout << "./evaluation dataset [sub_id] exc_type [P] [K] [L]"
              << std::endl;
    exit(-1);
  }  
  int sub_id = -1;
  if (argc == 7) {
    sub_id = (int)atoi(argv[2]);
    std::cout << "sub_id: " << sub_id << std::endl;
  }
  std::string dataset(argv[1]);
  std::cout << "dataset: " << dataset << std::endl;
  std::string exc_type;
  if (sub_id == -1)
    exc_type.assign(argv[2]);
  else
    exc_type.assign(argv[3]);
  //set data
  std::string base_path;
  std::string query_path;
  std::string ground_path;
  set_data_path(dataset, base_path, query_path, ground_path, sub_id);
  std::string graph_file;
  if (sub_id == -1)
    graph_file.assign("nsg_toggkdt_" + dataset + ".graph");
  else
    graph_file.assign("nsg_toggkdt_" + dataset + "_" + std::to_string(sub_id) + ".graph");

  float* data_load = NULL;
  unsigned points_num, dim;
  load_data(&base_path[0], data_load, points_num, dim);
  float* range = NULL;
  get_range(data_load, dim, points_num, range);
  data_load = efanna2e::data_align(data_load, points_num, dim);
  if (exc_type == "build") {
    efanna2e::IndexNSG index(dim, points_num, efanna2e::L2, nullptr);
    efanna2e::Parameters paras;
    set_para(dataset, paras, sub_id);
    if (argc < 4) {
      std::cout << "./evaluation dataset [sub_id] exc_type [P] [K] [L]"
                << std::endl;
      exit(-1);
    }
    float P;
    if (sub_id == -1) P = (float)atof(argv[3]);
    else P = (float)atof(argv[4]);
    index.Load_range(range);
    index.InitRangeProportion(P);
    std::cout << "P: " << P << std::endl;
    auto s = std::chrono::high_resolution_clock::now();
    index.Build(points_num, data_load, paras);
    auto e = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> diff = e - s;

    std::cout << "Build Time: " << diff.count() << "\n";
    index.SaveNSG_TOGG_KDT(&graph_file[0]);
  }
  else if (exc_type == "search") {
    efanna2e::Parameters paras;
    efanna2e::IndexNSG index(dim, points_num, efanna2e::FAST_L2, nullptr);
    float* query_load = NULL;
    unsigned query_num, query_dim;
    load_data(&query_path[0], query_load, query_num, query_dim);
    query_load = efanna2e::data_align(query_load, query_num, query_dim);
    assert(dim == query_dim);

    std::vector<std::vector<unsigned> > true_data;
    load_ivecs_data(&ground_path[0], true_data);

    index.Load_range(range);
    index.Load(&graph_file[0]);
    index.OptimizeGraph(data_load);
    unsigned K;
    std::string L_type("L_SEARCH_ASSIGN");
    if (argc == 4) {
      K = (unsigned)atoi(argv[3]);
      std::cout << "K: " << K << std::endl;
    }else {
      K = (unsigned)atoi(argv[3]);
    }
    if (L_type == "L_SEARCH_ASCEND") {
      unsigned L_st = 1;
      unsigned L_st2 = K;
      unsigned iter_num = 10;
      for (unsigned i = 0; i < iter_num; i++) {
        unsigned L = L_st + L_st2;
        L_st = L_st2;
        L_st2 = L;
        paras.Set<unsigned>("L_search", L);
        std::cout << "SEARCH_L : " << L << std::endl;
        if (L < K) {
          std::cout << "search_L cannot be smaller than search_K! " << std::endl;
          exit(-1);
        }
        index.InitDistCount();
        std::vector<std::vector<unsigned> > res(query_num);
        for (unsigned i = 0; i < query_num; i++) res[i].resize(K);
        auto s1 = std::chrono::high_resolution_clock::now();
        for (unsigned i = 0; i < query_num; i++) {
          index.SearchWithOptGraph(query_load + i * dim, K, paras, res[i].data());
        }
        auto e1 = std::chrono::high_resolution_clock::now();
        std::chrono::duration<double> diff = e1 - s1;
        std::cout << "search time: " << diff.count() << "\n";
        size_t DistCount = index.GetDistCount();
        std::cout << "DistCount: " << DistCount << std::endl;
        float recall = cal_recall(res, true_data, query_num, K);
        std::cout << K << " NN accuracy: " << recall << std::endl;
        if (recall > 0.99) break;
        else if (i == iter_num - 1 && (float)(points_num * query_num / DistCount) > 10) iter_num++;
      }
    }
    else if (L_type == "L_SEARCH_SET_RECALL") {
      std::set<unsigned> visited;
      unsigned sg = 1000;
      float acc_set = 0.96;
      bool flag = false;
      int L_sl = 1;
      unsigned L = K;
      visited.insert(L);
      unsigned L_min = 0x7fffffff;
      while (true) {
        paras.Set<unsigned>("L_search", L);
        // std::cout << "SEARCH_L : " << L << std::endl;
        if (L < K) {
          std::cout << "search_L cannot be smaller than search_K! " << std::endl;
          exit(-1);
        }
        index.InitDistCount();
        std::vector<std::vector<unsigned> > res(query_num);
        for (unsigned i = 0; i < query_num; i++) res[i].resize(K);

// #pragma omp parallel for
        for (unsigned i = 0; i < query_num; i++) {
          index.SearchWithOptGraph(query_load + i * dim, K, paras, res[i].data());
        }

        float acc = cal_recall(res, true_data, query_num, K);
        if (acc_set - acc <= 0) {
            if (L_min > L) L_min = L;
            if (L == K || L_sl == 1) {
                break;
            } else {
                if (flag == false) {
                    L_sl < 0 ? L_sl-- : L_sl++;
                    flag = true;
                }

                L_sl /= 2;

                if (L_sl == 0) {
                    break;
                }
                L_sl < 0 ? L_sl : L_sl = -L_sl;
            }
        }else {
            if (L_min < L) break;
            L_sl = (int)(sg * (acc_set - acc));
            if (L_sl == 0) L_sl++;
            flag = false;
        }
        L += L_sl;
        if (visited.count(L)) {
            break;
        }else {
            visited.insert(L);
        }
      }
      std::cout << "L_min: " << L_min << std::endl;
    }
    else if (L_type == "L_SEARCH_ASSIGN") {
      unsigned L = (unsigned)atoi(argv[4]);
      unsigned num_threads = atoi(argv[5]);
      omp_set_num_threads(num_threads);
      paras.Set<unsigned>("L_search", L);
      std::cout << "SEARCH_L : " << L << std::endl;
      std::cout << "THREAD_NUM : " << num_threads << std::endl;
      if (L < K) {
        std::cout << "search_L cannot be smaller than search_K! " << std::endl;
        exit(-1);
      }
      index.InitDistCount();
      std::vector<std::vector<unsigned> > res(query_num);
      for (unsigned i = 0; i < query_num; i++) res[i].resize(K);
      auto s1 = std::chrono::high_resolution_clock::now();
#pragma omp parallel for schedule(dynamic, 1)
        for (unsigned i = 0; i < query_num; i++) {
          index.SearchWithOptGraph(query_load + i * dim, K, paras, res[i].data());
        }
      auto e1 = std::chrono::high_resolution_clock::now();
      std::chrono::duration<double> diff = e1 - s1;
      std::cout << "search time: " << diff.count() << "\n";
      std::cout << "QPS: " << query_num / diff.count() << std::endl;
      size_t DistCount = index.GetDistCount();
      std::cout << "DistCount: " << DistCount << std::endl;
      std::cout << "Speedup: " << (float)points_num * query_num / DistCount << std::endl; 
      float recall = cal_recall(res, true_data, query_num, K);
      std::cout << K << " NN accuracy: " << recall << std::endl;
    }
  }

  return 0;
}

