#include <pybind11/pybind11.h>
#include <pybind11/stl.h>
#include <cstdlib>
extern "C" {
#include "hoge.h"
}

namespace py = pybind11;
int global_num = 0;

int test() {
  return hoge(++global_num);
}

void reset() {
  global_num = 0;
}

std::vector<double> getDoubleVec() {
  std::vector<double> v = {(double)rand()/RAND_MAX, (double)rand()/RAND_MAX, (double)rand()/RAND_MAX};
  return v;
}

PYBIND11_MODULE(example, m) {
  m.doc() = "pybind11 example plugin";

  m.def("test", &test, "A function returns number of call");
  m.def("reset", &reset, "A function resets global number");
  m.def("getDoubleVec", &getDoubleVec, "A function returns vector<double>");
}
