import numpy as np
def func(x, y, z, c2):

    c1 = 10
    c3 = 0.005
    c4 = 0.02
    
    dxdt = c1 + c2*z - x - x*y**2
    dydt = (x + x*y**2 - y)/c3
    dzdt = (y-z)/c4
    
    return [dxdt , dydt, dzdt]

def paramaterize_func(steps, initial_time, dt, initial_x, initial_y, initial_z, c2):

    t = np.zeros(steps+1)
    x = np.zeros(steps+1)
    y = np.zeros(steps+1)
    z = np.zeros(steps+1)
    
    t[0] = initial_time
    x[0] = initial_x
    y[0] = initial_y
    z[0] = initial_z
    
    for i in range(steps):
        
        t_new = t[i] + dt
        
        k11 = func(x[i],y[i],z[i],c2)
        k12 = func(x[i] + (dt/2)*k11[0],y[i] + (dt/2)*k11[1],z[i] + (dt/2)*k11[2],c2)
        k13 = func(x[i] + (dt/2)*k12[0],y[i] + (dt/2)*k12[1],z[i] + (dt/2)*k12[2],c2)
        k14 = func(x[i] + dt*k13[0],y[i] + dt*k13[1],z[i] + dt*k13[2],c2)
        
        x_new = x[i] + dt/6*(k11[0] +2*k12[0] + 2*k13[0] +k14[0])
        y_new = y[i] + dt/6*(k11[1] +2*k12[1] + 2*k13[1] +k14[1])
        z_new = z[i] + dt/6*(k11[2] +2*k12[2] + 2*k13[2] +k14[2])
        
        t[i+1] = t_new
        x[i+1] = x_new
        y[i+1] = y_new
        z[i+1] = z_new
        
    return x,y,z

def bifurcation_array(c2):
    x,y,z = paramaterize_func(steps, initial_time, time_step, initial_x, initial_y, initial_z, c2)
    
def local_max(y):
    y_arg = np.array([])
    for i in range(len(y)):
        if i == 0 or i == len(y) or i == len(y)-1:
            continue

        elif y[i]>=y[i-1] and y[i]>=y[i+1]:
            y_arg = np.append(y_arg,i)
                            
    y_max = np.array([])
    for i in range(len(y_arg)):
        step = int(y_arg[i])
        y_max = np.append(y_max,y[step])
    return y_max

def bifurcation_pool(c2):
    steps = 100000
    initial_time = 0
    time_step = 0.0001
    initial_x = 0.59
    initial_y = 0.69
    initial_z = 5
    
    x,y,z = paramaterize_func(steps, initial_time, time_step, initial_x, initial_y, initial_z, c2)
    y_max = local_max(y)
    
    return y_max, c2