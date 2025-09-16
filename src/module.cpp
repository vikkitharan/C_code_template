#include "module.hpp"

namespace Project {

// Prints a greeting message
void greet() {
#if DEBUG
    std::cout << "[DEBUG] Greeting function called." << std::endl;
#endif
    std::cout << "Hello, world!" << std::endl;
}

// Returns the sum of two integers
int add(int a, int b) {
    return a + b;
}

} // namespace Project
