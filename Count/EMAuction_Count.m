function [R2,NE,Output,E,rmsd1]=EMAuction_Count(A,budget)

re=sum(A(:,3)==1);% real estimate
T=ThetaStar(A(:,2),budget);
Aau=[];
k=1;
for i=1:length(A(:,1))
    if A(i,1)<=T(i)
        A(i,5)=1;
        A(i,4)=T(i); % payment
        Aau(k,:)=A(i,:); % put the chosen data into the set Aau
        k=k+1;
    end
end
Output=[A,T];

[R2]=ExponentialMechanism_count(Aau); % all possible outputs and its probality
Prosum=zeros(length(Aau(:,3))+1,1);
%calculate the cumulative distribution
for j=0:length(Aau(:,3))
    Prosum(j+1)=sum(R2(1:j+1,2));
end

NE=zeros(500,1); % the set of estimate 
E=zeros(500,1); % the set of erros 
Proportion=length(Aau(:,3))/length(A(:,3));



for j=1:500
    pro=rand(1); % generate a random number between (0,1), if Prosum(i) < pro <= Prosum(i+1), the output is R(i+1)
    i=1;
    ne=R2(1,1);
    while (pro>Prosum(i))
        ne=R2(i+1,1);
        i=i+1;
    end
    NE(j)=ne/Proportion;
    E(j)=NE(j)-re;
    %j
end  

rmsd1=(sumsqr(E)/500)^0.5



end