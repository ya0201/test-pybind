#include <pybind11/pybind11.h>
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

PYBIND11_MODULE(example, m) {
  m.doc() = "pybind11 example plugin";

  m.def("test", &test, "A function returns number of call");
  m.def("reset", &reset, "A function resets global number");
}
