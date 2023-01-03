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
include tests/utils/CMakeFiles/float_bin_to_int8.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include tests/utils/CMakeFiles/float_bin_to_int8.dir/compiler_depend.make

# Include the progress variables for this target.
include tests/utils/CMakeFiles/float_bin_to_int8.dir/progress.make

# Include the compile flags for this target's objects.
include tests/utils/CMakeFiles/float_bin_to_int8.dir/flags.make

tests/utils/CMakeFiles/float_bin_to_int8.dir/float_bin_to_int8.cpp.o: tests/utils/CMakeFiles/float_bin_to_int8.dir/flags.make
tests/utils/CMakeFiles/float_bin_to_int8.dir/float_bin_to_int8.cpp.o: ../tests/utils/float_bin_to_int8.cpp
tests/utils/CMakeFiles/float_bin_to_int8.dir/float_bin_to_int8.cpp.o: tests/utils/CMakeFiles/float_bin_to_int8.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/utils/CMakeFiles/float_bin_to_int8.dir/float_bin_to_int8.cpp.o"
	cd /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/build/tests/utils && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT tests/utils/CMakeFiles/float_bin_to_int8.dir/float_bin_to_int8.cpp.o -MF CMakeFiles/float_bin_to_int8.dir/float_bin_to_int8.cpp.o.d -o CMakeFiles/float_bin_to_int8.dir/float_bin_to_int8.cpp.o -c /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/tests/utils/float_bin_to_int8.cpp

tests/utils/CMakeFiles/float_bin_to_int8.dir/float_bin_to_int8.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/float_bin_to_int8.dir/float_bin_to_int8.cpp.i"
	cd /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/build/tests/utils && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/tests/utils/float_bin_to_int8.cpp > CMakeFiles/float_bin_to_int8.dir/float_bin_to_int8.cpp.i

tests/utils/CMakeFiles/float_bin_to_int8.dir/float_bin_to_int8.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/float_bin_to_int8.dir/float_bin_to_int8.cpp.s"
	cd /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/build/tests/utils && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/tests/utils/float_bin_to_int8.cpp -o CMakeFiles/float_bin_to_int8.dir/float_bin_to_int8.cpp.s

# Object files for target float_bin_to_int8
float_bin_to_int8_OBJECTS = \
"CMakeFiles/float_bin_to_int8.dir/float_bin_to_int8.cpp.o"

# External object files for target float_bin_to_int8
float_bin_to_int8_EXTERNAL_OBJECTS =

tests/utils/float_bin_to_int8: tests/utils/CMakeFiles/float_bin_to_int8.dir/float_bin_to_int8.cpp.o
tests/utils/float_bin_to_int8: tests/utils/CMakeFiles/float_bin_to_int8.dir/build.make
tests/utils/float_bin_to_int8: tests/utils/CMakeFiles/float_bin_to_int8.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable float_bin_to_int8"
	cd /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/build/tests/utils && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/float_bin_to_int8.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/utils/CMakeFiles/float_bin_to_int8.dir/build: tests/utils/float_bin_to_int8
.PHONY : tests/utils/CMakeFiles/float_bin_to_int8.dir/build

tests/utils/CMakeFiles/float_bin_to_int8.dir/clean:
	cd /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/build/tests/utils && $(CMAKE_COMMAND) -P CMakeFiles/float_bin_to_int8.dir/cmake_clean.cmake
.PHONY : tests/utils/CMakeFiles/float_bin_to_int8.dir/clean

tests/utils/CMakeFiles/float_bin_to_int8.dir/depend:
	cd /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/tests/utils /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/build /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/build/tests/utils /home2/sungjun/HYNIX_NDP/GraphANNS/TOGG/algorithms/TOGG-KDT/vamana/build/tests/utils/CMakeFiles/float_bin_to_int8.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/utils/CMakeFiles/float_bin_to_int8.dir/depend

