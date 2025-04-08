import time
import math
import multiprocessing

def find_sqrt(x):
    s = math.sqrt(x)
    return s

# This verbose version shows which process in the pool is running each task.
def find_sqrt_verbose(x):
    s = math.sqrt(x)
    print("Task", multiprocessing.current_process(), x, s)
    return s

