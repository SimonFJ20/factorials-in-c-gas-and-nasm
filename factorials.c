
int factorial(int n)
{
    if (n > 0)
        return factorial(n - 1) * n;
    return 1;
}

int main()
{
    int a = factorial(5);
    return a;
}
