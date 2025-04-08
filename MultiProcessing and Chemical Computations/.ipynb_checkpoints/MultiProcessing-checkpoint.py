import time
import math
import multiprocessing
from multiprocessing import Pool

# print("Number of cpu : ", multiprocessing.cpu_count())

num_list = [2,3,5]

def find_sqrt(x):
    s = math.sqrt(x)
    return s

# This verbose version shows which process in the pool is running each task.
def find_sqrt_verbose(x):
    s = math.sqrt(x)
    print("Task", multiprocessing.current_process(), x, s)
    return s

# A function for timing a job that uses a pool of processes.
#  f is a function that takes a single argument
#  data is an array of arguments on which f will be mapped
#  pool_size is the number of processes in the pool.
def check_prime(num):
    t1 = time.time()
    res = False
    print("Task", multiprocessing.current_process())
    if num > 0:
        # check for factors
        for i in range(2,num):
            if (num % i) == 0:
                print(num, "is not a prime number")
                print(i, "times", num//i, "is", num)
                print("Time:", int(time.time()-t1))
                break
        else:
            print(num, "is a prime number")
            print("Time:", time.time()-t1)
            res = True
            # if input number is less than
            # or equal to 1, it is not prime
    return res


def pool_process(f, data, pool_size):
    tp1 = time.time()
    pool = Pool(pool_size) # initialize the Pool.
    result = pool.map(f, data)       # map f to the data using the Pool of processes to do the work
    pool.close() # No more processes
    pool.join()  # Wait for the pool processing to complete.
    print("Results", result)
    print("Overall Time:", int(time.time()-tp1))



if __name__ == '__main__':
    find_sqrt_verbose(num_list[0])