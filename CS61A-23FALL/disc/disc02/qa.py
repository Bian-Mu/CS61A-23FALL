def make_keeper(n):
    """Returns a function that takes one parameter cond and prints
    out all integers 1..i..n where calling cond(i) returns True.

    >>> def is_even(x): # Even numbers have remainder 0 when divided by 2.
    ...     return x % 2 == 0
    >>> make_keeper(5)(is_even)
    2
    4
    >>> make_keeper(5)(lambda x: True)
    1
    2
    3
    4
    5
    >>> make_keeper(5)(lambda x: False)  # Nothing is printed
    """
    def f(cond):
        for i in range(1,n+1):
            if cond(i)==True:
                print(i)
    return f


def curry(func):
    """
    Returns a Curried version of a two-argument function FUNC.
    >>> from operator import add, mul, mod
    >>> curried_add = curry(add)
    >>> add_three = curried_add(3)
    >>> add_three(5)
    8
    >>> curried_mul = curry(mul)
    >>> mul_5 = curried_mul(5)
    >>> mul_5(42)
    210
    >>> curry(mod)(123)(10)
    3
    """
    curry =lambda func: lambda arg1: lambda arg2: func(arg1, arg2)
    return curry(func)



def f1():
    """
    >>> f1()
    3
    """
    f1 = lambda: 3
    return f1()

def f2():
    """
    >>> f2()()
    3
    """
    f2=lambda:(lambda:3)
    return f2()

def f3():
    """
    >>> f3()(3)
    3
    """
    f3 = lambda:lambda x:x
    return f3()

def f4():
    """
    >>> f4()()(3)()
    3
    """
    f4=lambda:lambda:(lambda x:(lambda:x))
    return f4()


def match_k(k):
    """Returns a function that checks if digits k apart match.

    >>> match_k(2)(1010)
    True
    >>> match_k(2)(2010)
    False
    >>> match_k(1)(1010)
    False
    >>> match_k(1)(1)
    True
    >>> match_k(1)(2111111111111111)
    False
    >>> match_k(3)(123123)
    True
    >>> match_k(2)(123123)
    False
    """
    def func(num):
        num=abs(num)
        while num>1:
            if num%(10**k)!=num//(10**k):
                return False
            num=num//(10**(k*2))
        return True
    return func

