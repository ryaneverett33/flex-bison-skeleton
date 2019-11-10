CXX=g++
CXXFLAGS = -Wall -std=c++11 -O2 -Isrc -Ibuild
FLEX=/usr/local/opt/flex/bin/flex
BISON=/usr/local/opt/bison/bin/bison

.PHONY: clean prebuild all
all: clean prebuild build/main

clean:
	rm -rf build

prebuild:
	mkdir -p build

build/main: build/parser.o build/scanner.o build/main.o build/driver.o
	$(CXX) $(CXXFLAGS) -o $@ $^

build/main.o: src/main.cc
	$(CXX) $(CXXFLAGS) -o $@ -c $^

build/driver.o: src/driver.cc
	$(CXX) $(CXXFLAGS) -o $@ -c $^

build/scanner.o: build/scanner.cc
	$(CXX) $(CXXFLAGS) -o $@ -c $^

build/parser.o: build/parser.cc
	$(CXX) $(CXXFLAGS) -o $@ -c $^

build/scanner.cc: src/scanner.ll
	$(FLEX) -o $@ $^

build/parser.cc: src/parser.yy
	$(BISON) -o $@ $^

