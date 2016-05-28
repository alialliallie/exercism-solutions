def distance(first, second):
    return len([i for i in zip(first, second) if i[0] != i[1]])
