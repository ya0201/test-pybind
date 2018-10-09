CC = gcc -Wall -Wno-unused -MD
CXX = g++ -Wall -Wno-unused -MD

all: example

EXAMPLE_SRC = hoge.c

EXAMPLE_OBJ = $(EXAMPLE_SRC:.c=.o) 

$(EXAMPLE_OBJ): %.o: %.c
	$(CC) -c $< -o $@

example.o: example.cpp
	$(CXX) -O3 -Wall -std=c++11 `python2 -m pybind11 --includes` example.cpp -c

example: example.o hoge.o
	$(CXX) -O3 -Wall -shared -std=c++11 -undefined dynamic_lookup example.o hoge.o -o example.so

clean:
	rm *.d *.o *.so
