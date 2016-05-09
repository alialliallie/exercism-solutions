#
# Skeleton file for the Python "Hello World" exercise.
#


def hello(name=''):
    entity = 'World'
    if name != '':
        entity = name
    return 'Hello, {}!'.format(entity)
