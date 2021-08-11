BIN=decode
TARBALL=sysoft-project.tar.gz

all: $(BIN) 

$(BIN): libhack.so decode.o libcypher.so
	gcc -m32 -L. -o $@ decode.o -lhack -lcypher -Wl,-rpath='$$ORIGIN'

libhack.so: bypass.o change_fix.o
	gcc -m32 --shared $^ -o $@

bypass.o: bypass.c
	gcc -m32 -c $^

change_fix.o: change_fix.s
	as -32 $< -o $@

.PHONY: clean compress
compress: 
	tar -czvf $(TARBALL) decode.o bypass.c change_fix.s libcypher.so Makefile

clean:
	rm -f $(BIN) $(TARBALL) bypass.o fix.o change_fix.o libhack.so
