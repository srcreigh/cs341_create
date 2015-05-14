# cs341_create

Template directory creator for cs341 assignment programming questions.
For each question, it automatically generates:

* a testing harness
* a makefile for building and testing
* a .gitignore file

## setup

1. Clone this repository somewhere.
2. Add `cs341_create/bin` to your PATH.

## try it out!

Just run `cs341_create example && cd example` and poke around in that directory. You can:

1. Check out the example c++ file, `example.cpp`
2. Run the default tests with `make test`
3. Add your own tests by creating `tests/your-test.in` and `tests/your-test.out` files.

## example usage

CS341 solutions are in a single file `FILENAME.cpp`. The command `make test` runs
all the tests in the `FILENAME/tests/` directory. It looks for files in the
`tests` directory that end in `.in`, and then compares the output of your
program with the corresponding `.out` file. For example:

```
$ cs341_create example
$ cd example
$ cat example.cpp
#include <iostream>

int main(int argc, char **argv) {
  std::cout << "Hello world!" << std::endl;
  return 0;
}

$ cat tests/helloworld.in
$ cat tests/helloworld.out
Hello world!

$ make test
clang++ -std=c++11 -o example example.cpp
./run-tests example

running helloworld...

1 passed
0 failed

```
