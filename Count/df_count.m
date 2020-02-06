% score is the lowest epsilon. in other words, we need to find the most strigent privacy requirement.  

function [score]=df_count(Aau0,Aau1,r,s)


if (r>s)
    score=-sum(Aau0(1:r-s,2));
elseif (r<s)
    score=-sum(Aau1(1:s-r,2));
else
    score=0;
end

end



    

            
