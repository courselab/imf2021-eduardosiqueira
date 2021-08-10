1. Inspect the artifacts.

`file` command output:
* decode.o: ELF 32-bit LSB relocatable, Intel 80386, version 1 (SYSV), not stripped
* libcypher.so: ELF 32-bit LSB shared object, Intel 80386, version 1 (SYSV), dynamically linked, BuildID[sha1]=672806f57c71050b90766548830b6e6a1f817f3b, not stripped

`readelf -h` command output:
decode.o:
ELF Header:
  Magic:   7f 45 4c 46 01 01 01 00 00 00 00 00 00 00 00 00 
  Class:                             ELF32
  Data:                              2's complement, little endian
  Version:                           1 (current)
  OS/ABI:                            UNIX - System V
  ABI Version:                       0
  Type:                              REL (Relocatable file)
  Machine:                           Intel 80386
  Version:                           0x1
  Entry point address:               0x0
  Start of program headers:          0 (bytes into file)
  Start of section headers:          2384 (bytes into file)
  Flags:                             0x0
  Size of this header:               52 (bytes)
  Size of program headers:           0 (bytes)
  Number of program headers:         0
  Size of section headers:           40 (bytes)
  Number of section headers:         14
  Section header string table index: 13
libcypher.so:
ELF Header:
  Magic:   7f 45 4c 46 01 01 01 00 00 00 00 00 00 00 00 00 
  Class:                             ELF32
  Data:                              2's complement, little endian
  Version:                           1 (current)
  OS/ABI:                            UNIX - System V
  ABI Version:                       0
  Type:                              DYN (Shared object file)
  Machine:                           Intel 80386
  Version:                           0x1
  Entry point address:               0x1050
  Start of program headers:          52 (bytes into file)
  Start of section headers:          14260 (bytes into file)
  Flags:                             0x0
  Size of this header:               52 (bytes)
  Size of program headers:           32 (bytes)
  Number of program headers:         9
  Size of section headers:           40 (bytes)
  Number of section headers:         27
  Section header string table index: 26

---
2. Write a Make script to build the software.
* gcc needs to be used in 32-bit mode, with flag -m32
* [libcypher.so] is a shared library. To link it, compile with flag -lcypher
* option _-Wl,-rpath=._ in gcc used to pass the current directory as run path for the linker.
Makefile has two options: *build*, to create the "decode" binary, and *compress* to create a tarball with the original files plus the "decode" binary.
---
3. Execute the program.
Program returns "Access denied.", the expected behaviour.