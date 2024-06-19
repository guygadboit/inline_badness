#include <cstdio>

// But... you end up with the one from foo.cpp instead because it so happens
// that we link against the function foo from there. No errors or warnings
// whatsoever. Don't call foo() and we get _our_ Foo with the null p.
//
// Build with more optimizations, and the function gets inlined, and you get
// "our" Foo()
//
// This program does violate the One Definition Rule in the C++ standard which
// says that inline functions with external linkage (which is what these
// constructors are) have to be exactly the same!
class Foo
{
public:
    int p;

    Foo()
    {
        p = 1;
    };
};

extern void foo(void);

int main(void)
{
   Foo f;

   // This gives you 1,2 on -O2, but 2,2 on -O0
   printf("p is %d\n", f.p);
   foo();

   return 0;
}
