% score is the lowest epsilon. in other words, we need to find the most strigent privacy requirement.  

function [score]=df2(Aau, r,C)
B=sortrows(Aau,3,'ascend'); % sort the seller by data
i=findi2(B,r); % figure out how many sellers need to be changed.
m=(numel(Aau(:,3)))/2; % numel, return the number of elements in a matrix

if (r<median(B(:,3)))
    % filter C such that only sellers with d>r are in Cr
    Cr=C(find(C(:,3)>r),:);
    score=-sum(Cr(1:m-i+1,2));
 
elseif(r>median(B(:,3)))
    Cr=C(find(C(:,3)<r),:);
    score=-sum(Cr(1:i-m,2));
    
else
    score=0;
end
