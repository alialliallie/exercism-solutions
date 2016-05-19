from string import ascii_lowercase

ascii_list = list(ascii_lowercase)

def is_pangram(sentence):
    clean = sentence.lower()
    for c in ascii_list:
        if c not in clean:
            return False 
    return True
