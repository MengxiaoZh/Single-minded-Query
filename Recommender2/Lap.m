function [LaplaceNoise]=Lap(miu,lamda)
r=rand(1);
LaplaceNoise=miu-lamda*sign(r-0.5).*log(1-2.*abs(r-0.5));
end