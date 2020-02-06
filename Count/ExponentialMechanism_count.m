% In this mechanism, we consider the calculation of count

function [R2]=ExponentialMechanism_count(Aau)

R=(0:length(Aau(:,3)))';  % all possible output
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

Aau0=sortrows(Aau0,2,'ascend');
Aau1=sortrows(Aau1,2,'ascend');

s=length(Aau1(:,3)); % count the number of 1s in Aau


for r=0:length(Aau(:,3))
   Score(r+1)=df_count(Aau0,Aau1,r,s);
end

scoresum=sum(exp(Score/2));
Pro=exp(Score/2)/scoresum;

R2=[R,Pro]; % all possible output and their according propobilities

%pro=rand(1); % generate a random number between (0,1), if Prosum(i) < pro <= Prosum(i+1), the output is R(i+1)

%i=1;
%ne=R(1);
%while (pro>Prosum(i))
%    ne=R(i+1);
%    i=i+1;
%end


end 


