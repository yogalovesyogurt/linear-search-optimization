clc;clear;
syms x;
f =(sin(x))^6*tan(1-x)*exp(1)^(30*x);
g=-f;
alpha =0.618;
a0 = 0;
b0 = 1;
v =a0+(1-alpha)*(b0-a0);
u =a0+alpha*(b0-a0);
while(1)
    fv = subs(g,x,v);
    fu = subs(g,x,u);
    if fv>fu
        if b0-v<=1e-6
            xx=u;
            break
        else
            a0 = v;
            v = u;
            u = a0+alpha*(b0-a0);
        end
    else
        if u-a0<=1e-6
            xx=v;
            break
        else
            b0 = u;
            u = v;
            v = a0+(1-alpha)*(b0-a0);
        end
    end
end
fprintf('0.618法求得的极大值点为%9.9f\n',xx)
fprintf('0.618法求得的极大值为%9.9f\n',subs(f,x,xx))
