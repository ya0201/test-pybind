# LDFLAGS = -L. -ldisksim $(DISKMODEL_LDFLAGS) $(MEMSMODEL_LDFLAGS) \
#                             $(SSDMODEL_LDFLAGS) \
#                             $(LIBPARAM_LDFLAGS) $(LIBDDBG_LDFLAGS) -lm

#CC = cc
CC = gcc -Wall -Wno-unused -MD
CXX = g++ -Wall -Wno-unused -MD

all: example

# clean:
#   rm -f TAGS *.o disksim syssim rms hplcomb core libdisksim.a yusim
#   $(MAKE) -C modules clean

EXAMPLE_SRC = hoge.c

EXAMPLE_OBJ = $(EXAMPLE_SRC:.c=.o) 

$(EXAMPLE_OBJ): %.o: %.c
	# $(CC) -c $(CFLAGS) $< -o $@
	$(CC) -c $< -o $@

example.o: example.cpp
	$(CXX) -O3 -Wall -std=c++11 `python -m pybind11 --includes` example.cpp -c

example: example.o hoge.o
	$(CXX) -O3 -Wall -shared -std=c++11 -undefined dynamic_lookup example.o hoge.o -o example.so

clean:
	rm *.d *.o *.so
