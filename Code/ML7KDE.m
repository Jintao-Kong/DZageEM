%k=7;KDE
function [weight7age_KDE, sigma7age_KDE, group7age_KDE, BIC7_KDE]...
    = ML7KDE (data,initialgroup,iteration)
% initial number need to be checked
initialweight = [0.1,0.2,0.1,0.2,0.1,0.1,0.2];
initialsigma = [10,20,20,25,30,30,30];

n = length(data);p = 7;
weight = zeros(iteration+1,p); weight(1,:) = initialweight;
group = zeros(iteration+1,p);group(1,:) = initialgroup;
sigma = zeros(iteration+1,p);sigma(1,:) = initialsigma;

%% start iteration
alphadensity = zeros(n,p+1);
miudensity = zeros(iteration,p); miudensity1 = zeros(n,p+1); miudensity2 = zeros(n,p);
sdensity = zeros(iteration,p); sdensity1 = zeros(n,p+1); sdensity2 = zeros(n,p);
% weight
for i = 1:iteration
    alphadensity(:,1) = weight(i,1).*distribution(data(:,1),sigma(i,1),group(i,1));
    alphadensity(:,2) = weight(i,2).*distribution(data(:,1),sigma(i,2),group(i,2));
    alphadensity(:,3) = weight(i,3).*distribution(data(:,1),sigma(i,3),group(i,3));
    alphadensity(:,4) = weight(i,4).*distribution(data(:,1),sigma(i,4),group(i,4));
    alphadensity(:,5) = weight(i,5).*distribution(data(:,1),sigma(i,5),group(i,5));
    alphadensity(:,6) = weight(i,6).*distribution(data(:,1),sigma(i,6),group(i,6));
    alphadensity(:,7) = weight(i,7).*distribution(data(:,1),sigma(i,7),group(i,7));
    alphadensity(:,8) = alphadensity(:,1) + alphadensity(:,2) + alphadensity(:,3) + alphadensity(:,4)...
        + alphadensity(:,5) + alphadensity(:,6) + alphadensity(:,7);
    a = alphadensity(:,1)./alphadensity(:,8); a1 = a((~isnan(a)));
    b = alphadensity(:,2)./alphadensity(:,8); b1 = b((~isnan(b)));
    c = alphadensity(:,3)./alphadensity(:,8); c1 = c((~isnan(c)));
    d = alphadensity(:,4)./alphadensity(:,8); d1 = d((~isnan(d)));
    e = alphadensity(:,5)./alphadensity(:,8); e1 = e((~isnan(e)));
    f = alphadensity(:,6)./alphadensity(:,8); f1 = f((~isnan(f)));
    g = alphadensity(:,7)./alphadensity(:,8); g1 = g((~isnan(g)));
    weight(i+1,1) = sum(a1)./n;
    weight(i+1,2) = sum(b1)./n;
    weight(i+1,3) = sum(c1)./n;
    weight(i+1,4) = sum(d1)./n;
    weight(i+1,5) = sum(e1)./n;
    weight(i+1,6) = sum(f1)./n;
    weight(i+1,7) = sum(g1)./n;
    % group
    miudensity1(:,1) = weight(i+1,1).*distribution(data(:,1),sigma(i,1),group(i,1));
    miudensity1(:,2) = weight(i+1,2).*distribution(data(:,1),sigma(i,2),group(i,2));
    miudensity1(:,3) = weight(i+1,3).*distribution(data(:,1),sigma(i,3),group(i,3));
    miudensity1(:,4) = weight(i+1,4).*distribution(data(:,1),sigma(i,4),group(i,4));
    miudensity1(:,5) = weight(i+1,5).*distribution(data(:,1),sigma(i,5),group(i,5));
    miudensity1(:,6) = weight(i+1,6).*distribution(data(:,1),sigma(i,6),group(i,6));
    miudensity1(:,7) = weight(i+1,7).*distribution(data(:,1),sigma(i,7),group(i,7));
    miudensity1(:,8) = miudensity1(:,1) + miudensity1(:,2) + miudensity1(:,3) + miudensity1(:,4)...
        + miudensity1(:,5) + miudensity1(:,6) + miudensity1(:,7);
    
    a = miudensity1(:,1)./miudensity1(:,8); a1 = a((~isnan(a)));
    b = miudensity1(:,2)./miudensity1(:,8); b1 = b((~isnan(b)));
    c = miudensity1(:,3)./miudensity1(:,8); c1 = c((~isnan(c)));
    d = miudensity1(:,4)./miudensity1(:,8); d1 = d((~isnan(d)));
    e = miudensity1(:,5)./miudensity1(:,8); e1 = e((~isnan(e)));
    f = miudensity1(:,6)./miudensity1(:,8); f1 = f((~isnan(f)));
    g = miudensity1(:,7)./miudensity1(:,8); g1 = g((~isnan(g)));
    
    miudensity(i,1) = sum(a1);
    miudensity(i,2) = sum(b1);
    miudensity(i,3) = sum(c1);
    miudensity(i,4) = sum(d1);
    miudensity(i,5) = sum(e1);
    miudensity(i,6) = sum(f1);
    miudensity(i,7) = sum(g1);
    
    miudensity2(:,1) = weight(i+1,1).*data(:,1).*distribution(data(:,1),sigma(i,1),group(i,1));
    miudensity2(:,2) = weight(i+1,2).*data(:,1).*distribution(data(:,1),sigma(i,2),group(i,2));
    miudensity2(:,3) = weight(i+1,3).*data(:,1).*distribution(data(:,1),sigma(i,3),group(i,3));
    miudensity2(:,4) = weight(i+1,4).*data(:,1).*distribution(data(:,1),sigma(i,4),group(i,4));
    miudensity2(:,5) = weight(i+1,5).*data(:,1).*distribution(data(:,1),sigma(i,5),group(i,5));
    miudensity2(:,6) = weight(i+1,6).*data(:,1).*distribution(data(:,1),sigma(i,6),group(i,6));
    miudensity2(:,7) = weight(i+1,7).*data(:,1).*distribution(data(:,1),sigma(i,7),group(i,7));
    
    a = miudensity2(:,1)./miudensity1(:,8); a1 = a((~isnan(a)));
    b = miudensity2(:,2)./miudensity1(:,8); b1 = b((~isnan(b)));
    c = miudensity2(:,3)./miudensity1(:,8); c1 = c((~isnan(c)));
    d = miudensity2(:,4)./miudensity1(:,8); d1 = d((~isnan(d)));
    e = miudensity2(:,5)./miudensity1(:,8); e1 = e((~isnan(e)));
    f = miudensity2(:,6)./miudensity1(:,8); f1 = f((~isnan(f)));
    g = miudensity2(:,7)./miudensity1(:,8); g1 = g((~isnan(g)));
    
    group(i+1,1) = sum(a1)./miudensity(i,1);
    group(i+1,2) = sum(b1)./miudensity(i,2);
    group(i+1,3) = sum(c1)./miudensity(i,3);
    group(i+1,4) = sum(d1)./miudensity(i,4);
    group(i+1,5) = sum(e1)./miudensity(i,5);
    group(i+1,6) = sum(f1)./miudensity(i,6);
    group(i+1,7) = sum(g1)./miudensity(i,7);sample_size = 2*n;
    % sigma
    sdensity1(:,1) = weight(i+1,1).*distribution(data(:,1),sigma(i,1),group(i+1,1));
    sdensity1(:,2) = weight(i+1,2).*distribution(data(:,1),sigma(i,2),group(i+1,2));
    sdensity1(:,3) = weight(i+1,3).*distribution(data(:,1),sigma(i,3),group(i+1,3));
    sdensity1(:,4) = weight(i+1,4).*distribution(data(:,1),sigma(i,4),group(i+1,4));
    sdensity1(:,5) = weight(i+1,5).*distribution(data(:,1),sigma(i,5),group(i+1,5));
    sdensity1(:,6) = weight(i+1,6).*distribution(data(:,1),sigma(i,6),group(i+1,6));
    sdensity1(:,7) = weight(i+1,7).*distribution(data(:,1),sigma(i,7),group(i+1,7));
    sdensity1(:,8) = sdensity1(:,1) + sdensity1(:,2) + sdensity1(:,3) + sdensity1(:,4)...
        + sdensity1(:,5) + sdensity1(:,6) + sdensity1(:,7); parameter = 14;
    
    a = sdensity1(:,1)./sdensity1(:,8); a1 = a((~isnan(a)));
    b = sdensity1(:,2)./sdensity1(:,8); b1 = b((~isnan(b)));
    c = sdensity1(:,3)./sdensity1(:,8); c1 = c((~isnan(c)));
    d = sdensity1(:,4)./sdensity1(:,8); d1 = d((~isnan(d)));
    e = sdensity1(:,5)./sdensity1(:,8); e1 = e((~isnan(e)));
    f = sdensity1(:,6)./sdensity1(:,8); f1 = f((~isnan(f)));
    g = sdensity1(:,7)./sdensity1(:,8); g1 = g((~isnan(g)));
    
    sdensity(i,1) = sum(a1);
    sdensity(i,2) = sum(b1);
    sdensity(i,3) = sum(c1);
    sdensity(i,4) = sum(d1);
    sdensity(i,5) = sum(e1);
    sdensity(i,6) = sum(f1);
    sdensity(i,7) = sum(g1);
    
    sdensity2(:,1) = weight(i+1,1).*(data(:,1)-group(i+1,1)).^2.*distribution(data(:,1),sigma(i,1),group(i+1,1));
    sdensity2(:,2) = weight(i+1,2).*(data(:,1)-group(i+1,2)).^2.*distribution(data(:,1),sigma(i,2),group(i+1,2));
    sdensity2(:,3) = weight(i+1,3).*(data(:,1)-group(i+1,3)).^2.*distribution(data(:,1),sigma(i,3),group(i+1,3));
    sdensity2(:,4) = weight(i+1,4).*(data(:,1)-group(i+1,4)).^2.*distribution(data(:,1),sigma(i,4),group(i+1,4));
    sdensity2(:,5) = weight(i+1,5).*(data(:,1)-group(i+1,5)).^2.*distribution(data(:,1),sigma(i,5),group(i+1,5));
    sdensity2(:,6) = weight(i+1,6).*(data(:,1)-group(i+1,6)).^2.*distribution(data(:,1),sigma(i,6),group(i+1,6));
    sdensity2(:,7) = weight(i+1,7).*(data(:,1)-group(i+1,7)).^2.*distribution(data(:,1),sigma(i,7),group(i+1,7));
    
    a = sdensity2(:,1)./sdensity1(:,8); a1 = a((~isnan(a)));
    b = sdensity2(:,2)./sdensity1(:,8); b1 = b((~isnan(b)));
    c = sdensity2(:,3)./sdensity1(:,8); c1 = c((~isnan(c)));
    d = sdensity2(:,4)./sdensity1(:,8); d1 = d((~isnan(d)));
    e = sdensity2(:,5)./sdensity1(:,8); e1 = e((~isnan(e)));
    f = sdensity2(:,6)./sdensity1(:,8); f1 = f((~isnan(f)));
    g = sdensity2(:,7)./sdensity1(:,8); g1 = g((~isnan(g)));
    
    sigma(i+1,1) = (sum(a1)./sdensity(i,1)).^0.5;
    sigma(i+1,2) = (sum(b1)./sdensity(i,2)).^0.5;
    sigma(i+1,3) = (sum(c1)./sdensity(i,3)).^0.5;
    sigma(i+1,4) = (sum(d1)./sdensity(i,4)).^0.5;
    sigma(i+1,5) = (sum(e1)./sdensity(i,5)).^0.5;
    sigma(i+1,6) = (sum(f1)./sdensity(i,6)).^0.5;
    sigma(i+1,7) = (sum(g1)./sdensity(i,7)).^0.5;
end
%% AIC&BIC
parameters = [group(end,:);weight(end,:);sigma(end,:)]';
parameters_sort = sortrows(parameters,1);

group7age_KDE = parameters_sort(:,1);
weight7age_KDE = parameters_sort(:,2);
sigma7age_KDE = parameters_sort(:,3);


result = log(weight7age_KDE(1).*distribution(data(:,1),sigma7age_KDE(1),group7age_KDE(1))+...
    weight7age_KDE(2).*distribution(data(:,1),sigma7age_KDE(2),group7age_KDE(2))+...
    weight7age_KDE(3).*distribution(data(:,1),sigma7age_KDE(3),group7age_KDE(3))+...
    weight7age_KDE(4).*distribution(data(:,1),sigma7age_KDE(4),group7age_KDE(4))+...
    weight7age_KDE(5).*distribution(data(:,1),sigma7age_KDE(5),group7age_KDE(5))+...
    weight7age_KDE(6).*distribution(data(:,1),sigma7age_KDE(6),group7age_KDE(6))+...
    weight7age_KDE(7).*distribution(data(:,1),sigma7age_KDE(7),group7age_KDE(7)));

result1 = result((~isinf(result)));
Likelihood7KDE = sum(result1);

BIC7_KDE = -2*Likelihood7KDE+parameter.*log(sample_size);
end