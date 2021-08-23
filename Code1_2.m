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