function c = RegulaFalsi(f,a,b)
% provide the equation you want to solve with R.H.S = 0 form. 
% Write the L.H.S by using inline function
% Give initial guesses.
% Solves it by method of bisection.
% A very simple code. But may come handy
c = b-(f(b)*(b-a)/(f(b)-f(a)));
if f(a)*f(b)>0 
    disp('Wrong choice bro!')
else
    err=abs(f(c));
    while err > 1e-6
        if f(c)<0
            a=c;
            c = a-(f(a)*(a-b)/(f(a)-f(b)));
        else 
            b =c;
            c = a-(f(b)*(b-a)/(f(b)-f(a)));
        end
        err=abs(f(c));
    end
end