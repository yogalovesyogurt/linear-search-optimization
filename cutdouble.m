clc;clear;
syms x
f =(sin(x))^6*tan(1-x)*exp(1)^(30*x);
g=-f;
a0 = 0;
b0 = 1;
t0=0.970662798;
ga=subs(g,x,a0);
gb=subs(g,x,b0);
g0=subs(g,x,t0);
t1=1/2*((t0^2-b0^2)*double(ga)+(b0^2-a0^2)*double(g0)+(a0^2-t0^2)*double(gb))/((t0-b0)*double(ga)+(b0-a0)*double(g0)+(a0-t0)*double(gb));
while abs(t0-t1)>1e-6
    fa=double(subs(g,x,a0));
    fb=double(subs(g,x,b0));
    f0=double(subs(g,x,t0));
    t1=1/2*((t0^2-b0^2)*fa+(b0^2-a0^2)*f0+(a0^2-t0^2)*fb)/((t0-b0)*fa+(b0-a0)*f0+(a0-t0)*fb);
    f1=double(subs(g,x,t1));
    if t1>t0
        if f1<f0
            a0=t0;
            t0=t1;
        else
            b0=t1;
        end
    else
        if f1<f0
            b0=t0;
            t0=t1;
        else
            a0=t1;
        end
    end
end
fprintf('二次插值法求得的极大值点为%9.9f\n',t1)
fprintf('二次插值法求得的极大值为%9.9f\n',subs(f,x,t1))
        
