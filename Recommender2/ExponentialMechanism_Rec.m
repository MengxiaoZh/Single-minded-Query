% In this mechanism, we consider the calculation of count

function [R3]=ExponentialMechanism_Rec(Aau)

R=(0:length(Aau(:,3)))';  % all possible outputs of sum 
R2=(0:length(Aau(:,3)))'; % all possible outputs
re=Aau(:,7)'*Aau(:,3);

Score=zeros(length(Aau(:,3))+1,1);
Pro=zeros(length(Aau(:,3))+1,1);

% form two datasets consisiting sellers having data 0 and 1, Aau0 and Aau1.
% rank the thetas in a ascending order. 

Aau0=[];
Aau1=[];
for i=1:length(Aau(:,3))
    if (Aau(i,3)==0)
        Aau0=[ Aau0; Aau(i,:)];
    else
        Aau1=[ Aau1; Aau(i,:)];
    end
end

if (~isempty(Aau1))
    Aau1=sortrows(Aau1,2,'ascend');
end
if (~isempty(Aau0))
    Aau0=sortrows(Aau0,2,'ascend');
end

s=length(Aau1(:,3)); % count the number of 1s in Aau

for r=0:length(Aau(:,3))
    if (r>s)
        R2(r+1)=re+sum(Aau0(1:r-s,7));
    elseif (r<s) 
        R2(r+1)=re-sum(Aau1(1:s-r,7));
    else
        R2(r+1)=re;
    end
end


for r=0:length(Aau(:,3))
   Score(r+1)=df_count(Aau0,Aau1,r,s);
end

scoresum=sum(exp(Score/2));
Pro=exp(Score/2)/scoresum;

R3=[R2,Pro]; % all possible output and their according propobilities


end 


