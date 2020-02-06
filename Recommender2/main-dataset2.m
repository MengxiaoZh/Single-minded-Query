%FIP
% now cosine similarity is used
for i=1:9
    i
    budget=0.1*i*2076;
    
    Theta=xlsread("C:\Users\mzha387\Desktop\datasets for private data\Movielense - clear.xlsx","Theta","A2:A2077");
    W=xlsread("C:\Users\mzha387\Desktop\datasets for private data\Movielense - clear.xlsx","W","A1:A2076");
    D=xlsread("C:\Users\mzha387\Desktop\datasets for private data\Movielense - clear.xlsx","Sheet3","E2:E2077");
    P=zeros(length(D),1); % Payment
    Q=zeros(length(D),1); % Allocation
    [number]=1:length(D);
    % theta2=theta/epsilon
    Theta2=Theta./W;
    A=[Theta2,W,D,P,Q,number'];
    
    % FairInnerProduct
    [NE,Output,E,rmsd3]=FairInnerProduct2(A,budget)
    
    sheet=i;
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Rec\D2\FIP\NE.xlsx',NE,sheet);
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Rec\D2\FIP\Output.xlsx',Output,sheet);
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Rec\D2\FIP\Output.xlsx',rmsd3,sheet,'H1');
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Rec\D2\FIP\Output.xlsx',E,sheet,'I1');
    
    
    % use the result gained by the FairInnerProduct 
    % run PDP mechanism 
    Output_FIP=Output;
    B=Output_FIP;
    B(:,1)=xlsread("C:\Users\mzha387\Desktop\datasets for private data\Movielense - clear.xlsx","Theta","A2:A2077");

    C=[B,zeros(length(B(:,1)),1)];

    for j=1:length(B(:,1))
        C(j,4)=0;
        C(j,5)=0;
        C(j,7)=B(j,2);
        C(j,2)=(B(j,2))/sum(B(find(B(:,5)==0),2));
    end
    
    [R3,NE,Output,E,rmsd1]=EMAuction_Rec(C,budget)

    sheet=i;
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Rec\D2\PDP\R2.xlsx',R3,sheet);
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Rec\D2\PDP\NE.xlsx',NE,sheet); % noisy estimates
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Rec\D2\PDP\Output.xlsx',Output,sheet);
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Rec\D2\PDP\Output.xlsx',rmsd1,sheet,'I1');
    xlswrite('C:\Users\mzha387\Documents\MATLAB\Data pricing2\Results\Rec\D2\PDP\Output.xlsx',E,sheet,'J1'); % erros

   
        
    clc
    clear
end

