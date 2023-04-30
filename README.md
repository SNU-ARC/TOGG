# TOGG: Two-Stage Routing with Optimized Guided Search and Greedy Algorithm On Proximity Graph

This repository is for TOGG evaluation on NSG/NSSG/VAMANA.

Please refer to original [readme](https://github.com/whenever5225/TOGG/blob/master/README.md).

## Building Instruction

### Prerequisites
+ OpenMP
+ CMake
+ Boost

### Compile on Ubuntu:


1. Install Dependencies:

```shell
$ sudo apt-get install g++ cmake libboost-dev libgoogle-perftools-dev
```

2. Compile TOGG-KDT/TOGG-KMC:

```shell
$ git clone https://github.com/SNU-ARC/TOGG
$ cd TOGG/
$ git checkout ADA-NNS
$ cd algorithms/
$ cd TOGG-KDT/nsg or TOGG-KDT/nssg or TOGG-KDT/vamana or TOGG-KMC/nsg or TOGG-KMC/nssg or TOGG-KMC/vamana
$ cd build
$ ./build.sh
```

## Usage

We provide the script which can build and search for in memory-resident indices. The scripts locate under directory `tests/.`

### Building NSG / NSSG / VAMANA Index

To evaluate TOGG-KDT/TOGG-KMC, an NSG/NSSG/VAMANA index must be built first. Here are the instructions for building index.

#### Step 1. Build kNN graph

Firstly, we need to prepare a kNN graph.

NSG/NSSG/VAMANA suggests to use [efanna\_graph](https://github.com/ZJULearning/efanna\_graph) to build this kNN graph. 

We provide the script to build kNN graphs for various datasets. Please refer to [efanna\_graph](https://github.com/SNU-ARC/efanna\_graph) and checkout `ADA-NNS` branch.

You can also use any alternatives, such as [Faiss](https://github.com/facebookresearch/faiss).

#### Step 2. Build NSG/NSSG/VAMANA index and search via NSG/NSSG/VAMANA index

Secondly, we will convert the kNN graph to NSG/NSSG/VAMANA index and perform search.

The parameters used to build each index are the same as those used in ADA-NNS.

Please refer to each readme ([NSG](https://github.com/SNU-ARC/nsg/blob/ADA-NNS/README.md), [SSG](https://github.com/SNU-ARC/SSG/blob/ADA-NNS/README.md), [VAMANA](https://github.com/SNU-ARC/DiskANN/blob/ADA-NNS/README.md))

And we set the parameter P to 1 and CN to 4.

### Searching with NSG/NSSG/VAMANA Index

To use the greedy search, use the `run.sh` script:
```shell
$ cd tests/
$ ./evaluate.sh [dataset] (e.g., evaluate.sh sift1M, evaluate.sh all)
```
The argument is as follows:

(i) dataset: Name of the dataset. The script supports various real datasets (e.g., SIFT1M, GIST1M, CRAWL, DEEP1M, DEEP100M, MSONG, GLOVE-100).

To change parameter for search (e.g., K, L, number of threads), open `run.sh` and modify the parameter `K, L_SIZE, THREAD`.

