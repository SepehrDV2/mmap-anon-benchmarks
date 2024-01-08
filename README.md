# mmap Benchmark


Basic mmap performance microbecnhmarks derived from the CIDR 2022 paper "Are You Sure You Want to Use MMAP in Your Database Management System?" by Andrew Crotty, Viktor Leis, and Andrew Pavlo

Building:

g++ -O3 -g mmapbench.cpp -o mmapbench -ltbb -pthread

running:

./mmapbench device num_threads seq/rand hint

running for extmem:
./mmapbench device num_threads seq/rand/rand_hotset hint hugepage write
