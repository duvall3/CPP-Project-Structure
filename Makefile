#-----------------------------------------------------------------------------#
#  EXECUTABLE, SOURCES, OBJECTS AND PROJECT STRUCTURE                         #
#-----------------------------------------------------------------------------#

# Executable
TARGET := roll
TEST_TARGET := demo

# Project structure
PROJECT_DIRECTORY  := .
APP_DIRECTORY      := bin
OBJECTS_DIRECTORY  := build
DOCUMENT_DIRECTORY := doc
INCLUDE_DIRECTORY  := include
LIBRARY_DIRECTORY  := lib
DATA_DIRECTORY     := data
SCRIPTS_DIRECTORY  := scripts
SOURCES_DIRECTORY  := src
# SPIKE_DIRECTORY    := spike
TEST_DIRECTORY    := test

# C ++ source code which must be preprocessed.
SOURCES  := $(wildcard $(SOURCES_DIRECTORY)/*.cpp)
TEST_SOURCES  := $(wildcard $(TEST_DIRECTORY)/*.cpp)

# By default, the object file name for a source file is made by replacing the
# suffix .c, .cpp, .i, .s, etc., with .o.
OBJECTS  := $(patsubst $(SOURCES_DIRECTORY)/%.cpp,$(OBJECTS_DIRECTORY)/%.o,$(SOURCES))
TEST_OBJECTS  := $(patsubst $(TEST_DIRECTORY)/%.cpp,$(OBJECTS_DIRECTORY)/%.o,$(TEST_SOURCES))

#-----------------------------------------------------------------------------#
#  ENVIRONMENT                                                                #
#-----------------------------------------------------------------------------#

# To avoid trouble on systems where the SHELL variable might be inherited from
# the environment.
SHELL = /bin/sh

# Program for compiling C++ programs; default ‘g++’.
CXX := g++

# Extra flags to give to the C++ compiler.
# -std: standard
# -pedantic-errors: Issue all the errors demanded by strict ISO C and ISO C++.
# -Wall: Enables all the warnings about constructions.
# -Wextra: Enables some extra warning flags that are not enabled by -Wall.
# -Wshadow: Warn whenever a local variable shadows another local variable,
#           parameter or global variable or a built-in function is shadowed.
# -m64: Generate code for a 64-bit environment.
CXXFLAGS := -std=c++17 -pedantic-errors -Wall -Wextra -Werror -Wshadow -m64

# Extra flags to give to compilers when they are supposed to invoke the linker,
# ‘ld’, such as -L. Libraries (-lfoo) should be added to the LDLIBS variable
# instead.
LDFLAGS := #-L/usr/lib

# Library flags or names given to compilers when they are supposed to invoke
# the linker, ‘ld’. Non-library linker flags, such as -L, should go in the
# LDFLAGS variable.
LDLIBS := #-lstdc++ -lm

# -I dir: Add the directory dir to the list of directories to be searched for
#         header files. C, C++ , Objective-C or Objective-C++ header file to be
#         turned into a precompiled header.
INCLUDES := -I$(INCLUDE_DIRECTORY)

# Command to remove a file; default ‘rm -f’.
# r: recursive, v: verbose, f: force.
RM = /usr/bin/rm -rvf

# Make directory if it does not exsist.
MKDIR_P = mkdir -p

#-----------------------------------------------------------------------------#
#  RECIPES                                                                    #
#-----------------------------------------------------------------------------#

# A phony target is one that is not really the name of a file; rather it is
# just a name for a recipe to be executed when you make an explicit request.
.PHONY: all build clean debug release test echo

# Make all the top-level targets the makefile knows about.
all: build $(APP_DIRECTORY)/$(TARGET)

# The rule that links libraries to the target.
# -o outfile: Place output in file outfile. If -o is not specified, the default
#             is to put an executable file in a.out.
# $@: The file name of the target.
# $^: The names of all the prerequisites, with spaces between them.
$(APP_DIRECTORY)/$(TARGET): $(OBJECTS)
	@echo "Linking..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $(LDFLAGS) -o $@ $^ $(LDLIBS)
	@echo "Copying target to project directory..."
	cp $(APP_DIRECTORY)/$(TARGET) $(PROJECT_DIRECTORY)/$(TARGET)

# The rule that compiles ‘.cpp’ files into ‘.o’ files.
# The recipe uses the automatic variables ‘$@’ and ‘$<’ to substitute the names
# of the target file and the source file in each case where the rule applies.
# $@: The file name of the target.
# $<: The name of the first prerequisite.
$(OBJECTS): $(OBJECTS_DIRECTORY)/%.o: $(SOURCES_DIRECTORY)/%.cpp
	@echo "Compiling..."
	$(CXX) -c $(CXXFLAGS) $(INCLUDES) $< -o $@

# When a line starts with ‘@’, the echoing of that line is suppressed. The ‘@’
# is discarded before the line is passed to the shell. Typically you would use
# this for a command whose only effect is to print something, such as an echo
# command to indicate progress through the makefile.
build:
	@$(MKDIR_P) $(APP_DIRECTORY)
	@$(MKDIR_P) $(OBJECTS_DIRECTORY)
	@$(MKDIR_P) $(DOCUMENT_DIRECTORY)
	@$(MKDIR_P) $(DATA_DIRECTORY)
	@$(MKDIR_P) $(INCLUDE_DIRECTORY)
	@$(MKDIR_P) $(LIBRARY_DIRECTORY)
	@#$(MKDIR_P) $(SCRIPTS_DIRECTORY)
	@$(MKDIR_P) $(SOURCES_DIRECTORY)
	@#$(MKDIR_P) $(SPIKE_DIRECTORY)
	@$(MKDIR_P) $(TEST_DIRECTORY)

# -g: Produce debugging information in the operating system's native format.
debug: CXXFLAGS += -DDEBUG -g
debug: all

# -O0: Reduce compilation time and make debugging produce the expected results.
#      This is the default.
# -O1: Optimize. Optimizing compilation takes somewhat more time, and a lot
#      more memory for a large function.
# -O2: Optimization flag. GCC performs nearly all supported optimizations that
#      do not involve a space-speed tradeoff.
# -O3: Optimize even more. -O3 turns on all optimizations specified by -O2 and
#      also turns on other optimization flags.
# -Os: Optimize for size. -Os enables all -O2 optimizations that do not
#      typically increase code size. It also performs further optimizations
#      designed to reduce code size.
release: CXXFLAGS += -O2
release: all

# Compile tests:
# test: #CXXFLAGS += 
test: all bin/demo
bin/demo: demo.o
	@echo "Linking demo..."
	$(CXX) $(CXXFLAGS) $(INCLUDES) $(LDFLAGS) -o bin/demo build/demo.o $(LDLIBS)
demo.o:
	@echo "Compiling demo..."
	$(CXX) -c $(CXXFLAGS) $(INCLUDES) test/demo.cpp -o build/demo.o
# # test: #CXXFLAGS += 
# test: all $(APP_DIRECTORY)/$(TEST_TARGET)
# $(APP_DIRECTORY)/$(TEST_TARGET): $(TEST_OBJECTS)
# 	@echo "Linking test(s)..."
# 	$(CXX) $(CXXFLAGS) $(INCLUDES) $(LDFLAGS) -o $@ $^ $(LDLIBS)
# $(TEST_OBJECTS): $(OBJECTS_DIRECTORY)/%.o: $(TEST_SOURCES_DIRECTORY)/%.cpp
# 	@echo "Compiling test(s)..."
# 	$(CXX) -c $(CXXFLAGS) $(INCLUDES) $< -o $@

# Print certain macros, vars, etc. #debug
echo:
	@echo
	@echo "     Sources -- $(SOURCES)"
	@echo "Test Sources -- $(TEST_SOURCES)"
	@echo
	@echo "     Objects -- $(OBJECTS)"
	@echo "Test Objects -- $(TEST_OBJECTS)"
	@echo
	@echo "Compiling Targets -- $(OBJECTS): $(OBJECTS_DIRECTORY)/%.o: $(SOURCES_DIRECTORY)/%.cpp"
	@echo "Compiling    Rule -- $(CXX) -c $(CXXFLAGS) $(INCLUDES) $< -o $@"
	@echo

# Delete all files (and directories) that are normally created by running make.
clean:
	@echo "Cleaning..."
	@$(RM) $(OBJECTS_DIRECTORY)
	@$(RM) $(APP_DIRECTORY)/$(TARGET)
	@$(RM) $(TEST_TARGET)
	@$(RM) $(APP_DIRECTORY)/$(TEST_TARGET)
	@$(RM) $(TARGET)
