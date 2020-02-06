% it is used to excute EMAuctions for count queries


for i=1:9
    rho=0;
    budget=0.1*i*12083;

    Theta=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Theta and epsilon-uniform.xlsx','0','a2:a12084');
    Epsilon=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Theta and epsilon-uniform.xlsx','0','b2:b12084');
    D=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Count\Recs-kwh.xlsx','c2:c12084');
    P=zeros(length(D),1); % Payment
    Q=zeros(length(D),1); % Allocation
    [number]=1:length(D);
    A=[Theta,Epsilon,D,P,Q,number'];

    [R2,NE,Output,E,rmsd1]=EMAuction_Count(A,budget)

    sheet=i;
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Count\D3\r0\PDP\R2.xlsx',R2,sheet);
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Count\D3\r0\PDP\NE.xlsx',NE,sheet);
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Count\D3\r0\PDP\Output.xlsx',Output,sheet);
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Count\D3\r0\PDP\Output.xlsx',rmsd1,sheet,'H1');
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Count\D3\r0\PDP\Output.xlsx',E,sheet,'I1');

    clc
    clear
end

for i=1:9
    rho=-0.5;
    budget=0.1*i*12083;

    Theta=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Theta and epsilon-uniform.xlsx','-0.5','a2:a12084');
    Epsilon=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Theta and epsilon-uniform.xlsx','-0.5','b2:b12084');
    D=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Count\Recs-kwh.xlsx','c2:c12084');
    P=zeros(length(D),1); % Payment
    Q=zeros(length(D),1); % Allocation
    [number]=1:length(D);
    A=[Theta,Epsilon,D,P,Q,number'];

    [R2,NE,Output,E,rmsd1]=EMAuction_Count(A,budget)

    sheet=i;
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Count\D3\r-0.5\PDP\R2.xlsx',R2,sheet);
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Count\D3\r-0.5\PDP\NE.xlsx',NE,sheet);
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Count\D3\r-0.5\PDP\Output.xlsx',Output,sheet);
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Count\D3\r-0.5\PDP\Output.xlsx',rmsd1,sheet,'H1');
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Count\D3\r-0.5\PDP\Output.xlsx',E,sheet,'I1');

    clc
    clear
end

for i=1:9
    rho=-1;
    budget=0.1*i*12083;

    Theta=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Theta and epsilon-uniform.xlsx','-1','a2:a12084');
    Epsilon=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Theta and epsilon-uniform.xlsx','-1','b2:b12084');
    D=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Count\Recs-kwh.xlsx','c2:c12084');
    P=zeros(length(D),1); % Payment
    Q=zeros(length(D),1); % Allocation
    [number]=1:length(D);
    A=[Theta,Epsilon,D,P,Q,number'];

    [R2,NE,Output,E,rmsd1]=EMAuction_Count(A,budget)

    sheet=i;
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Count\D3\r-1\PDP\R2-2.xlsx',R2,sheet);
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Count\D3\r-1\PDP\NE-2.xlsx',NE,sheet);    
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Count\D3\r-1\PDP\Output-2.xlsx',Output,sheet);
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Count\D3\r-1\PDP\Output-2.xlsx',rmsd1,sheet,'H1');
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Count\D3\r-1\PDP\Output-2.xlsx',E,sheet,'I1');

    clc
    clear
end




% this is the algorith proposed by Ghosh and Roth
% DP auction 

for i=1:9
    rho=0;
    budget=0.1*i*12083;

    Theta=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Theta and epsilon-uniform.xlsx','0','a2:a12084');
    Epsilon=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Theta and epsilon-uniform.xlsx','0','b2:b12084');
    D=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Count\Recs-kwh.xlsx','c2:c12084');
     
    % they consider marginal valuations, therefore we transfer
    % Theta2=Theta/Epsilon
    Theta2=Theta./Epsilon;

    P=zeros(length(D),1); % Payment
    Q=zeros(length(D),1); % Allocation
    [number]=1:length(D);
    A=[Theta2,Epsilon,D,P,Q,number'];
    
    [NE,B,E,rmsd3]=DP_Auction4(A,budget);
    
    sheet=i;
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Count\D3\r0\FQ\NE.xlsx',NE,sheet);
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Count\D3\r0\FQ\Output.xlsx',B,sheet);
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Count\D3\r0\FQ\Output.xlsx',rmsd3,sheet,'H1');
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Count\D3\r0\FQ\Output.xlsx',E,sheet,'I1');


    clc
    clear
end

for i=1:9
    rho=-0.5;
    budget=0.1*i*12083;

    Theta=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Theta and epsilon-uniform.xlsx','-0.5','a2:a12084');
    Epsilon=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Theta and epsilon-uniform.xlsx','-0.5','b2:b12084');
    D=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Count\Recs-kwh.xlsx','c2:c12084');
    
    % they consider marginal valuations, therefore we transfer
    % Theta2=Theta/Epsilon
    Theta2=Theta./Epsilon;

    P=zeros(length(D),1); % Payment
    Q=zeros(length(D),1); % Allocation
    [number]=1:length(D);
    A=[Theta2,Epsilon,D,P,Q,number'];

    [NE,B,E,rmsd3]=DP_Auction4(A,budget);
    
    sheet=i;
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Count\D3\r-0.5\FQ\NE.xlsx',NE,sheet);
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Count\D3\r-0.5\FQ\Output.xlsx',B,sheet);
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Count\D3\r-0.5\FQ\Output.xlsx',rmsd3,sheet,'H1');
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Count\D3\r-0.5\FQ\Output.xlsx',E,sheet,'I1');


    clc
    clear
end


for i=1:9
    rho=-1;
    budget=0.1*i*12083;

    Theta=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Theta and epsilon-uniform.xlsx','-1','a2:a12084');
    Epsilon=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Theta and epsilon-uniform.xlsx','-1','b2:b12084');
    D=xlsread('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Count\Recs-kwh.xlsx','c2:c12084');
    
    % they consider marginal valuations, therefore we transfer
    % Theta2=Theta/Epsilon
    Theta2=Theta./Epsilon;

    P=zeros(length(D),1); % Payment
    Q=zeros(length(D),1); % Allocation
    [number]=1:length(D);
    A=[Theta2,Epsilon,D,P,Q,number'];

    [NE,B,E,rmsd3]=DP_Auction4(A,budget);
    
    sheet=i;
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Count\D3\r-1\FQ\NE.xlsx',NE,sheet);
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Count\D3\r-1\FQ\Output.xlsx',B,sheet);
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Count\D3\r-1\FQ\Output.xlsx',rmsd3,sheet,'H1');
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Count\D3\r-1\FQ\Output.xlsx',E,sheet,'I1');


    clc
    clear
end


