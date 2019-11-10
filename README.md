flex-bison-calc
----
An implementation of the C++ calculator with flex and bison presented in the official tutorial [1].

## Setup
Install flex and bison [2]

```
$ brew install flex
$ brew install bison
```

Then, clone this repository and compile

```
$ git clone https://github.com/Ktakuya332C/flex-bison-calc.git
$ cd flex-bison-calc
$ make
```

## Usage
This repository provides one command line tool `build/main`.
The tool accepts inputs from a file and output the result of calaculation as

```
$ ./build/main example.txt
49
```

Also, the command accepts inputs from stdin

```
$ cat "one + two" | ./build/main -
3
```

## References
1. https://www.gnu.org/software/bison/manual/html_node/A-Complete-C_002b_002b-Example.html
2. http://www.jonathanbeard.io/tutorials/FlexBisonC++
