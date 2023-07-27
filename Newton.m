% =================================================
%       Foad Moslem (foad.moslem@gmail.com) - Researcher | Aerodynamics
%       Using MATLAB R2022a
% =================================================
clc
clear
close all

% =================================================
tic
global numFunc
numFunc = 0;

% Curve Ploting ======================================
a = 0;
b = 4;
NumOfNodes = 200;
x = linspace(a,b,NumOfNodes);
y = ObjFun(x);
plot(x,y)
hold on

% Main Code - Newton ================================
epsilon = 1e-6;
x0 = b;                                       % Intial Approximation
syms x;
%f = ObjFun(x);
%g = diff(ObjFun(x0));
%h = diff(ObjFun(x),2);
%fx0 = eval(subs(ObjFun(x),x0));
gx0 = eval(subs(diff(ObjFun(x)),x0));
%hx0 = eval(subs(diff(ObjFun(x),2),x0));

while abs(gx0) > epsilon
    fx0 = eval(subs(ObjFun(x),x,x0));
    %plot(x0,fx0,'ro');
    gx0 = eval(subs(diff(ObjFun(x)),x0));
    hx0 = eval(subs(diff(ObjFun(x),2),x0));
    x1 = x0 - gx0/hx0;
    x0 = x1;
        if gx0 == 0
            disp('Division by zero.');
            break;
        end  
end

% =================================================
fprintf('Number of CallFunction: %6.f\n',numFunc)
fprintf('CPU time: %6.4f\n',toc)
fprintf('X Value of Optimum Point: %6.4f\n',x0)
fprintf('Y Value of Optimum Point: %6.4f\n',fx0)
plot(x0,fx0,'kx')