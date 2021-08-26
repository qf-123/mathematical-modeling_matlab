# Chapter 2 Integer Programming
Integer programming is the same as linear programming, except...
```matlab
x=optimvar('x',6,'Type','integer','LowerBound',0)
x=optimvar('x',6,'Type','integer','LowerBound',0,'UpperBound',1) %0-1 integer programming
```