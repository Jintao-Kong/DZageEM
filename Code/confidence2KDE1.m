%% yield sigmaage k = 2
function [sigmaage,sigmaall] = confidence2KDE1(data,weight,group,sigma)

deltaweight = 0.01; deltaage = 1;
bzc = [sigma(1),sigma(2)];

result = -log(weight(1).*distribution(data(:,1),bzc(1),group(1))+...
    weight(2).*distribution(data(:,1),bzc(2),group(2)));

result1 = result((~isinf(result)));
Likelihood2KDE = sum(result1);

%calculate sigma11

sigma111 = -log(weight(1).*distribution(data(:,1),bzc(1),(group(1)+deltaage))+...
    weight(2).*distribution(data(:,1),bzc(2),group(2)));
sigma112 = -log(weight(1).*distribution(data(:,1),bzc(1),(group(1)-deltaage))+...
    weight(2).*distribution(data(:,1),bzc(2),group(2)));

sigma111 = sigma111((~isinf(sigma111)));
sigma112 = sigma112((~isinf(sigma112)));
sigma11 = (sum(sigma111)+sum(sigma112)-2.*Likelihood2KDE)./(deltaage.^2);

%calculate sigma22
sigma221 = -log((weight(1)+deltaweight).*distribution(data(:,1),bzc(1),group(1))+...
    weight(2).*distribution(data(:,1),bzc(2),group(2)));
sigma222 = -log((weight(1)-deltaweight).*distribution(data(:,1),bzc(1),group(1))+...
    weight(2).*distribution(data(:,1),bzc(2),group(2)));

sigma221 = sigma221((~isinf(sigma221)));
sigma222 = sigma222((~isinf(sigma222)));
sigma22 = (sum(sigma221)+sum(sigma222)-2.*Likelihood2KDE)./(deltaweight.^2);


%calculate sigma33
sigma331 = -log(weight(1).*distribution(data(:,1),bzc(1),group(1))+...
    weight(2).*distribution(data(:,1),bzc(2),(group(2)+deltaage)));
sigma332 = -log(weight(1).*distribution(data(:,1),bzc(1),group(1))+...
    weight(2).*distribution(data(:,1),bzc(2),(group(2)-deltaage)));

sigma331 = sigma331((~isinf(sigma331)));
sigma332 = sigma332((~isinf(sigma332)));
sigma33 = (sum(sigma331)+sum(sigma332)-2.*Likelihood2KDE)./(deltaage.^2);

%calculate sigma44
sigma441 = -log(weight(1).*distribution(data(:,1),bzc(1),group(1))+...
    (weight(2)+deltaweight).*distribution(data(:,1),bzc(2),group(2)));
sigma442 = -log(weight(1).*distribution(data(:,1),bzc(1),group(1))+...
    (weight(2)-deltaweight).*distribution(data(:,1),bzc(2),group(2)));

sigma441 = sigma441((~isinf(sigma441)));
sigma442 = sigma442((~isinf(sigma442)));
sigma44 = (sum(sigma441)+sum(sigma442)-2.*Likelihood2KDE)./(deltaweight.^2);

sigma = [sigma11;sigma22;sigma33;sigma44];

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
