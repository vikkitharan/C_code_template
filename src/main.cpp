#include <iostream>
#include <cstdlib>
#include "module.hpp"  // Updated header for C++ module

int main(int argc, char* argv[]) {
    int a = 1, b = 2;

    std::cout << "Program started." << std::endl;

#if DEBUG
    std::cout << "[DEBUG] argc=" << argc << std::endl;
#endif

    if (argc > 1) {
        std::cout << "Argument: " << argv[1] << std::endl;
    } else {
        std::cout << "No arguments provided." << std::endl;
    }

    // Call functions in Project namespace
    Project::greet();
    std::cout << a << " + " << b << " = " << Project::add(a, b) << std::endl;

    std::cout << "Program finished." << std::endl;
    return EXIT_SUCCESS;
}
