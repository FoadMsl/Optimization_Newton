function obj = ObjFun(lambda)
global numFunc

obj = lambda.^5 - 5* lambda.^3 - 20 * lambda + 5;
plot(lambda,obj,'ro')

numFunc = numFunc+1
% pause;
end