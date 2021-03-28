%Fixed Point Iteration
g=@(x)((1-x^2)/2);
err=1e-6;
x=1;
del=1;
count=0'
while del>err
    xn=g(x);
    del=abs(xn-x);
    x=xn
    count=count+1
end