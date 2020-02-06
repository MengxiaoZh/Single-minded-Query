% this is the changed version of algorith proposed by Ghosh and Roth
% in this version,epsilon_m=min epsilon_i; sigma=delta/epsilon_m ; cost=epsilon_m*theta_i 
function [NE,B,E,rmsd3]=DP_Auction8(A,budget)

B=sortrows(A,1,'ascend'); % sort the matrix according to the column V in ascending order
Aau=[];
% find the largest integer such that the cost is within the budget
i=0;
m=0;
epsilon_m=1;
delta=max(A(:,3))-min(A(:,3));% global sensitivity
h1=[]; % the vector of sellers with high requirement.
h2=[];
while ( i<length(B(:,1)) && (B(i+1,1)*epsilon_m*(m+1))<=budget )
    % set Q
    B(i+1,5)=1;
    Aau=[Aau; B(i+1,:)];
    % delete the data sellers with high requirment in Aau.
    h1=find(Aau(:,2)<epsilon_m);
    h2=find(B(:,2)<epsilon_m);
    if (~isempty(h1))
        B(h2,5)=0;
        B(h2,4)=0;
        Aau(h1,:)=[];
    end
    m=length(Aau(:,2));
    epsilon_m=1/((length(B(:,1))-m-1));
    i=i+1;
end

% i=i-1;
m=length(Aau(:,1));
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


re=median(A(:,3)); % the real estimate

NE=zeros(500,1); % the set of noisy estimates
E=zeros(500,1); % the set of erros in the following three cases
% calculate estimate and add Laplace noise
for j=1:500
    ne=median(Aau(:,3))+Lap(0,delta*((length(B(:,1))-m)));
    NE(j)=ne;
    E(j)=NE(j)-re;
    j
end

rmsd3=(sumsqr(E)/500)^0.5;


end
