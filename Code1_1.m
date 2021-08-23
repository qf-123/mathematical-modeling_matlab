%Solver-Based Approach
clc,clear %clc--clear command window, clear--remove items from workspace, freeing up system memory
c=[4;3]
b=[10;8;7]
a=[2,1;1,1;0,1]
lb=zeros(2,1) %create array of all zeros
[x,fval]=linprog(-c,a,b,[],[],lb)
y=-fval