# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/build

# Include any dependencies generated for this target.
include tests/CMakeFiles/range_search_disk_index.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include tests/CMakeFiles/range_search_disk_index.dir/compiler_depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/range_search_disk_index.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/range_search_disk_index.dir/flags.make

tests/CMakeFiles/range_search_disk_index.dir/range_search_disk_index.cpp.o: tests/CMakeFiles/range_search_disk_index.dir/flags.make
tests/CMakeFiles/range_search_disk_index.dir/range_search_disk_index.cpp.o: ../tests/range_search_disk_index.cpp
tests/CMakeFiles/range_search_disk_index.dir/range_search_disk_index.cpp.o: tests/CMakeFiles/range_search_disk_index.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/range_search_disk_index.dir/range_search_disk_index.cpp.o"
	cd /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/build/tests && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT tests/CMakeFiles/range_search_disk_index.dir/range_search_disk_index.cpp.o -MF CMakeFiles/range_search_disk_index.dir/range_search_disk_index.cpp.o.d -o CMakeFiles/range_search_disk_index.dir/range_search_disk_index.cpp.o -c /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/tests/range_search_disk_index.cpp

tests/CMakeFiles/range_search_disk_index.dir/range_search_disk_index.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/range_search_disk_index.dir/range_search_disk_index.cpp.i"
	cd /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/build/tests && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/tests/range_search_disk_index.cpp > CMakeFiles/range_search_disk_index.dir/range_search_disk_index.cpp.i

tests/CMakeFiles/range_search_disk_index.dir/range_search_disk_index.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/range_search_disk_index.dir/range_search_disk_index.cpp.s"
	cd /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/build/tests && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/tests/range_search_disk_index.cpp -o CMakeFiles/range_search_disk_index.dir/range_search_disk_index.cpp.s

tests/CMakeFiles/range_search_disk_index.dir/__/src/aux_utils.cpp.o: tests/CMakeFiles/range_search_disk_index.dir/flags.make
tests/CMakeFiles/range_search_disk_index.dir/__/src/aux_utils.cpp.o: ../src/aux_utils.cpp
tests/CMakeFiles/range_search_disk_index.dir/__/src/aux_utils.cpp.o: tests/CMakeFiles/range_search_disk_index.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object tests/CMakeFiles/range_search_disk_index.dir/__/src/aux_utils.cpp.o"
	cd /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/build/tests && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT tests/CMakeFiles/range_search_disk_index.dir/__/src/aux_utils.cpp.o -MF CMakeFiles/range_search_disk_index.dir/__/src/aux_utils.cpp.o.d -o CMakeFiles/range_search_disk_index.dir/__/src/aux_utils.cpp.o -c /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/src/aux_utils.cpp

tests/CMakeFiles/range_search_disk_index.dir/__/src/aux_utils.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/range_search_disk_index.dir/__/src/aux_utils.cpp.i"
	cd /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/build/tests && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/src/aux_utils.cpp > CMakeFiles/range_search_disk_index.dir/__/src/aux_utils.cpp.i

tests/CMakeFiles/range_search_disk_index.dir/__/src/aux_utils.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/range_search_disk_index.dir/__/src/aux_utils.cpp.s"
	cd /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/build/tests && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/src/aux_utils.cpp -o CMakeFiles/range_search_disk_index.dir/__/src/aux_utils.cpp.s

# Object files for target range_search_disk_index
range_search_disk_index_OBJECTS = \
"CMakeFiles/range_search_disk_index.dir/range_search_disk_index.cpp.o" \
"CMakeFiles/range_search_disk_index.dir/__/src/aux_utils.cpp.o"

# External object files for target range_search_disk_index
range_search_disk_index_EXTERNAL_OBJECTS =

tests/range_search_disk_index: tests/CMakeFiles/range_search_disk_index.dir/range_search_disk_index.cpp.o
tests/range_search_disk_index: tests/CMakeFiles/range_search_disk_index.dir/__/src/aux_utils.cpp.o
tests/range_search_disk_index: tests/CMakeFiles/range_search_disk_index.dir/build.make
tests/range_search_disk_index: src/libdiskann.a
tests/range_search_disk_index: tests/CMakeFiles/range_search_disk_index.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable range_search_disk_index"
	cd /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/range_search_disk_index.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/range_search_disk_index.dir/build: tests/range_search_disk_index
.PHONY : tests/CMakeFiles/range_search_disk_index.dir/build

tests/CMakeFiles/range_search_disk_index.dir/clean:
	cd /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/range_search_disk_index.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/range_search_disk_index.dir/clean

tests/CMakeFiles/range_search_disk_index.dir/depend:
	cd /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/tests /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/build /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/build/tests /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/build/tests/CMakeFiles/range_search_disk_index.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/range_search_disk_index.dir/depend

