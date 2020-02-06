% calculate thetastar for all data providers. 
% the input is a vector, epsilon, and budget. and the output is a vector of
% theta stars.
% the model is for uniform distribution data

function [T]=ThetaStar(Epsilonsa2,budget)
a=Epsilonsa2';
b=budget;
n=length(Epsilonsa2);

cvx_begin
   variables x(n)   
   maximize(a*x)  
   x'*x <= b
   0<=x<=1
cvx_end

T=x;
end
