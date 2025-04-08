import time
import multiprocessing

# A function for timing a job that uses a pool of processes.
#  f is a function that takes a single argument
#  data is an array of arguments on which f will be mapped
#  pool_size is the number of processes in the pool.

def check_prime(num):
    t1 = time.time()
    res = False
    #print("Task", multiprocessing.current_process())
    if num > 0:
        # check for factors
        for i in range(2,num):
            if (num % i) == 0:
                print(num,"is not a prime number")
                print(i,"times",num//i,"is",num)
                print("Time:", int(time.time()-t1))
                break
        else:
            #print(num, "is a prime number")
            #print("Time:", time.time()-t1)
            res = True
            # if input number is less than
            # or equal to 1, it is not prime
    return res