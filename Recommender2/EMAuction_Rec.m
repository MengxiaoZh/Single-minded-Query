% Exponential mechanism auction
function [R3,NE,Output,E,rmsd1]=EMAuction_Rec(C,budget)

re=C(:,3)'*C(:,7);% real estimate
T=ThetaStar(C(:,2),budget);
Aau=[];
k=1;
for i=1:length(C(:,1))
    if C(i,1)<=T(i)
        C(i,5)=1;
        C(i,4)=T(i); % payment
        Aau(k,:)=C(i,:); % put the chosen data into the set Aau
        k=k+1;
        %if C(i,2)==0 % if epsilon is 0, delete this entry
        %    C(i,5)=0;
        %    C(i,4)=0; % payment
        %    k=k-1;
        %    Aau(k,:)=[]; % delete it 
        %end 
    end
end
Output=[C,T];

[R3]=ExponentialMechanism_Rec(Aau);


Prosum=zeros(length(Aau(:,3))+1,1);

NE=zeros(500,1); % the set of noisy estimates 
E=zeros(500,1); % the set of erros in the following three cases

%calculate the cumulative distribution
for j=0:length(Aau(:,3))
    Prosum(j+1)=sum(R3(1:j+1,2));
end


for j=1:500
    pro=rand(1); % generate a random number between (0,1), if Prosum(i) < pro <= Prosum(i+1), the output is R(i+1)
    i=1;
    ne=R3(1,1);
    while (pro>Prosum(i))
        ne=R3(i+1,1);
        i=i+1;
    end
    %NE(j)=ne+0.5*sum(C(find(C(:,5)==0),7));
    NE(j)=ne/sum(C(find(C(:,5)==1),7))*sum(C(:,7));
    E(j)=NE(j)-re;
    j
end  

rmsd1=(sumsqr(E)/500)^0.5



end