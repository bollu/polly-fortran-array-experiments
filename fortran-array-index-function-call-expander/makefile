
all: clean lib ll

clean:
	-rm *.o
	-rm *.so
lib:
	gcc expander.c -fpic -c -o expander.o
	gcc -shared expander.o -o libexpander.so

ll:
	$(MODERN_LLVM_BIN_PATH)/clang -S -emit-llvm expander.c -o expander.ll
