% this is used to excute personalized exponential mechanism for median
% EMAuction is personalized differential private 
% ExponentialMechanism1 is used when sample Aau size is odd, while 2 when
% is even
% df is to calculate score and findi is to find the rank of a given
% possible output r in R.
%

for i=1:9
    rho=0;
    budget=0.1*i*12083;
    
    Theta=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Theta and epsilon-uniform.xlsx','0','a2:a12084');
    Epsilon=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Theta and epsilon-uniform.xlsx','0','b2:b12084');
    D=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Median\Recs-kwh.xlsx','c2:c12084');
    P=zeros(length(D),1); % Payment
    Q=zeros(length(D),1); % Allocation
    [number]=1:length(D);
    A=[Theta,Epsilon,D,P,Q,number'];


    [R2,NE,Output,E,rmsd1]=EMAuction(A,budget)
    
    sheet=i;
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r0\PDP\R2.xlsx',R2,sheet);
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r0\PDP\NE.xlsx',NE,sheet);
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r0\PDP\Output.xlsx',Output,sheet);
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r0\PDP\Output.xlsx',rmsd1,sheet,'H1');
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r0\PDP\Output.xlsx',E,sheet,'I1');

    clc
    clear
end

for i=1:9
    rho=-0.5;
    budget=0.1*i*12083;
    
    Theta=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Theta and epsilon-uniform.xlsx','-0.5','a2:a12084');
    Epsilon=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Theta and epsilon-uniform.xlsx','-0.5','b2:b12084');
    D=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Median\Recs-kwh.xlsx','c2:c12084');
    P=zeros(length(D),1); % Payment
    Q=zeros(length(D),1); % Allocation
    [number]=1:length(D);
    A=[Theta,Epsilon,D,P,Q,number'];


    [R2,NE,Output,E,rmsd1]=EMAuction(A,budget)
    
    sheet=i;
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r-0.5\PDP\R2.xlsx',R2,sheet);
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r-0.5\PDP\NE.xlsx',NE,sheet);   
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r-0.5\PDP\Output.xlsx',Output,sheet);
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r-0.5\PDP\Output.xlsx',rmsd1,sheet,'H1');
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r-0.5\PDP\Output.xlsx',E,sheet,'I1');

    clc
    clear
end

for i=1:9
    rho=-1;
    budget=0.1*i*12083;
    
    Theta=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Theta and epsilon-uniform.xlsx','-1','a2:a12084');
    Epsilon=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Theta and epsilon-uniform.xlsx','-1','b2:b12084');
    D=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Median\Recs-kwh.xlsx','c2:c12084');
    P=zeros(length(D),1); % Payment
    Q=zeros(length(D),1); % Allocation
    [number]=1:length(D);
    A=[Theta,Epsilon,D,P,Q,number'];


    [R2,NE,Output,E,rmsd1]=EMAuction(A,budget)
    
    sheet=i;
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r-1\PDP\R2.xlsx',R2,sheet);
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r-1\PDP\NE.xlsx',NE,sheet);
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r-1\PDP\Output.xlsx',Output,sheet);
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r-1\PDP\Output.xlsx',rmsd1,sheet,'H1');
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r-1\PDP\Output.xlsx',E,sheet,'I1');

    clc
    clear
end


%FQ 
for i=1:9
    rho=0;
    budget=0.1*i*12083;
    
    Theta=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Theta and epsilon-uniform.xlsx','0','a2:a12084');
    Epsilon=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Theta and epsilon-uniform.xlsx','0','b2:b12084');
    D=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Median\Recs-kwh.xlsx','c2:c12084');
    P=zeros(length(D),1); % Payment
    Q=zeros(length(D),1); % Allocation
    [number]=1:length(D);
    Theta2=Theta./Epsilon; % unit valuation
    A=[Theta2,Epsilon,D,P,Q,number'];
    
%     sheet=i;
%     EQ=zeros(12083,2);
%     EQ(:,1)=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r0\PDP\Output.xlsx',sheet,'b1:b12083'); %epsilon
%     EQ(:,2)=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r0\PDP\Output.xlsx',sheet,'e1:e12083'); %Q
%     epsilon_m=min(EQ(find(EQ(:,2)==1),1)); % set epsilon for all bidder as the highest requirement achieve by PDP
%    
    [NE,Output,E,rmsd3]=DP_Auction8(A,budget)

    sheet=i;
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r0\FQ\NE.xlsx',NE,sheet);
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r0\FQ\Output.xlsx',Output,sheet);
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r0\FQ\Output.xlsx',rmsd3,sheet,'H1');
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r0\FQ\Output.xlsx',E,sheet,'I1');

    clc
    clear
end

for i=1:9
    rho=-0.5;
    budget=0.1*i*12083;
    
    Theta=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Theta and epsilon-uniform.xlsx','-0.5','a2:a12084');
    Epsilon=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Theta and epsilon-uniform.xlsx','-0.5','b2:b12084');
    D=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Median\Recs-kwh.xlsx','c2:c12084');
    P=zeros(length(D),1); % Payment
    Q=zeros(length(D),1); % Allocation
    [number]=1:length(D);
    Theta2=Theta./Epsilon; % unit valuation
    A=[Theta2,Epsilon,D,P,Q,number'];

%     sheet=i;
%     EQ=zeros(12083,2);
%     EQ(:,1)=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r-0.5\PDP\Output.xlsx',sheet,'b1:b12083'); %epsilon
%     EQ(:,2)=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r-0.5\PDP\Output.xlsx',sheet,'e1:e12083'); %Q
%     epsilon_m=min(EQ(find(EQ(:,2)==1),1)); % set epsilon for all bidder as the highest requirement achieve by PDP
   
    [NE,Output,E,rmsd3]=DP_Auction8(A,budget)
    
    sheet=i;
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r-0.5\FQ\NE.xlsx',NE,sheet);
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r-0.5\FQ\Output.xlsx',Output,sheet);
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r-0.5\FQ\Output.xlsx',rmsd3,sheet,'H1');
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r-0.5\FQ\Output.xlsx',E,sheet,'I1');

    clc
    clear
end


for i=1:9
    rho=-1;
    budget=0.1*i*12083;
    
    Theta=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Theta and epsilon-uniform.xlsx','-1','a2:a12084');
    Epsilon=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Theta and epsilon-uniform.xlsx','-1','b2:b12084');
    D=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Median\Recs-kwh.xlsx','c2:c12084');
    P=zeros(length(D),1); % Payment
    Q=zeros(length(D),1); % Allocation
    [number]=1:length(D);
    Theta2=Theta./Epsilon; % unit valuation
    A=[Theta2,Epsilon,D,P,Q,number'];


%     sheet=i;
%     EQ=zeros(12083,2);
%     EQ(:,1)=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r-1\PDP\Output.xlsx',sheet,'b1:b12083'); %epsilon
%     EQ(:,2)=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r-1\PDP\Output.xlsx',sheet,'e1:e12083'); %Q
%     epsilon_m=min(EQ(find(EQ(:,2)==1),1)); % set epsilon for all bidder as the highest requirement achieve by PDP
   
    [NE,Output,E,rmsd3]=DP_Auction8(A,budget)
    
    sheet=i;
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r-1\FQ\NE.xlsx',NE,sheet);
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r-1\FQ\Output.xlsx',Output,sheet);
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r-1\FQ\Output.xlsx',rmsd3,sheet,'H1');
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Median\D3\r-1\FQ\Output.xlsx',E,sheet,'I1');

    clc
    clear
end


