% In this mechanism, we consider the calculation of median. 
% We need to consider the probabilities of all possible result. The range
% is from the lowest value in the dataset to the highest value. 
% For each possible result, the probability is a ratio.

% we only consider the case when the number of individuals is even.

function [R2]=ExponentialMechanism2(Aau)

R=(min(Aau(:,3)):0.5:max(Aau(:,3)))';  % all possible output
Score=zeros(length(R),1);
Pro=zeros(length(R),1);

C=sortrows(Aau,2,'ascend'); % sort sellers by epsilon in a ascending way 

for i=1:length(R)
    r=min(Aau(:,3))+(i-1)*0.5;
    Score(i)=df2(Aau,r,C);
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


