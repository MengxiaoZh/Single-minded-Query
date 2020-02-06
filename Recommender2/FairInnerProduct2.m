% in this version, valuation is marginal
function [NE,B,E,rmsd3]=FairInnerProduct2(A,budget)
% NE the set of random numbers
% B the allocation result and payment
% E the set of errors
% rmsd2 

B=sortrows(A,1,'ascend'); % sort the matrix according to the column V in ascending order
Aau=[];

m=0;
w_sum=0;
theta=0;
L=zeros(length(B(:,5)),1);
R=zeros(length(B(:,5)),1);

while( m < length(B(:,1)) && budget/(w_sum+B(m+1,2)) >= B(m+1,1))
    m=m+1;
    w_sum=w_sum+B(m,2);
    theta=B(m,1);
    Aau=[Aau; B(m,:)];
    B(m,5)=1;
    L(m,1)=budget/w_sum;
    R(m,1)=theta;
end

if (m < length(B(:,1)))
    theta=B(m+1,1);
else
    theta=B(m,1);
end


if( budget/w_sum > theta)
    p=theta;
else
    p=budget/w_sum;
end

for j=1:length(A(:,1))
    B(find(B(:,5)==1),4)=p*B(j,2);
end

sigma=1*sum(B(find(B(:,5)==0),2));
re=B(:,2)'*B(:,3); % real estimate
NE=zeros(500,1);
E=zeros(500,1); 

for j=1:500
    NE(j)=B(1:m,2)'*B(1:m,3)+0.5*sum(B(find(B(:,5)==0),2))+Lap(0,sigma);
    E(j)=NE(j)-re;
end
    rmsd3=(sumsqr(E)/500)^0.5;
    
end
