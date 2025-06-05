#include <iostream>

// Simulate a class with a constructor
struct Class {
    int value;
    Class() {
        std::cout << "Class constructor\n";
        value = 42;
    }
};

// Another TLS class
struct Class2 {
    Class2() {
        std::cout << "Class2 constructor\n";
    }
};

// TLS variables with constructors
thread_local Class tls_with_ctor;
thread_local Class2 tls_with_ctor2;

int get_tls_value() {
    // This function reads the TLS variable.
    // GCC sets up guard logic as in your assembly.
    return tls_with_ctor.value;
}

int main() {
    return get_tls_value(); // Must use the TLS variable
}
