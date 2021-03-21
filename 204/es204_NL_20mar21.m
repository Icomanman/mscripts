%Nonlinear Equations
eqn=@(x)(x^2+2*x-1)
format long
%Bisection Method
bisection(eqn,0,2,1e-1)
bisection(eqn,0,2,1e-2)
bisection(eqn,0,2,1e-3)
bisection(eqn,0,2,1e-4)
bisection(eqn,0,2,1e-5)
bisection(eqn,0,2,1e-6)

bisection(eqn,-3,0,1e-1)
bisection(eqn,-3,0,1e-2)
bisection(eqn,-3,0,1e-6)


a=0;
b=2;
count=0;
clf
hold on
if eqn(a)*eqn(b)>0
        disp('Wrong choice bro!')
else
    p=(a+b)/2;
    err = abs(eqn(p));
    while err > 1e-7
    if eqn(a)*eqn(p)<0
       b=p;
    else
       a=p;
    end
    p=(a+b)/2;
    err = abs(eqn(p));
    count = count+1;
    plot(count,p,'*')
    end
    fprintf("Number of iterations: %d\n", count)
end
%Regula Falsi
RegulaFalsi(eqn,0,2)
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