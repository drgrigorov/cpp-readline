CC=g++
FLAGS=-std=c++11
LIBS=-lreadline
LIBNAME=libcpprl.so
LIBDIR=lib/

all: obj/Console.o
	${CC} ${FLAGS} -shared -Wl,-soname,${LIBNAME} -o ${LIBDIR}${LIBNAME} $^

obj/Console.o: src/Console.cpp
	${CC} ${FLAGS} -fPIC -c $^ -o $@
	
example:
	${CC} ${FLAGS} example/main.cpp src/Console.cpp ${LIBS} -o constest

clean:
	rm obj/*.o
