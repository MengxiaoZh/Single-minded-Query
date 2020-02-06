% score is the the sum lowest epsilon. in other words, we need to find the most strigent privacy requirement.  

function [score]=df(Aau, r, C)
B=sortrows(Aau,3,'ascend'); % sort the data in an ascending order
i=findi(B,r); % figure out how many sellers need to be changed.
m=(numel(Aau(:,3))+1)/2; % numel, return the number of elements in a matrix

if (i<m)
    % filter C such that only sellers with d>r are in Cr
    Cr=C(find(C(:,3)>r),:);
    score=-sum(Cr(1:m-i,2));
elseif (i>m)
    Cr=C(find(C(:,3)<r),:);
    score=-sum(Cr(1:i-m,2));
else 
    score=0;
end    
