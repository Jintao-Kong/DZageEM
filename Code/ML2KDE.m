%%k=2;KDE
function [weight2age_KDE, sigma2age_KDE, group2age_KDE, BIC2_KDE]...
    = ML2KDE (data,initialgroup,iteration)
% initial number need to be checked
initialweight = [0.4,0.6];
initialsigma = [50,40];

n = length(data);p = 2;
weight = zeros(iteration+1,p); weight(1,:) = initialweight;
group = zeros(iteration+1,p);group(1,:) = initialgroup;
sigma = zeros(iteration+1,p);sigma(1,:) = initialsigma;
%% start iteration
alphadensity = zeros(n,p+1);
miudensity = zeros(iteration,p); miudensity1 = zeros(n,p+1); miudensity2 = zeros(n,p);
sdensity = zeros(iteration,p); sdensity1 = zeros(n,p+1); sdensity2 = zeros(n,p);

for i = 1:iteration
    alphadensity(:,1) = weight(i,1).*distribution(data(:,1),sigma(i,1),group(i,1));
    alphadensity(:,2) = weight(i,2).*distribution(data(:,1),sigma(i,2),group(i,2));
    alphadensity(:,3) = alphadensity(:,1) + alphadensity(:,2);
    a = alphadensity(:,1)./alphadensity(:,3); a1 = a((~isnan(a)));
    b = alphadensity(:,2)./alphadensity(:,3); b1 = b((~isnan(b)));
    weight(i+1,1) = sum(a1)./n;
    weight(i+1,2) = sum(b1)./n;
    
    miudensity1(:,1) = weight(i+1,1).*distribution(data(:,1),sigma(i,1),group(i,1));
    miudensity1(:,2) = weight(i+1,2).*distribution(data(:,1),sigma(i,2),group(i,2));
    miudensity1(:,3) = miudensity1(:,1) + miudensity1(:,2);
    a = miudensity1(:,1)./miudensity1(:,3); a1 = a((~isnan(a)));
    b = miudensity1(:,2)./miudensity1(:,3); b1 = b((~isnan(b)));
    miudensity(i,1) = sum(a1);
    miudensity(i,2) = sum(b1);
    miudensity2(:,1) = weight(i+1,1).*data(:,1).*distribution(data(:,1),sigma(i,1),group(i,1));
    miudensity2(:,2) = weight(i+1,2).*data(:,1).*distribution(data(:,1),sigma(i,2),group(i,2));
    a = miudensity2(:,1)./miudensity1(:,3); a1 = a((~isnan(a)));
    b = miudensity2(:,2)./miudensity1(:,3); b1 = b((~isnan(b)));
    group(i+1,1) = sum(a1)./miudensity(i,1);
    group(i+1,2) = sum(b1)./miudensity(i,2);
    
    
    sdensity1(:,1) = weight(i+1,1).*distribution(data(:,1),sigma(i,1),group(i+1,1));
    sdensity1(:,2) = weight(i+1,2).*distribution(data(:,1),sigma(i,2),group(i+1,2));
    sdensity1(:,3) = sdensity1(:,1) + sdensity1(:,2);
    a = sdensity1(:,1)./sdensity1(:,3); a1 = a((~isnan(a)));
    b = sdensity1(:,2)./sdensity1(:,3); b1 = b((~isnan(b)));
    sdensity(i,1) = sum(a1);parameter = 4;
    sdensity(i,2) = sum(b1);sample_size = 2*n;
    
    sdensity2(:,1) = weight(i+1,1).*(data(:,1)-group(i+1,1)).^2.*distribution(data(:,1),sigma(i,1),group(i+1,1));
    sdensity2(:,2) = weight(i+1,2).*(data(:,1)-group(i+1,2)).^2.*distribution(data(:,1),sigma(i,2),group(i+1,2));
    a = sdensity2(:,1)./sdensity1(:,3); a1 = a((~isnan(a)));
    b = sdensity2(:,2)./sdensity1(:,3); b1 = b((~isnan(b)));
    sigma(i+1,1) = (sum(a1)./sdensity(i,1)).^0.5;
    sigma(i+1,2) = (sum(b1)./sdensity(i,2)).^0.5;
end
%% AIC&BIC
parameters = [group(end,:);weight(end,:);sigma(end,:)]';
parameters_sort = sortrows(parameters,1);

group2age_KDE = parameters_sort(:,1);
weight2age_KDE = parameters_sort(:,2);
sigma2age_KDE = parameters_sort(:,3);



result = log(weight2age_KDE(1).*distribution(data(:,1),sigma2age_KDE(1),group2age_KDE(1))+...
    weight2age_KDE(2).*distribution(data(:,1),sigma2age_KDE(2),group2age_KDE(2)));

result1 = result((~isinf(result)));
Likelihood2KDE = sum(result1);

BIC2_KDE = -2*Likelihood2KDE+parameter.*log(sample_size);
end
