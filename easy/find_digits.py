from functools import reduce
def find_digits(n):
    """
    DOCUMENTATION
    """
    target = 0
    for digit in str(n):
        try:
            if n % int(digit) == 0 :
                target +=1
        except ZeroDivisionError:
            pass
    return target


