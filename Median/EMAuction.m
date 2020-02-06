function [R2,NE,Output,E,rmsd1]=EMAuction(A,budget)

re=median(A(:,3));% real estimate
T=ThetaStar(A(:,2),budget); % for uniformly distributed data
Aau=[]; % the set of chosen data sellers
k=1;
for i=1:length(A(:,1))
    if A(i,1)<=T(i)
        A(i,5)=1; % allocation result
        A(i,4)=T(i); % payment
        Aau(k,:)=A(i,:); % put the chosen data into the set Aau
        k=k+1;
    end
end
Output=[A,T];

if (rem(length(Aau(:,1)),2)==0) 
    display('even')
    [R2]=ExponentialMechanism2(Aau);
    Prosum=zeros(length(R2(:,1)),1);

    %calculate the cumulative distribution
    for j=1:length(R2(:,1))
        Prosum(j)=sum(R2(1:j,2));
    end
    NE=zeros(500,1); % the set of noisy estimates 
    E=zeros(500,1); % the set of erros
    
    for j=1:500
        pro=rand(1); % generate a random number between (0,1), if Prosum(i) < pro <= Prosum(i+1), the output is R(i+1)
        i=1;
        ne=R2(1,1);
        while (pro>Prosum(i))
            ne=R2(i+1,1);
            i=i+1;
        end
        NE(j)=ne;
        E(j)=ne-re;
        j
    end      
else
    display('odd')
    [R2]=ExponentialMechanism1(Aau);
    Prosum=zeros(length(R2(:,1)),1);

    %calculate the cumulative distribution
    for j=1:(max(Aau(:,3))-min(Aau(:,3))+1)
        Prosum(j)=sum(R2(1:j,2));
    end
    NE=zeros(500,1); % the set of noisy estimates 
    E=zeros(500,1); % the set of erros
        
    for j=1:500
        pro=rand(1); % generate a random number between (0,1), if Prosum(i) < pro <= Prosum(i+1), the output is R(i+1)
        i=1;
        ne=R2(1,1);
        while (pro>Prosum(i))
            ne=R2(i+1,1);
            i=i+1;
        end
        NE(j,1)=ne;
        E(j,1)=ne-re;
        j
    end
end  

rmsd1=(sumsqr(E(:,1))/500)^0.5



end