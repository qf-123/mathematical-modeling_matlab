# Chapter1 Linear Programming
The matrix representation of linear programming is  
$$
\max(\text{or }\min)\quad z=\boldsymbol{c}^T\boldsymbol{x}\\
\text{s. t. }\begin{cases}
\boldsymbol{A\cdot x}\le(\text{or}=,\ge)\boldsymbol{b},\\
\boldsymbol{x}\ge0.
\end{cases}
$$
in the formula $\boldsymbol{c}=[c_1,c_2,\dots,c_n]^T$; $x=[x_1,x_2,\dots,x_n]^T$; $\boldsymbol{A}=(a_{ij})_{m\times n}$; $\boldsymbol{b}=[b_1,b_2,\dots,b_m]^T$

Matlab solves mathematical programming (including linear programming, integer programming, and nonlinear programming) in two approaches.  
1. Solver-Based Approach   
   ```matlab
   x = linprog(f,A,b) 
   x = linprog(f,A,b,Aeq,beq) 
   x = linprog(f,A,b,Aeq,beq,lb,ub)
   [x,fval]=linprog(_) %fval = f'*x
   ```
   You can use the function **linprog** to find the minimum of a problem specified by 

$$
\min_{x}\boldsymbol{f}^T\boldsymbol{x}\\
\text{s. t. }\begin{cases}
\boldsymbol{A\cdot x}\le\boldsymbol{b},\\
\boldsymbol{Aeq\cdot x}=\boldsymbol{beq},\\
\boldsymbol{lb}\le\boldsymbol{x}\le\boldsymbol{ub}.
\end{cases}
$$  
2. Problem-Based Approach
   ```matlab
   prob = optimproblem %the default is minimization problem
   prob = optimproblem(Name,Value) %specify a maximization problem instead of a minimization problem
   ```
   The specific solution steps can be seen in the following example

Let's look at an example
$$
\max z=4x_1+3x_2,\\
\text{s. t. }\begin{cases}
2x_1+x_2\le10,\\
x_1+x_2\le8,\\
x_2\le7,\\
x_1,x_2\ge0.
\end{cases}
$$
*Coed1_1*
```matlab
%Solver-Based Approach
clc,clear %clc--clear command window, clear--remove items from workspace, freeing up system memory
c=[4;3]
b=[10;8;7]
a=[2,1;1,1;0,1]
lb=zeros(2,1) %create array of all zeros
[x,fval]=linprog(-c,a,b,[],[],lb)
y=-fval
```  
*Code1_2*
```matlab
%Problem-Based Approach
clc,clear
prob=optimproblem('ObjectiveSense','max')
c=[4;3]
b=[10;8;7]
a=[2,1;1,1;0,1]
x=optimvar('x',2,'LowerBound',0)
prob.Objective=c'*x
prob.Constraints.con=a*x<=b %you can also set more constraints, e.g prob.Constraints.con1 =[con11,con12...]; prob.Constraints.con2 =[con21,con22...](The constraints in the same '[]' must have the same inequality or equal sign)
[sol,fval,exitflag]=solve(prob) %sol--solution, returned as a structure, exitflag--reason solver stopped
sol.x 
```