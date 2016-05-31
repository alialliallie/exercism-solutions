def distance(first, second):
    # True counts as 1 and False as 0
    return sum(map(not_equal, first, second))

def not_equal(first, second):
    return first != second

