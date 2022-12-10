flex-bison-skeleton
----
A small sample app (based on the official tutorial) for Flex/Bison to use as a skeleton for projects. For more info on using Flex/Bison, and for a more comprehensive example, see the parent repo at [Ktakuya332C/flex-bison-calc](https://github.com/Ktakuya332C/flex-bison-calc) and the official [Bison docs](https://www.gnu.org/software/bison/manual/html_node/Examples.html).

## Setup

This skeleton is built using CMake, see the [docs](https://cmake.org/install/) for how to install it for your platform.

### Setup - macOS

The versions of flex and bison that are distributed with Xcode are too old, so we need to install newer versions with [homebrew](https://brew.sh/).

```sh
$ brew install flex
$ brew install bison
```

Once they're installed, we need to `link` them through homebrew so that CMake can find them more easily:

```sh
$ brew link flex
$ brew link bison
```

### Setup - Linux

Install flex and bison through whatever package manager you have:

Ubuntu/Debian:

```sh
$ apt install bison
$ apt install flex 
```

Alpine/Arch:
```sh
$ apk add bison
$ apk add flex
```

## Building

After setup is done, you can clone the repository and build the project to make sure everything works. The following will build the project in a temporary `build/` directory which is strongly advised since bison/flex will generate artifacts that may pollute your VCS.

```
$ git clone git@github.com:ryaneverett33/flex-bison-skeleton.git
$ cd flex-bison-skeleton
$ # make a build directory to build the project in
$ mkdir build
$ cmake ../
$ cmake --build .
```

The resultant binary should be found at `build/Calculator`.

## Usage

You can verify the example works by supplying inputs to the built `Calculator` binary. A sample file has been included in [example.txt](example.txt). 

NOTE: The functionality of the sample app has been reduced significantly so things like variables aren't supported anymore.

```sh
$ ./build/Calculator example.txt
49
```

The sample also accepts input from standard in:

```sh
$ echo "1 + 2" | ./build/Calculator -
3
```