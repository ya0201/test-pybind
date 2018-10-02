## requirement
```
sudo apt-get install python-dev
curl -kL https://bootstrap.pypa.io/get-pip.py | sudo python  # pip既に入ってるなら省く
sudo pip install pybind11
```
python3でやるなら，上の各python/pipをpython3/pip3にし，Makefile中のpythonもpython3にする

## usage
```
$ make
$ python
>>> import example
```

## Makefileを書く気持ち
`#include <pybind...>`している.cppファイルをコンパイルする時，python-devで入った諸々のソースファイル
へのインクルードパスをMakefile中で通さないとPython.cが無いと言われるので注意
