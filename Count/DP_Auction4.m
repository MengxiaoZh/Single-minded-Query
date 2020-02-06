% this is the changed version of algorith proposed by Ghosh and Roth
% in this version, cost=epsilon_m*theta_m 
function [NE,B,E,rmsd3]=DP_Auction4(A,budget)

B=sortrows(A,1,'ascend'); % sort the matrix according to the column V in ascending order
Aau=[];
% find the largest integer such that the cost is within the budget
i=1;
m=0;
epsilon_m=1;
h1=[]; % the vector of sellers with high requirement.
h2=[];
p=0;
while ( i<=length(B(:,1)) && (B(i,1)*epsilon_m*(m+1))<=budget )
    epsilon_m=1/((length(B(:,1))-m-1));
    % set Q
    B(i,5)=1;
    Aau=[Aau; B(i,:)];
    % delete the data sellers with high requirment in Aau.
    h1=find(Aau(:,2)<epsilon_m);
    h2=find(B(:,2)<epsilon_m);
    if (~isempty(h1))
        B(h2,5)=0;
        B(h2,4)=0;
        Aau(h1,:)=[];
    end
    m=length(Aau(:,2));
    i=i+1;
end

i=i-1;
epsilon_m=1/((length(B(:,1))-m));
% set P
if (i==length(B(:,1)))
    p=B(i,1)*epsilon_m;
else
    p=B(i+1,1)*epsilon_m;
end

if (p<=(budget/m))
    B(find(B(:,5)==1),4)=p;
else
    B(find(B(:,5)==1),4)=(budget/m);
end


re=sum(A(:,3)==1);
NE=zeros(500,1); % the set of noisy estimates
E=zeros(500,1); % the set of erros in the following three cases
% calculate estimate and add Laplace noise
for j=1:500
    ne=sum(Aau(:,3)==1)+(length(A(:,1))-m)/2+Lap(0,length(A(:,1))-m);
    NE(j)=ne;
    E(j)=NE(j)-re;
    j
end

rmsd3=(sumsqr(E)/500)^0.5;


end
