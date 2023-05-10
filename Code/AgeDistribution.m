function [KDEresult,PDPresult] = AgeDistribution(AgeData,SigmaData,h)
AgeData = AgeData(~isnan(AgeData));
SigmaData = SigmaData(~isnan(SigmaData));
age = 1:4000;
if nargin == 2
    h = 30;
end

n = length(AgeData);
%%KDE
c_age = zeros(length(age),n);
for i = 1:length(age)
    for j = 1:n
        c_age(i,j) = age(i) - AgeData(j);
    end
end
c_age1 = (sqrt(2.*pi).*n.*h).^(-1) .* exp(-((c_age).^2)./(2.*h.^2));
KDEresult =  sum(c_age1,2);
nnnn = KDEresult  < 0.0000000001;
KDEresult(nnnn) = 0;
KDEresult = KDEresult ./ sum(KDEresult);
%PDP
P_age = exp(-((c_age).^2)./((2.*SigmaData.^2)'));
pdpresult1 = (sqrt(2.*pi).*SigmaData').^(-1).*P_age;
pdpresult = sum(pdpresult1,2);
PDPresult = pdpresult./sum(pdpresult);
nnnn = PDPresult  < 0.0000000001;
PDPresult(nnnn) = 0;
PDPresult = PDPresult ./ sum(PDPresult);
end




