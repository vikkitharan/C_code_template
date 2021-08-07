# check memory leak using valgrind
valgrind \
  --leak-check=full \
  --show-leak-kinds=all \
  ./bin/main
