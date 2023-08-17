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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/rcc07/rcc-pico/dev/pico

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/rcc07/rcc-pico/dev/pico/python

# Include any dependencies generated for this target.
include lib/external/CMakeFiles/hash-library-sha1.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include lib/external/CMakeFiles/hash-library-sha1.dir/compiler_depend.make

# Include the progress variables for this target.
include lib/external/CMakeFiles/hash-library-sha1.dir/progress.make

# Include the compile flags for this target's objects.
include lib/external/CMakeFiles/hash-library-sha1.dir/flags.make

lib/external/CMakeFiles/hash-library-sha1.dir/hash-library/sha1.cpp.obj: lib/external/CMakeFiles/hash-library-sha1.dir/flags.make
lib/external/CMakeFiles/hash-library-sha1.dir/hash-library/sha1.cpp.obj: /home/rcc07/rcc-pico/lib/external/hash-library/sha1.cpp
lib/external/CMakeFiles/hash-library-sha1.dir/hash-library/sha1.cpp.obj: lib/external/CMakeFiles/hash-library-sha1.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/rcc07/rcc-pico/dev/pico/python/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object lib/external/CMakeFiles/hash-library-sha1.dir/hash-library/sha1.cpp.obj"
	cd /home/rcc07/rcc-pico/dev/pico/python/lib/external && /usr/bin/arm-none-eabi-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT lib/external/CMakeFiles/hash-library-sha1.dir/hash-library/sha1.cpp.obj -MF CMakeFiles/hash-library-sha1.dir/hash-library/sha1.cpp.obj.d -o CMakeFiles/hash-library-sha1.dir/hash-library/sha1.cpp.obj -c /home/rcc07/rcc-pico/lib/external/hash-library/sha1.cpp

lib/external/CMakeFiles/hash-library-sha1.dir/hash-library/sha1.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/hash-library-sha1.dir/hash-library/sha1.cpp.i"
	cd /home/rcc07/rcc-pico/dev/pico/python/lib/external && /usr/bin/arm-none-eabi-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/rcc07/rcc-pico/lib/external/hash-library/sha1.cpp > CMakeFiles/hash-library-sha1.dir/hash-library/sha1.cpp.i

lib/external/CMakeFiles/hash-library-sha1.dir/hash-library/sha1.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/hash-library-sha1.dir/hash-library/sha1.cpp.s"
	cd /home/rcc07/rcc-pico/dev/pico/python/lib/external && /usr/bin/arm-none-eabi-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/rcc07/rcc-pico/lib/external/hash-library/sha1.cpp -o CMakeFiles/hash-library-sha1.dir/hash-library/sha1.cpp.s

# Object files for target hash-library-sha1
hash__library__sha1_OBJECTS = \
"CMakeFiles/hash-library-sha1.dir/hash-library/sha1.cpp.obj"

# External object files for target hash-library-sha1
hash__library__sha1_EXTERNAL_OBJECTS =

lib/external/libhash-library-sha1.a: lib/external/CMakeFiles/hash-library-sha1.dir/hash-library/sha1.cpp.obj
lib/external/libhash-library-sha1.a: lib/external/CMakeFiles/hash-library-sha1.dir/build.make
lib/external/libhash-library-sha1.a: lib/external/CMakeFiles/hash-library-sha1.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/rcc07/rcc-pico/dev/pico/python/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libhash-library-sha1.a"
	cd /home/rcc07/rcc-pico/dev/pico/python/lib/external && $(CMAKE_COMMAND) -P CMakeFiles/hash-library-sha1.dir/cmake_clean_target.cmake
	cd /home/rcc07/rcc-pico/dev/pico/python/lib/external && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hash-library-sha1.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/external/CMakeFiles/hash-library-sha1.dir/build: lib/external/libhash-library-sha1.a
.PHONY : lib/external/CMakeFiles/hash-library-sha1.dir/build

lib/external/CMakeFiles/hash-library-sha1.dir/clean:
	cd /home/rcc07/rcc-pico/dev/pico/python/lib/external && $(CMAKE_COMMAND) -P CMakeFiles/hash-library-sha1.dir/cmake_clean.cmake
.PHONY : lib/external/CMakeFiles/hash-library-sha1.dir/clean

lib/external/CMakeFiles/hash-library-sha1.dir/depend:
	cd /home/rcc07/rcc-pico/dev/pico/python && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/rcc07/rcc-pico/dev/pico /home/rcc07/rcc-pico/lib/external /home/rcc07/rcc-pico/dev/pico/python /home/rcc07/rcc-pico/dev/pico/python/lib/external /home/rcc07/rcc-pico/dev/pico/python/lib/external/CMakeFiles/hash-library-sha1.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/external/CMakeFiles/hash-library-sha1.dir/depend

