from six.moves import cPickle as  pickle
import numpy as np
import sys

def get_arrays(fileN):
    dump = pickle.load(open(fileN))
    return dump

def encode_array(array):
    ndim = array.ndim
    shape = ' '.join(map(lambda x: str(x), array.shape))
    prestr = str(ndim) + " "+shape
    return prestr+" "+' '.join(map(lambda x: str(x), array.flatten()))


def stringitize(fileN):
    dump = get_arrays(fileN)
    shapes = str(len(dump))
    for arr in dump:
        shapes = shapes + " "+encode_array(arr)
    return shapes

if __name__ == '__main__':
    string = stringitize(sys.argv[1])
    print(string)
