#!/bin/bash
export TIME=$(date '+%Y%m%d%H%M')
MAX_THREADS=`nproc --all`

l_start=20
l_end=200
l_step=10

for (( l=l_start; l<=l_end; l=l+l_step )); do
	L_SIZE+=($l)
done

l_start=250
l_end=500
l_step=50

for (( l=l_start; l<=l_end; l=l+l_step )); do
	L_SIZE+=($l)
done

l_start=1000
l_end=2500
l_step=500

for (( l=l_start; l<=l_end; l=l+l_step )); do
	L_SIZE+=($l)
done

THREAD=(1)
K=(1 10)

vamana_sift1M() {
  # Convert base set, query set, groundtruth set to Vamana format
  if [ ! -f "../../../../../routing_evaluation/dataset/sift1M/sift_base.fvecs.bin" ]; then
    echo "fvecs to bin"
    ./utils/fvecs_to_bin ../../../../../routing_evaluation/dataset/sift1M/sift_base.fvecs ../../../../../routing_evaluation/dataset/sift1M/sift_base.fvecs.bin
  fi
  if [ ! -f "../../../../../routing_evaluation/dataset/sift1M/sift_query.fvecs.bin" ]; then
    echo "fvecs to bin"
    ./utils/fvecs_to_bin ../../../../../routing_evaluation/dataset/sift1M/sift_query.fvecs ../../../../../routing_evaluation/dataset/sift1M/sift_query.fvecs.bin
  fi
  if [ ! -f "../../../../../routing_evaluation/dataset/sift1M/sift_groundtruth.ivecs.bin" ]; then
    echo "ivecs to bin"
    ./utils/fvecs_to_bin ../../../../../routing_evaluation/dataset/sift1M/sift_groundtruth.ivecs ../../../../../routing_evaluation/dataset/sift1M/sift_groundtruth.ivecs.bin
  fi

  # Build proximity graph
  if [ ! -f "sift1M.index" ]; then
    echo "Generating Vamana index"
    ./build_memory_index float l2 ../../../../../routing_evaluation/dataset/sift1M/sift_base.fvecs.bin sift1M.index 70 75 1.2 ${MAX_THREADS} # [R] [L] [alpha] [num_threads]
  fi

  # Perform search
  echo "Perform searching using Vamana index (sift1M_L${1}_K${2}_T${3})"
  sudo sh -c "sync && echo 3 > /proc/sys/vm/drop_caches"
  ./search_memory_index float fast_l2 ../../../../../routing_evaluation/dataset/sift1M/sift_base.fvecs.bin sift1M.index ${3} ../../../../../routing_evaluation/dataset/sift1M/sift_query.fvecs.bin \
    ../../../../../routing_evaluation/dataset/sift1M/sift_groundtruth.ivecs.bin ${2} sift1M_search_L${1}_K${2}_T${3} ${1} > sift1M_search_L${1}_K${2}_T${3}.log 
}

vamana_gist1M() {
  # Convert base set, query set, groundtruth set to Vamana format
  if [ ! -f "../../../../../routing_evaluation/dataset/gist1M/gist_base.fvecs.bin" ]; then
    echo "fvecs to bin"
    ./utils/fvecs_to_bin ../../../../../routing_evaluation/dataset/gist1M/gist_base.fvecs ../../../../../routing_evaluation/dataset/gist1M/gist_base.fvecs.bin
  fi
  if [ ! -f "../../../../../routing_evaluation/dataset/gist1M/gist_query.fvecs.bin" ]; then
    echo "fvecs to bin"
    ./utils/fvecs_to_bin ../../../../../routing_evaluation/dataset/gist1M/gist_query.fvecs ../../../../../routing_evaluation/dataset/gist1M/gist_query.fvecs.bin
  fi
  if [ ! -f "../../../../../routing_evaluation/dataset/gist1M/gist_groundtruth.ivecs.bin" ]; then
    echo "ivecs to bin"
    ./utils/fvecs_to_bin ../../../../../routing_evaluation/dataset/gist1M/gist_groundtruth.ivecs ../../../../../routing_evaluation/dataset/gist1M/gist_groundtruth.ivecs.bin
  fi

  # Build proximity graph
  if [ ! -f "gist1M.index" ]; then
    echo "Generating Vamana index"
    ./build_memory_index float l2 ../../../../../routing_evaluation/dataset/gist1M/gist_base.fvecs.bin gist1M.index 70 75 1.2 ${MAX_THREADS} # [R] [L] [alpha] [num_threads]
  fi

  # Perform search
  echo "Perform searching using Vamana index (gist1M_L${1}_K${2}_T${3})"
  sudo sh -c "sync && echo 3 > /proc/sys/vm/drop_caches"
  ./search_memory_index float fast_l2 ../../../../../routing_evaluation/dataset/gist1M/gist_base.fvecs.bin gist1M.index ${3} ../../../../../routing_evaluation/dataset/gist1M/gist_query.fvecs.bin \
    ../../../../../routing_evaluation/dataset/gist1M/gist_groundtruth.ivecs.bin ${2} gist1M_search_L${1}_K${2}_T${3} ${1}   > gist1M_search_L${1}_K${2}_T${3}.log 
}

vamana_crawl() {
  # Convert base set, query set, groundtruth set to Vamana format
  if [ ! -f "../../../../../routing_evaluation/dataset/crawl/crawl_base.fvecs.bin" ]; then
    echo "fvecs to bin"
    ./utils/fvecs_to_bin ../../../../../routing_evaluation/dataset/crawl/crawl_base.fvecs ../../../../../routing_evaluation/dataset/crawl/crawl_base.fvecs.bin
  fi
  if [ ! -f "../../../../../routing_evaluation/dataset/crawl/crawl_query.fvecs.bin" ]; then
    echo "fvecs to bin"
    ./utils/fvecs_to_bin ../../../../../routing_evaluation/dataset/crawl/crawl_query.fvecs ../../../../../routing_evaluation/dataset/crawl/crawl_query.fvecs.bin
  fi
  if [ ! -f "../../../../../routing_evaluation/dataset/crawl/crawl_groundtruth.ivecs.bin" ]; then
    echo "ivecs to bin"
    ./utils/fvecs_to_bin ../../../../../routing_evaluation/dataset/crawl/crawl_groundtruth.ivecs ../../../../../routing_evaluation/dataset/crawl/crawl_groundtruth.ivecs.bin
  fi

  # Build proximity graph
  if [ ! -f "crawl.index" ]; then
    echo "Generating Vamana index"
    ./build_memory_index float l2 ../../../../../routing_evaluation/dataset/crawl/crawl_base.fvecs.bin crawl.index 70 75 1.2 ${MAX_THREADS} # [R] [L] [alpha] [num_threads]
  fi

  # Perform search
  echo "Perform searching using Vamana index (crawl_L${1}_K${2}_T${3})"
  sudo sh -c "sync && echo 3 > /proc/sys/vm/drop_caches"
  ./search_memory_index float fast_l2 ../../../../../routing_evaluation/dataset/crawl/crawl_base.fvecs.bin crawl.index ${3} ../../../../../routing_evaluation/dataset/crawl/crawl_query.fvecs.bin \
    ../../../../../routing_evaluation/dataset/crawl/crawl_groundtruth.ivecs.bin ${2} crawl_search_L${1}_K${2}_T${3} ${1}   > crawl_search_L${1}_K${2}_T${3}.log 
}

vamana_deep1M() {
  # Convert base set, query set, groundtruth set to Vamana format
  if [ ! -f "../../../../../routing_evaluation/dataset/deep1M/deep1m_base.fvecs.bin" ]; then
    echo "fvecs to bin"
    ./utils/fvecs_to_bin ../../../../../routing_evaluation/dataset/deep1M/deep1m_base.fvecs ../../../../../routing_evaluation/dataset/deep1M/deep1m_base.fvecs.bin
  fi
  if [ ! -f "../../../../../routing_evaluation/dataset/deep1M/deep1m_query.fvecs.bin" ]; then
    echo "fvecs to bin"
    ./utils/fvecs_to_bin ../../../../../routing_evaluation/dataset/deep1M/deep1m_query.fvecs ../../../../../routing_evaluation/dataset/deep1M/deep1m_query.fvecs.bin
  fi
  if [ ! -f "../../../../../routing_evaluation/dataset/deep1M/deep1m_groundtruth.ivecs.bin" ]; then
    echo "ivecs to bin"
    ./utils/fvecs_to_bin ../../../../../routing_evaluation/dataset/deep1M/deep1m_groundtruth.ivecs ../../../../../routing_evaluation/dataset/deep1M/deep1m_groundtruth.ivecs.bin
  fi

  # Build proximity graph
  if [ ! -f "deep1M.index" ]; then
    echo "Generating Vamana index"
    ./build_memory_index float l2 ../../../../../routing_evaluation/dataset/deep1M/deep1m_base.fvecs.bin deep1M.index 70 75 1.2 ${MAX_THREADS} # [R] [L] [alpha] [num_threads]
  fi

  # Perform search
  echo "Perform searching using Vamana index (deep1M_L${1}_K${2}_T${3})"
  sudo sh -c "sync && echo 3 > /proc/sys/vm/drop_caches"
  ./search_memory_index float fast_l2 ../../../../../routing_evaluation/dataset/deep1M/deep1m_base.fvecs.bin deep1M.index ${3} ../../../../../routing_evaluation/dataset/deep1M/deep1m_query.fvecs.bin \
    ../../../../../routing_evaluation/dataset/deep1M/deep1m_groundtruth.ivecs.bin ${2} deep1M_search_L${1}_K${2}_T${3} ${1} > deep1M_search_L${1}_K${2}_T${3}.log 
}

vamana_msong() {
  # Convert base set, query set, groundtruth set to Vamana format
  if [ ! -f "../../../../../routing_evaluation/dataset/msong/msong_base.fvecs.bin" ]; then
    echo "fvecs to bin"
    ./utils/fvecs_to_bin ../../../../../routing_evaluation/dataset/msong/msong_base.fvecs ../../../../../routing_evaluation/dataset/msong/msong_base.fvecs.bin
  fi
  if [ ! -f "../../../../../routing_evaluation/dataset/msong/msong_query.fvecs.bin" ]; then
    echo "fvecs to bin"
    ./utils/fvecs_to_bin ../../../../../routing_evaluation/dataset/msong/msong_query.fvecs ../../../../../routing_evaluation/dataset/msong/msong_query.fvecs.bin
  fi
  if [ ! -f "../../../../../routing_evaluation/dataset/msong/msong_groundtruth.ivecs.bin" ]; then
    echo "ivecs to bin"
    ./utils/fvecs_to_bin ../../../../../routing_evaluation/dataset/msong/msong_groundtruth.ivecs ../../../../../routing_evaluation/dataset/msong/msong_groundtruth.ivecs.bin
  fi

  # Build proximity graph
  if [ ! -f "msong.index" ]; then
    echo "Generating Vamana index"
    ./build_memory_index float l2 ../../../../../routing_evaluation/dataset/msong/msong_base.fvecs.bin msong.index 30 40 2 ${MAX_THREADS} # [R] [L] [alpha] [num_threads]
  fi

  # Perform search
  echo "Perform searching using Vamana index (msong_L${1}_K${2}_T${3})"
  sudo sh -c "sync && echo 3 > /proc/sys/vm/drop_caches"
  ./search_memory_index float fast_l2 ../../../../../routing_evaluation/dataset/msong/msong_base.fvecs.bin msong.index ${3} ../../../../../routing_evaluation/dataset/msong/msong_query.fvecs.bin \
    ../../../../../routing_evaluation/dataset/msong/msong_groundtruth.ivecs.bin ${2} msong_search_L${1}_K${2}_T${3} ${1}   > msong_search_L${1}_K${2}_T${3}.log 
}

vamana_glove-100() {
  # Convert base set, query set, groundtruth set to Vamana format
  if [ ! -f "../../../../../routing_evaluation/dataset/glove-100/glove-100_base.fvecs.bin" ]; then
    echo "fvecs to bin"
    ./utils/fvecs_to_bin ../../../../../routing_evaluation/dataset/glove-100/glove-100_base.fvecs ../../../../../routing_evaluation/dataset/glove-100/glove-100_base.fvecs.bin
  fi
  if [ ! -f "../../../../../routing_evaluation/dataset/glove-100/glove-100_query.fvecs.bin" ]; then
    echo "fvecs to bin"
    ./utils/fvecs_to_bin ../../../../../routing_evaluation/dataset/glove-100/glove-100_query.fvecs ../../../../../routing_evaluation/dataset/glove-100/glove-100_query.fvecs.bin
  fi
  if [ ! -f "../../../../../routing_evaluation/dataset/glove-100/glove-100_groundtruth.ivecs.bin" ]; then
    echo "ivecs to bin"
    ./utils/fvecs_to_bin ../../../../../routing_evaluation/dataset/glove-100/glove-100_groundtruth.ivecs ../../../../../routing_evaluation/dataset/glove-100/glove-100_groundtruth.ivecs.bin
  fi

  # Build proximity graph
  if [ ! -f "glove-100.index" ]; then
    echo "Generating Vamana index"
    ./build_memory_index float l2 ../../../../../routing_evaluation/dataset/glove-100/glove-100_base.fvecs.bin glove-100.index 70 75 1.2 ${MAX_THREADS} # [R] [L] [alpha] [num_threads]
  fi

  # Perform search
  echo "Perform searching using Vamana index (glove-100_L${1}_K${2}_T${3})"
  sudo sh -c "sync && echo 3 > /proc/sys/vm/drop_caches"
  ./search_memory_index float fast_l2 ../../../../../routing_evaluation/dataset/glove-100/glove-100_base.fvecs.bin glove-100.index ${3} ../../../../../routing_evaluation/dataset/glove-100/glove-100_query.fvecs.bin \
    ../../../../../routing_evaluation/dataset/glove-100/glove-100_groundtruth.ivecs.bin ${2} glove-100_search_L${1}_K${2}_T${3} ${1} > glove-100_search_L${1}_K${2}_T${3}.log 
}

vamana_deep100M() {
  # Convert base set, query set, groundtruth set to Vamana format
  if [ ! -f "../../../../../routing_evaluation/dataset/deep100M/deep100M_base.fvecs.bin" ]; then
    echo "fvecs to bin"
    ./utils/fvecs_to_bin ../../../../../routing_evaluation/dataset/deep100M/deep100M_base.fvecs ../../../../../routing_evaluation/dataset/deep100M/deep100M_base.fvecs.bin
  fi
  if [ ! -f "../../../../../routing_evaluation/dataset/deep100M/deep100M_query.fvecs.bin" ]; then
    echo "fvecs to bin"
    ./utils/fvecs_to_bin ../../../../../routing_evaluation/dataset/deep100M/deep100M_query.fvecs ../../../../../routing_evaluation/dataset/deep100M/deep100M_query.fvecs.bin
  fi
  if [ ! -f "../../../../../routing_evaluation/dataset/deep100M/deep100M_groundtruth.ivecs.bin" ]; then
    echo "ivecs to bin"
    ./utils/fvecs_to_bin ../../../../../routing_evaluation/dataset/deep100M/deep100M_groundtruth.ivecs ../../../../../routing_evaluation/dataset/deep100M/deep100M_groundtruth.ivecs.bin
  fi

  # Build proximity graph
  if [ ! -f "deep100M.index" ]; then
    echo "Generating Vamana index"
    ./build_memory_index float l2 ../../../../../routing_evaluation/dataset/deep100M/deep100M_base.fvecs.bin deep100M.index 70 75 1.2 ${MAX_THREADS} # [R] [L] [alpha] [num_threads]
  fi

  # Perform search
  echo "Perform searching using Vamana index (deep100M_L${1}_K${2}_T${3})"
  sudo sh -c "sync && echo 3 > /proc/sys/vm/drop_caches"
  ./search_memory_index float fast_l2 ../../../../../routing_evaluation/dataset/deep100M/deep100M_base.fvecs.bin deep100M.index ${3} ../../../../../routing_evaluation/dataset/deep100M/deep100M_query.fvecs.bin \
    ../../../../../routing_evaluation/dataset/deep100M/deep100M_groundtruth.ivecs.bin ${2} deep100M_search_L${1}_K${2}_T${3} ${1} > \
    deep100M_search_L${1}_K${2}_T${3}.log 
}

vamana_deep100M_16T() {
  export sub_num=(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)
  for id in ${sub_num[@]}; do
    # Convert base set, query set, groundtruth set to Vamana format
    if [ ! -f "../../../../../routing_evaluation/dataset/deep100M/deep100M_base_${id}.fvecs.bin" ]; then
      echo "fvecs to bin"
      ./utils/fvecs_to_bin ../../../../../routing_evaluation/dataset/deep100M/deep100M_base_${id}.fvecs ../../../../../routing_evaluation/dataset/deep100M/deep100M_base_${id}.fvecs.bin
    fi
    if [ ! -f "../../../../../routing_evaluation/dataset/deep100M/deep100M_query.fvecs.bin" ]; then
      echo "fvecs to bin"
      ./utils/fvecs_to_bin ../../../../../routing_evaluation/dataset/deep100M/deep100M_query.fvecs ../../../../../routing_evaluation/dataset/deep100M/deep100M_query.fvecs.bin
    fi
    if [ ! -f "../../../../../routing_evaluation/dataset/deep100M/deep100M_groundtruth_${id}.ivecs.bin" ]; then
      echo "ivecs to bin"
      ./utils/fvecs_to_bin ../../../../../routing_evaluation/dataset/deep100M/deep100M_groundtruth.ivecs ../../../../../routing_evaluation/dataset/deep100M/deep100M_groundtruth_${id}.ivecs.bin ${id}
    fi

    # Build proximity graph
    if [ ! -f "deep100M_${id}.index" ]; then
      echo "Generating Vamana index"
      ./build_memory_index float l2 ../../../../../routing_evaluation/dataset/deep100M/deep100M_base_${id}.fvecs.bin deep100M_${id}.index 70 75 1.2 ${MAX_THREADS} # [R] [L] [alpha] [num_threads]4
    fi
  done
  echo "Perform searching using Vamana index (deep100M_L${1}_K${2}_T${3})"

  # Perform search
  sudo sh -c "sync && echo 3 > /proc/sys/vm/drop_caches"
  for id in ${sub_num[@]}; do
    ./search_memory_index float fast_l2 ../../../../../routing_evaluation/dataset/deep100M/deep100M_base_${id}.fvecs.bin deep100M_${id}.index ${3} ../../../../../routing_evaluation/dataset/deep100M/deep100M_query.fvecs.bin \
      ../../../../../routing_evaluation/dataset/deep100M/deep100M_groundtruth_${id}.ivecs.bin ${2} deep100M_search_L${1}_K${2}_T${3}_${id}_${3} ${1} > \
      deep100M_search_L${1}_K${2}_T${3}_${id}.log &
  done
  wait
  rm -rf deep100M_search_L${1}_K${2}_T${3}.log
  awk 'NR==10{ print; exit }' deep100M_search_L${1}_K${2}_T${3}_0.log >> deep100M_search_L${1}_K${2}_T${3}.log
  awk 'NR==11{ print; exit }' deep100M_search_L${1}_K${2}_T${3}_0.log >> deep100M_search_L${1}_K${2}_T${3}.log
  for id in ${sub_num[@]}; do
    awk 'NR==12{ print $0; exit }' deep100M_search_L${1}_K${2}_T${3}_${id}.log >> deep100M_search_L${1}_K${2}_T${3}.log
  done
  cat deep100M_search_L${1}_K${2}_T${3}.log | awk '{sum += $5;} {if(NR==3) min = $2} {if($2 < min) min = $2} END { print "min_qps: " min; print "recall: " sum; }' >> deep100M_search_L${1}_K${2}_T${3}.log 
}


if [[ ${#} -eq 1 ]]; then
  if [ "${1}" == "sift1M" ]; then
    for k in ${K[@]}; do
      for l_size in ${L_SIZE[@]}; do
        declare -i l=l_size
        for t in ${THREAD[@]}; do
          vamana_sift1M ${l} ${k} ${t}
        done
      done
    done
  elif [ "${1}" == "gist1M" ]; then
    for k in ${K[@]}; do
      for l_size in ${L_SIZE[@]}; do
        declare -i l=l_size
        for t in ${THREAD[@]}; do
          vamana_gist1M ${l} ${k} ${t}
        done
      done
    done
  elif [ "${1}" == "crawl" ]; then
    for k in ${K[@]}; do
      for l_size in ${L_SIZE[@]}; do
        declare -i l=l_size
        for t in ${THREAD[@]}; do
          vamana_crawl ${l} ${k} ${t}
        done
      done
    done
  elif [ "${1}" == "deep1M" ]; then
    for k in ${K[@]}; do
      for l_size in ${L_SIZE[@]}; do
        declare -i l=l_size
        for t in ${THREAD[@]}; do
          vamana_deep1M ${l} ${k} ${t}
        done
      done
    done
  elif [ "${1}" == "msong" ]; then
    for k in ${K[@]}; do
      for l_size in ${L_SIZE[@]}; do
        declare -i l=l_size
        for t in ${THREAD[@]}; do
          vamana_msong ${l} ${k} ${t}
        done
      done
    done
  elif [ "${1}" == "glove-100" ]; then
    for k in ${K[@]}; do
      for l_size in ${L_SIZE[@]}; do
        declare -i l=l_size
        for t in ${THREAD[@]}; do
          vamana_glove-100 ${l} ${k} ${t}
        done
      done
    done
  elif [ "${1}" == "deep100M" ]; then
    for k in ${K[@]}; do
      for l_size in ${L_SIZE[@]}; do
        declare -i l=l_size
        for t in ${THREAD[@]}; do
          vamana_deep100M ${l} ${k} ${t}
        done
      done
    done
  elif [ "${1}" == "deep100M_16T" ]; then
    for k in ${K[@]}; do
      for l_size in ${L_SIZE[@]}; do
        declare -i l=l_size
        for t in ${THREAD[@]}; do
          vamana_deep100M_16T ${l} ${k} ${t}
        done
      done
    done
  elif [ "${1}" == "all" ]; then
    for k in ${K[@]}; do
      for t in ${THREAD[@]}; do
        for l_size in ${L_SIZE[@]}; do
          declare -i l=l_size
          vamana_sift1M ${l} ${k} ${t}
          vamana_gist1M ${l} ${k} ${t}
          vamana_crawl ${l} ${k} ${t}
          vamana_deep1M ${l} ${k} ${t}
          vamana_msong ${l} ${k} ${t}
          vamana_glove-100 ${l} ${k} ${t}
          vamana_deep100M ${l} ${k} ${t}
        done
      done
    done
  else
    echo "Usage: ./evaluate_baseline.sh [dataset]"
  fi
elif [[ ${#} -eq 4 ]]; then
  vamana_$1 $2 $3 $4
else
  echo "Usage: ./evaluate_baseline.sh [dataset]"
fi
