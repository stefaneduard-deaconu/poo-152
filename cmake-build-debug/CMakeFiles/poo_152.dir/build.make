# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

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

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /snap/clion/145/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /snap/clion/145/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/stefan/Desktot/poo-152

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/stefan/Desktot/poo-152/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/poo_152.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/poo_152.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/poo_152.dir/flags.make

CMakeFiles/poo_152.dir/main.cpp.o: CMakeFiles/poo_152.dir/flags.make
CMakeFiles/poo_152.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/stefan/Desktot/poo-152/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/poo_152.dir/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/poo_152.dir/main.cpp.o -c /home/stefan/Desktot/poo-152/main.cpp

CMakeFiles/poo_152.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/poo_152.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/stefan/Desktot/poo-152/main.cpp > CMakeFiles/poo_152.dir/main.cpp.i

CMakeFiles/poo_152.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/poo_152.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/stefan/Desktot/poo-152/main.cpp -o CMakeFiles/poo_152.dir/main.cpp.s

CMakeFiles/poo_152.dir/dynamic/Person.cpp.o: CMakeFiles/poo_152.dir/flags.make
CMakeFiles/poo_152.dir/dynamic/Person.cpp.o: ../dynamic/Person.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/stefan/Desktot/poo-152/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/poo_152.dir/dynamic/Person.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/poo_152.dir/dynamic/Person.cpp.o -c /home/stefan/Desktot/poo-152/dynamic/Person.cpp

CMakeFiles/poo_152.dir/dynamic/Person.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/poo_152.dir/dynamic/Person.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/stefan/Desktot/poo-152/dynamic/Person.cpp > CMakeFiles/poo_152.dir/dynamic/Person.cpp.i

CMakeFiles/poo_152.dir/dynamic/Person.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/poo_152.dir/dynamic/Person.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/stefan/Desktot/poo-152/dynamic/Person.cpp -o CMakeFiles/poo_152.dir/dynamic/Person.cpp.s

CMakeFiles/poo_152.dir/dynamic/PersonArray.cpp.o: CMakeFiles/poo_152.dir/flags.make
CMakeFiles/poo_152.dir/dynamic/PersonArray.cpp.o: ../dynamic/PersonArray.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/stefan/Desktot/poo-152/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/poo_152.dir/dynamic/PersonArray.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/poo_152.dir/dynamic/PersonArray.cpp.o -c /home/stefan/Desktot/poo-152/dynamic/PersonArray.cpp

CMakeFiles/poo_152.dir/dynamic/PersonArray.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/poo_152.dir/dynamic/PersonArray.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/stefan/Desktot/poo-152/dynamic/PersonArray.cpp > CMakeFiles/poo_152.dir/dynamic/PersonArray.cpp.i

CMakeFiles/poo_152.dir/dynamic/PersonArray.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/poo_152.dir/dynamic/PersonArray.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/stefan/Desktot/poo-152/dynamic/PersonArray.cpp -o CMakeFiles/poo_152.dir/dynamic/PersonArray.cpp.s

# Object files for target poo_152
poo_152_OBJECTS = \
"CMakeFiles/poo_152.dir/main.cpp.o" \
"CMakeFiles/poo_152.dir/dynamic/Person.cpp.o" \
"CMakeFiles/poo_152.dir/dynamic/PersonArray.cpp.o"

# External object files for target poo_152
poo_152_EXTERNAL_OBJECTS =

poo_152: CMakeFiles/poo_152.dir/main.cpp.o
poo_152: CMakeFiles/poo_152.dir/dynamic/Person.cpp.o
poo_152: CMakeFiles/poo_152.dir/dynamic/PersonArray.cpp.o
poo_152: CMakeFiles/poo_152.dir/build.make
poo_152: CMakeFiles/poo_152.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/stefan/Desktot/poo-152/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable poo_152"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/poo_152.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/poo_152.dir/build: poo_152

.PHONY : CMakeFiles/poo_152.dir/build

CMakeFiles/poo_152.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/poo_152.dir/cmake_clean.cmake
.PHONY : CMakeFiles/poo_152.dir/clean

CMakeFiles/poo_152.dir/depend:
	cd /home/stefan/Desktot/poo-152/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/stefan/Desktot/poo-152 /home/stefan/Desktot/poo-152 /home/stefan/Desktot/poo-152/cmake-build-debug /home/stefan/Desktot/poo-152/cmake-build-debug /home/stefan/Desktot/poo-152/cmake-build-debug/CMakeFiles/poo_152.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/poo_152.dir/depend

