BIN=decode
TARBALL=sysoft-project.tar.gz

all: $(BIN) 

$(BIN): bypass.o change_fix.o decode.o libcypher.so
	gcc -m32 -L. -o $@ change_fix.o bypass.o decode.o -lcypher -Wl,-rpath='$$ORIGIN'

bypass.o: bypass.c
	gcc -m32 -c $^

change_fix.o: change_fix.s
	as -32 $< -o $@

.PHONY: clean compress
compress: 
	tar -czvf $(TARBALL) decode.o bypass.c change_fix.s libcypher.so Makefile

clean:
	rm -f $(BIN) $(TARBALL) bypass.o fix.o change_fix.o
