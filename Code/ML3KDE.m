%k=3;KDE
function [weight3age_KDE, sigma3age_KDE, group3age_KDE, BIC3_KDE]...
    = ML3KDE (data,initialgroup,iteration)
% initial number need to be checked
initialweight = [0.3,0.3,0.4];
initialsigma = [30,40,50];

n = length(data);p = 3;
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
    alphadensity(:,3) = weight(i,3).*distribution(data(:,1),sigma(i,3),group(i,3));
    alphadensity(:,4) = alphadensity(:,1) + alphadensity(:,2) + alphadensity(:,3);
    a = alphadensity(:,1)./alphadensity(:,4); a1 = a((~isnan(a)));
    b = alphadensity(:,2)./alphadensity(:,4); b1 = b((~isnan(b)));
    c = alphadensity(:,3)./alphadensity(:,4); c1 = c((~isnan(c)));
    weight(i+1,1) = sum(a1)./n;
    weight(i+1,2) = sum(b1)./n;
    weight(i+1,3) = sum(c1)./n;
    
    miudensity1(:,1) = weight(i+1,1).*distribution(data(:,1),sigma(i,1),group(i,1));
    miudensity1(:,2) = weight(i+1,2).*distribution(data(:,1),sigma(i,2),group(i,2));
    miudensity1(:,3) = weight(i+1,3).*distribution(data(:,1),sigma(i,3),group(i,3));
    miudensity1(:,4) = miudensity1(:,1) + miudensity1(:,2) + miudensity1(:,3);
    a = miudensity1(:,1)./miudensity1(:,4); a1 = a((~isnan(a)));
    b = miudensity1(:,2)./miudensity1(:,4); b1 = b((~isnan(b)));parameter = 6;
    c = miudensity1(:,3)./miudensity1(:,4); c1 = c((~isnan(c)));
    miudensity(i,1) = sum(a1);
    miudensity(i,2) = sum(b1);
    miudensity(i,3) = sum(c1);
    miudensity2(:,1) = weight(i+1,1).*data(:,1).*distribution(data(:,1),sigma(i,1),group(i,1));
    miudensity2(:,2) = weight(i+1,2).*data(:,1).*distribution(data(:,1),sigma(i,2),group(i,2));
    miudensity2(:,3) = weight(i+1,3).*data(:,1).*distribution(data(:,1),sigma(i,3),group(i,3));
    a = miudensity2(:,1)./miudensity1(:,4); a1 = a((~isnan(a)));
    b = miudensity2(:,2)./miudensity1(:,4); b1 = b((~isnan(b)));
    c = miudensity2(:,3)./miudensity1(:,4); c1 = c((~isnan(c)));
    group(i+1,1) = sum(a1)./miudensity(i,1);
    group(i+1,2) = sum(b1)./miudensity(i,2);
    group(i+1,3) = sum(c1)./miudensity(i,3);sample_size = 2*n;
    
    sdensity1(:,1) = weight(i+1,1).*distribution(data(:,1),sigma(i,1),group(i+1,1));
    sdensity1(:,2) = weight(i+1,2).*distribution(data(:,1),sigma(i,2),group(i+1,2));
    sdensity1(:,3) = weight(i+1,3).*distribution(data(:,1),sigma(i,3),group(i+1,3));
    sdensity1(:,4) = sdensity1(:,1) + sdensity1(:,2) + sdensity1(:,3);
    a = sdensity1(:,1)./sdensity1(:,4); a1 = a((~isnan(a)));
    b = sdensity1(:,2)./sdensity1(:,4); b1 = b((~isnan(b)));
    c = sdensity1(:,3)./sdensity1(:,4); c1 = c((~isnan(c)));
    sdensity(i,1) = sum(a1);
    sdensity(i,2) = sum(b1);
    sdensity(i,3) = sum(c1);
    sdensity2(:,1) = weight(i+1,1).*(data(:,1)-group(i+1,1)).^2.*distribution(data(:,1),sigma(i,1),group(i+1,1));
    sdensity2(:,2) = weight(i+1,2).*(data(:,1)-group(i+1,2)).^2.*distribution(data(:,1),sigma(i,2),group(i+1,2));
    sdensity2(:,3) = weight(i+1,3).*(data(:,1)-group(i+1,3)).^2.*distribution(data(:,1),sigma(i,3),group(i+1,3));
    a = sdensity2(:,1)./sdensity1(:,4); a1 = a((~isnan(a)));
    b = sdensity2(:,2)./sdensity1(:,4); b1 = b((~isnan(b)));
    c = sdensity2(:,3)./sdensity1(:,4); c1 = c((~isnan(c)));
    sigma(i+1,1) = (sum(a1)./sdensity(i,1)).^0.5;
    sigma(i+1,2) = (sum(b1)./sdensity(i,2)).^0.5;
    sigma(i+1,3) = (sum(c1)./sdensity(i,3)).^0.5;
end

%% AIC&BIC
parameters = [group(end,:);weight(end,:);sigma(end,:)]';
parameters_sort = sortrows(parameters,1);

group3age_KDE = parameters_sort(:,1);
weight3age_KDE = parameters_sort(:,2);
sigma3age_KDE = parameters_sort(:,3);



result = log(weight3age_KDE(1).*distribution(data(:,1),sigma3age_KDE(1),group3age_KDE(1))+...
    weight3age_KDE(2).*distribution(data(:,1),sigma3age_KDE(2),group3age_KDE(2))+...
    weight3age_KDE(3).*distribution(data(:,1),sigma3age_KDE(3),group3age_KDE(3)));

result1 = result((~isinf(result)));
Likelihood3KDE = sum(result1);

BIC3_KDE = -2*Likelihood3KDE+ parameter.*log(sample_size);
end
