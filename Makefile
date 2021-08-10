BIN=decode
TARBALL=sysoft-project.tar.gz

.PHONY: clean build compress
all: build

build: $(BIN)

$(BIN): decode.o libcypher.so
	gcc -m32 -L. -o $@ $< -lcypher -Wl,-rpath=.

compress: $(BIN)
	tar -czf $(TARBALL) $(BIN) crypt1.dat crypt2.dat decode.o libcypher.so

clean:
	rm -f $(BIN) $(TARBALL)

