#!/bin/bash

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

sift1M() {
  # Build a proximity graph
  if [ ! -f "nsg_toggkdt_sift1M.graph" ]; then
    echo "Build nsg_toggkdt_sift1M.graph"
    ./evaluation sift1M build 1
  fi

  # Perform search
  echo "Perform kNN searching using SSG index (sift1M_L${1}K${2}T${4})"
  sudo sh -c "sync && echo 3 > /proc/sys/vm/drop_caches"
  ./evaluation sift1M search ${2} ${1} > sift1M_search_L${1}_K${2}_T${3}.log
}

gist() {
  # Build a proximity graph
  if [ ! -f "nsg_toggkdt_gist.graph" ]; then
    echo "Build nsg_toggkdt_gist.graph"
    ./evaluation gist build 1
  fi

  # Perform search
  echo "Perform kNN searching using SSG index (gist_L${1}K${2}T${4})"
  sudo sh -c "sync && echo 3 > /proc/sys/vm/drop_caches"
  ./evaluation gist search ${2} ${1} > gist_search_L${1}_K${2}_T${3}.log
}

crawl() {
  # Build a proximity graph
  if [ ! -f "nsg_toggkdt_crawl.graph" ]; then
    echo "Build nsg_toggkdt_crawl.graph"
    ./evaluation crawl build 1
  fi

  # Perform search
  echo "Perform kNN searching using SSG index (crawl_L${1}K${2}T${4})"
  sudo sh -c "sync && echo 3 > /proc/sys/vm/drop_caches"
  ./evaluation crawl search ${2} ${1} > crawl_search_L${1}_K${2}_T${3}.log
}

deep1M() {
  # Build a proximity graph
  if [ ! -f "nsg_toggkdt_deep1M.graph" ]; then
    echo "Build nsg_toggkdt_deep1M.graph"
    ./evaluation deep1M build 1
  fi

  # Perform search
  echo "Perform kNN searching using SSG index (deep1M_L${1}K${2}T${4})"
  sudo sh -c "sync && echo 3 > /proc/sys/vm/drop_caches"
  ./evaluation deep1M search ${2} ${1} > deep1M_search_L${1}_K${2}_T${3}.log
}

msong() {
  # Build a proximity graph
  if [ ! -f "nsg_toggkdt_msong.graph" ]; then
    echo "Build nsg_toggkdt_msong.graph"
    ./evaluation msong build 1
  fi

  # Perform search
  echo "Perform kNN searching using SSG index (msong_L${1}K${2}T${4})"
  sudo sh -c "sync && echo 3 > /proc/sys/vm/drop_caches"
  ./evaluation msong search ${2} ${1} > msong_search_L${1}_K${2}_T${3}.log
}

glove-100() {
  # Build a proximity graph
  if [ ! -f "nsg_toggkdt_glove-100.graph" ]; then
    echo "Build nsg_toggkdt_glove-100.graph"
    ./evaluation glove-100 build 1
  fi

  # Perform search
  echo "Perform kNN searching using SSG index (glove-100_L${1}K${2}T${4})"
  sudo sh -c "sync && echo 3 > /proc/sys/vm/drop_caches"
  ./evaluation glove-100 search ${2} ${1} > glove-100_search_L${1}_K${2}_T${3}.log
}

deep100M() {
  # Build a proximity graph
  if [ ! -f "nsg_toggkdt_deep100M.graph" ]; then
    echo "Build nsg_toggkdt_deep100M.graph"
    ./evaluation deep100M build 1
  fi

  # Perform search
  echo "Perform kNN searching using SSG index (deep100M_L${1}K${2}T${4})"
  sudo sh -c "sync && echo 3 > /proc/sys/vm/drop_caches"
  ./evaluation deep100M search ${2} ${1} > deep100M_search_L${1}_K${2}_T${3}.log
}

if [[ ${#} -eq 1 ]]; then
  if [ "${1}" == "sift1M" ]; then
    for k in ${K[@]}; do
      for l_size in ${L_SIZE[@]}; do
        declare -i l=l_size
        for t in ${THREAD[@]}; do
          sift1M ${l} ${k} ${t}
        done
      done
    done
  elif [ "${1}" == "gist" ]; then
    for k in ${K[@]}; do
      for l_size in ${L_SIZE[@]}; do
        declare -i l=l_size
        for t in ${THREAD[@]}; do
          gist ${l} ${k} ${t}
        done
      done
    done
  elif [ "${1}" == "crawl" ]; then
    for k in ${K[@]}; do
      for l_size in ${L_SIZE[@]}; do
        declare -i l=l_size
        for t in ${THREAD[@]}; do
          crawl ${l} ${k} ${t}
        done
      done
    done
  elif [ "${1}" == "deep1M" ]; then
    for k in ${K[@]}; do
      for l_size in ${L_SIZE[@]}; do
        declare -i l=l_size
        for t in ${THREAD[@]}; do
          deep1M ${l} ${k} ${t}
        done
      done
    done
  elif [ "${1}" == "glove-100" ]; then
    for k in ${K[@]}; do
      for l_size in ${L_SIZE[@]}; do
        declare -i l=l_size
        for t in ${THREAD[@]}; do
          glove-100 ${l} ${k} ${t}
        done
      done
    done
  elif [ "${1}" == "msong" ]; then
    for k in ${K[@]}; do
      for l_size in ${L_SIZE[@]}; do
        declare -i l=l_size
        for t in ${THREAD[@]}; do
          msong ${l} ${k} ${t}
        done
      done
    done
  elif [ "${1}" == "deep100M" ]; then
    for k in ${K[@]}; do
      for l_size in ${L_SIZE[@]}; do
        declare -i l=l_size
        for t in ${THREAD[@]}; do
          deep100M ${l} ${k} ${t}
        done
      done
    done
  elif [ "${1}" == "all" ]; then
    for k in ${K[@]}; do
      for t in ${THREAD[@]}; do
        for l_size in ${L_SIZE[@]}; do
          declare -i l=l_size
          sift1M ${l} ${k} ${t}
          gist ${l} ${k} ${t}
          crawl ${l} ${k} ${t}
          deep1M ${l} ${k} ${t}
          msong ${l} ${k} ${t}
          glove-100 ${l} ${k} ${t}
          deep100M ${l} ${k} ${t}
        done
      done
    done
  else
    echo "Usage: ./evalulate_baseline.sh [dataset]"
  fi
elif [[ ${#} -eq 4 ]]; then
  echo "L: ${2}, K: ${3}, T: ${4}"
  ${1} ${2} ${3} ${4}

else
  echo "Usage: ./evalulate_baseline.sh [dataset]"
fi
