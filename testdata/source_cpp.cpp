#include <fstream>
#include <iostream>

/*
multi line comment
*/

using std::cerr;
using std::cout;
using std::endl;
using std::ifstream;

#define FOO(1) X(1)
#define DEPRECATED(func) func __attribute__ ((deprecated))

#define IsPointDef(...) \
    template<> \
    struct IsPoint<__VA_ARGS__> \
        {\
        static const bool isPoint = true;\
                }

#ifndef FOO
#define BAR
#endif


int main(int argc, char* argv[]) {
    if (argc != 2) {
        cerr << "usage: " << argv[0] << " FILENAME" << endl;
        return 1;
    }

    ifstream f{argv[1]};
    if (!f) {
        cerr << "could not open file: " << argv[1] << endl;
        return 1;
    }

    switch(argc) {
        case 1:;
    }

    int total = 0;
    int n;
    while (f >> n) {
        total += n / 3 - 2;
    }
    cout << total << endl;

    return 0;
}
