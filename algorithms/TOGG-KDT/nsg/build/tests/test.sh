#!/bin/bash

export sub_num=(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)
for id in ${sub_num[@]}; do
  if [ ! -f "~/HYNIX_NDP/GraphANNS/TOGG/algorithms/GA/efanna_graph/build/tests/deep100M_knn_${id}.graph" ]; then
    ln -s ~/HYNIX_NDP/graph_ANNS_datasets/efanna_graph/deep100M_400nn_${id}.graph ~/HYNIX_NDP/GraphANNS/TOGG/algorithms/GA/efanna_graph/build/tests/deep100M_knn_${id}.graph
  fi
  ./evaluation deep100M ${id} build 1
done
