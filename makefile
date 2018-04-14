CC=gcc
CFLAGS=-I./

all: parallel_min_max parallel_sum #process_memory

process_memory: process_memory.c
	$(CC) -o process_memory process_memory.c $(CFLAGS)

parallel_sum: lib/lib_sum.a task1/utils.o task1/utils.h
	$(CC) -o parallel_sum parallel_sum.c task1/utils.o -lpthread -Llib -l_sum $(CFLAGS)

lib/lib_sum.a: lib/lib_sum.o
	ar rcs lib/lib_sum.a lib/lib_sum.o

lib/lib_sum.o: lib/lib_sum.c
	$(CC) -o lib/lib_sum.o -c lib/lib_sum.c $(CFLAGS)

task1/utils.o: parallel_min_max

parallel_min_max : 
	make -C task1

clean :
	-rm parallel_sum lib/lib_sum.a lib/lib_sum.o process_memory
	make -C task1 clean