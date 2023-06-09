%% yield sigmaage k = 4
function [sigmaage,sigmaall] = confidence4KDE1(data,weight,group,sigma)

deltaweight = 0.01; deltaage = 1;
bzc = [sigma(1),sigma(2),sigma(3),sigma(4)];

result = -log(weight(1).*distribution(data(:,1),bzc(1),group(1))+...
    weight(2).*distribution(data(:,1),bzc(2),group(2))+...
    weight(3).*distribution(data(:,1),bzc(3),group(3))+...
    weight(4).*distribution(data(:,1),bzc(4),group(4)));

result1 = result((~isinf(result)));
Likelihood4 = sum(result1);

%calculate sigma11

sigma111 = -log(weight(1).*distribution(data(:,1),bzc(1),(group(1)+deltaage))+...
    weight(2).*distribution(data(:,1),bzc(2),group(2))+...
    weight(3).*distribution(data(:,1),bzc(3),group(3))+...
    weight(4).*distribution(data(:,1),bzc(4),group(4)));
sigma112 = -log(weight(1).*distribution(data(:,1),bzc(1),(group(1)-deltaage))+...
    weight(2).*distribution(data(:,1),bzc(2),group(2))+...
    weight(3).*distribution(data(:,1),bzc(3),group(3))+...
    weight(4).*distribution(data(:,1),bzc(4),group(4)));
sigma111 = sigma111((~isinf(sigma111)));
sigma112 = sigma112((~isinf(sigma112)));
sigma11 = (sum(sigma111)+sum(sigma112)-2.*Likelihood4)./(deltaage.^2);

%calculate sigma22
sigma221 = -log((weight(1)+deltaweight).*distribution(data(:,1),bzc(1),group(1))+...
    weight(2).*distribution(data(:,1),bzc(2),group(2))+...
    weight(3).*distribution(data(:,1),bzc(3),group(3))+...
    weight(4).*distribution(data(:,1),bzc(4),group(4)));

sigma222 = -log((weight(1)-deltaweight).*distribution(data(:,1),bzc(1),group(1))+...
    weight(2).*distribution(data(:,1),bzc(2),group(2))+...
    weight(3).*distribution(data(:,1),bzc(3),group(3))+...
    weight(4).*distribution(data(:,1),bzc(4),group(4)));

sigma221 = sigma221((~isinf(sigma221)));
sigma222 = sigma222((~isinf(sigma222)));
sigma22 = (sum(sigma221)+sum(sigma222)-2.*Likelihood4)./(deltaweight.^2);

%calculate sigma33
sigma331 = -log(weight(1).*distribution(data(:,1),bzc(1),group(1))+...
    weight(2).*distribution(data(:,1),bzc(2),(group(2)+deltaage))+...
    weight(3).*distribution(data(:,1),bzc(3),group(3))+...
    weight(4).*distribution(data(:,1),bzc(4),group(4)));

sigma332 = -log(weight(1).*distribution(data(:,1),bzc(1),group(1))+...
    weight(2).*distribution(data(:,1),bzc(2),(group(2)-deltaage))+...
    weight(3).*distribution(data(:,1),bzc(3),group(3))+...
    weight(4).*distribution(data(:,1),bzc(4),group(4)));

sigma331 = sigma331((~isinf(sigma331)));
sigma332 = sigma332((~isinf(sigma332)));
sigma33 = (sum(sigma331)+sum(sigma332)-2.*Likelihood4)./(deltaage.^2);

%calculate sigma44
sigma441 = -log(weight(1).*distribution(data(:,1),bzc(1),group(1))+...
    (weight(2)+deltaweight).*distribution(data(:,1),bzc(2),group(2))+...
    weight(3).*distribution(data(:,1),bzc(3),group(3))+...
    weight(4).*distribution(data(:,1),bzc(4),group(4)));

sigma442 = -log(weight(1).*distribution(data(:,1),bzc(1),group(1))+...
    (weight(2)-deltaweight).*distribution(data(:,1),bzc(2),group(2))+...
    weight(3).*distribution(data(:,1),bzc(3),group(3))+...
    weight(4).*distribution(data(:,1),bzc(4),group(4)));

sigma441 = sigma441((~isinf(sigma441)));
sigma442 = sigma442((~isinf(sigma442)));
sigma44 = (sum(sigma441)+sum(sigma442)-2.*Likelihood4)./(deltaweight.^2);

%calculate sigma55
sigma551 = -log(weight(1).*distribution(data(:,1),bzc(1),group(1))+...
    weight(2).*distribution(data(:,1),bzc(2),group(2))+...
    weight(3).*distribution(data(:,1),bzc(3),(group(3)+deltaage))+...
    weight(4).*distribution(data(:,1),bzc(4),group(4)));

sigma552 = -log(weight(1).*distribution(data(:,1),bzc(1),group(1))+...
    weight(2).*distribution(data(:,1),bzc(2),group(2))+...
    weight(3).*distribution(data(:,1),bzc(3),(group(3)-deltaage))+...
    weight(4).*distribution(data(:,1),bzc(4),group(4)));

sigma551 = sigma551((~isinf(sigma551)));
sigma552 = sigma552((~isinf(sigma552)));
sigma55 = (sum(sigma551)+sum(sigma552)-2.*Likelihood4)./(deltaage.^2);

%calculate sigma66
sigma661 = -log(weight(1).*distribution(data(:,1),bzc(1),group(1))+...
    weight(2).*distribution(data(:,1),bzc(2),group(2))+...
    (weight(3)+deltaweight).*distribution(data(:,1),bzc(3),group(3))+...
    weight(4).*distribution(data(:,1),bzc(4),group(4)));

sigma662 = -log(weight(1).*distribution(data(:,1),bzc(1),group(1))+...
    weight(2).*distribution(data(:,1),bzc(2),group(2))+...
    (weight(3)-deltaweight).*distribution(data(:,1),bzc(3),group(3))+...
    weight(4).*distribution(data(:,1),bzc(4),group(4)));

sigma661 = sigma661((~isinf(sigma661)));
sigma662 = sigma662((~isinf(sigma662)));
sigma66 = (sum(sigma661)+sum(sigma662)-2.*Likelihood4)./(deltaweight.^2);

%calculate sigma77
sigma771 = -log(weight(1).*distribution(data(:,1),bzc(1),group(1))+...
    weight(2).*distribution(data(:,1),bzc(2),group(2))+...
    weight(3).*distribution(data(:,1),bzc(3),group(3))+...
    weight(4).*distribution(data(:,1),bzc(4),(group(4)+deltaage)));

sigma772 = -log(weight(1).*distribution(data(:,1),bzc(1),group(1))+...
    weight(2).*distribution(data(:,1),bzc(2),group(2))+...
    weight(3).*distribution(data(:,1),bzc(3),group(3))+...
    weight(4).*distribution(data(:,1),bzc(4),(group(4)-deltaage)));

sigma771 = sigma771((~isinf(sigma771)));
sigma772 = sigma772((~isinf(sigma772)));
sigma77 = (sum(sigma771)+sum(sigma772)-2.*Likelihood4)./(deltaage.^2);


%calculate sigma88
sigma881 = -log(weight(1).*distribution(data(:,1),bzc(1),group(1))+...
    weight(2).*distribution(data(:,1),bzc(2),group(2))+...
    weight(3).*distribution(data(:,1),bzc(3),group(3))+...
    (weight(4)+deltaweight).*distribution(data(:,1),bzc(4),group(4)));

sigma882 = -log(weight(1).*distribution(data(:,1),bzc(1),group(1))+...
    weight(2).*distribution(data(:,1),bzc(2),group(2))+...
    weight(3).*distribution(data(:,1),bzc(3),group(3))+...
    (weight(4)-deltaweight).*distribution(data(:,1),bzc(4),group(4)));

sigma881 = sigma881((~isinf(sigma881)));
sigma882 = sigma882((~isinf(sigma882)));
sigma88 = (sum(sigma881)+sum(sigma882)-2.*Likelihood4)./(deltaweight.^2);

sigma = [sigma11;sigma22;sigma33;sigma44;sigma55;sigma66;sigma77;sigma88];

covinv = zeros(2*length(weight));
for i = 1:2*length(weight)
    covinv(i,i) = sigma(i);
end

sigmaall = pinv(covinv);
sigmaage = zeros(length(weight));

diagnose = diag(sigmaall);

for i = 1:length(weight)
    sigmaage(i,i) = diagnose(i*2-1);
end

end
