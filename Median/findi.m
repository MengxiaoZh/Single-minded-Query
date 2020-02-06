% find the maximum i which make D(i)<=r. D(i+1)>r
function [i]=findi(B,r)
if (r<median(B(:,3)))
    i=numel(B(:,3));
    while (B(i,3)>r)
        i=i-1;
    end
elseif (r>median(B(:,3)))
    i=1;
    while (B(i,3)<r)
        i=i+1;
    end
else 
    i=(numel(B(:,3))+1)/2;
end
end 
