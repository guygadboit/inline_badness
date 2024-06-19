#include <cstdio>

class Foo
{
public:
    int p;

    Foo()
    {
        p = 2;
    };
};

void foo(void)
{
    Foo f;
    printf("f.p is %d\n", f.p);
}
