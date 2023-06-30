#include <stdio.h>
#include <stdlib.h>
#include "module.h"


int main(int argc, char *argv[]) {
    int a, b;
    printf("Program started.\n");

#if DEBUG
    printf("[DEBUG] argc=%d\n", argc);
#endif

    if (argc > 1) {
        printf("Argument: %s\n", argv[1]);
    } else {
        printf("No arguments provided.\n");
    }

  greet();

    a = 1; 
    b = 2;

    printf("%d + %d = %d\n", a, b, add(a,b));

    printf("Program finished.\n");
    return EXIT_SUCCESS;
}
