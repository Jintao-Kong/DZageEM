function [kderesult,pdpresult] = calculateage(Agedata,h)

age = 1:4000;
if nargin == 1
    h = 20;
else
    n = length(Agedata);
    data = Agedata(:,1);
    %%KDE
    c_age = zeros(length(age),n);
    for i = 1:length(age)
        for j = 1:n
            c_age(i,j) = age(i) - data(j);
        end
    end 
    c_age1 = (sqrt(2.*pi).*n.*h).^(-1) .* exp(-((c_age).^2)./(2.*h.^2));
    %(a/b)^2 not equal (a^2/b^2)
    
    kderesult =  sum(c_age1,2);
    %PDP
    P_age = exp(-((c_age).^2)./((2.*Agedata(:,2).^2)'));
    pdpresult1 = (sqrt(2.*pi).*n.*Agedata(:,2)').^(-1).*P_age;
    
    pdpresult = sum(pdpresult1,2);
    %pdpresult = pdpresult./sum(pdpresult);
end