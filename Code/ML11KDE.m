%k=11;KDE
function [weight11age_KDE, sigma11age_KDE, group11age_KDE, BIC11_KDE]...
    = ML11KDE (data,initialgroup,iteration)
% initial number need to be checked
initialweight = ones(1,11).*(1/11);
initialsigma = ones(1,11).*15;

n = length(data);p = 11;
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
    alphadensity(:,8) = weight(i,8).*distribution(data(:,1),sigma(i,8),group(i,8));
    alphadensity(:,9) = weight(i,9).*distribution(data(:,1),sigma(i,9),group(i,9));
    alphadensity(:,10) = weight(i,10).*distribution(data(:,1),sigma(i,10),group(i,10));
    alphadensity(:,11) = weight(i,11).*distribution(data(:,1),sigma(i,11),group(i,11));
    alphadensity(:,12) = alphadensity(:,1) + alphadensity(:,2) + alphadensity(:,3) + alphadensity(:,4)...
        + alphadensity(:,5) + alphadensity(:,6) + alphadensity(:,7) + alphadensity(:,8) + alphadensity(:,9)...
        + alphadensity(:,10) + alphadensity(:,11);
    a = alphadensity(:,1)./alphadensity(:,12); a1 = a((~isnan(a)));
    b = alphadensity(:,2)./alphadensity(:,12); b1 = b((~isnan(b)));
    c = alphadensity(:,3)./alphadensity(:,12); c1 = c((~isnan(c)));
    d = alphadensity(:,4)./alphadensity(:,12); d1 = d((~isnan(d)));
    e = alphadensity(:,5)./alphadensity(:,12); e1 = e((~isnan(e)));
    f = alphadensity(:,6)./alphadensity(:,12); f1 = f((~isnan(f)));
    g = alphadensity(:,7)./alphadensity(:,12); g1 = g((~isnan(g)));
    h = alphadensity(:,8)./alphadensity(:,12); h1 = h((~isnan(h)));
    j = alphadensity(:,9)./alphadensity(:,12); j1 = j((~isnan(j)));
    k = alphadensity(:,10)./alphadensity(:,12); k1 = k((~isnan(k)));
    L = alphadensity(:,11)./alphadensity(:,12); L1 = L((~isnan(L)));
    
    weight(i+1,1) = sum(a1)./n;
    weight(i+1,2) = sum(b1)./n;
    weight(i+1,3) = sum(c1)./n;
    weight(i+1,4) = sum(d1)./n;
    weight(i+1,5) = sum(e1)./n;
    weight(i+1,6) = sum(f1)./n;
    weight(i+1,7) = sum(g1)./n;
    weight(i+1,8) = sum(h1)./n;
    weight(i+1,9) = sum(j1)./n;
    weight(i+1,10) = sum(k1)./n;
    weight(i+1,11) = sum(L1)./n;
    % group
    miudensity1(:,1) = weight(i+1,1).*distribution(data(:,1),sigma(i,1),group(i,1));
    miudensity1(:,2) = weight(i+1,2).*distribution(data(:,1),sigma(i,2),group(i,2));
    miudensity1(:,3) = weight(i+1,3).*distribution(data(:,1),sigma(i,3),group(i,3));
    miudensity1(:,4) = weight(i+1,4).*distribution(data(:,1),sigma(i,4),group(i,4));
    miudensity1(:,5) = weight(i+1,5).*distribution(data(:,1),sigma(i,5),group(i,5));
    miudensity1(:,6) = weight(i+1,6).*distribution(data(:,1),sigma(i,6),group(i,6));
    miudensity1(:,7) = weight(i+1,7).*distribution(data(:,1),sigma(i,7),group(i,7));
    miudensity1(:,8) = weight(i+1,8).*distribution(data(:,1),sigma(i,8),group(i,8));
    miudensity1(:,9) = weight(i+1,9).*distribution(data(:,1),sigma(i,9),group(i,9));
    miudensity1(:,10) = weight(i+1,10).*distribution(data(:,1),sigma(i,10),group(i,10));
    miudensity1(:,11) = weight(i+1,11).*distribution(data(:,1),sigma(i,11),group(i,11));
    miudensity1(:,12) = miudensity1(:,1) + miudensity1(:,2) + miudensity1(:,3) + miudensity1(:,4)...
        + miudensity1(:,5) + miudensity1(:,6) + miudensity1(:,7) + miudensity1(:,8) + miudensity1(:,9)...
        + miudensity1(:,10) + miudensity1(:,11);
    
    a = miudensity1(:,1)./miudensity1(:,12); a1 = a((~isnan(a)));
    b = miudensity1(:,2)./miudensity1(:,12); b1 = b((~isnan(b)));
    c = miudensity1(:,3)./miudensity1(:,12); c1 = c((~isnan(c)));
    d = miudensity1(:,4)./miudensity1(:,12); d1 = d((~isnan(d)));
    e = miudensity1(:,5)./miudensity1(:,12); e1 = e((~isnan(e)));
    f = miudensity1(:,6)./miudensity1(:,12); f1 = f((~isnan(f)));
    g = miudensity1(:,7)./miudensity1(:,12); g1 = g((~isnan(g)));
    h = miudensity1(:,8)./miudensity1(:,12); h1 = h((~isnan(h)));
    j = miudensity1(:,9)./miudensity1(:,12); j1 = j((~isnan(j)));
    k = miudensity1(:,10)./miudensity1(:,12); k1 = k((~isnan(k)));
    L = miudensity1(:,11)./miudensity1(:,12); L1 = L((~isnan(L)));
    
    miudensity(i,1) = sum(a1);
    miudensity(i,2) = sum(b1);
    miudensity(i,3) = sum(c1);
    miudensity(i,4) = sum(d1);
    miudensity(i,5) = sum(e1);
    miudensity(i,6) = sum(f1);
    miudensity(i,7) = sum(g1);
    miudensity(i,8) = sum(h1);
    miudensity(i,9) = sum(j1);
    miudensity(i,10) = sum(k1);
    miudensity(i,11) = sum(L1);
    
    miudensity2(:,1) = weight(i+1,1).*data(:,1).*distribution(data(:,1),sigma(i,1),group(i,1));
    miudensity2(:,2) = weight(i+1,2).*data(:,1).*distribution(data(:,1),sigma(i,2),group(i,2));
    miudensity2(:,3) = weight(i+1,3).*data(:,1).*distribution(data(:,1),sigma(i,3),group(i,3));
    miudensity2(:,4) = weight(i+1,4).*data(:,1).*distribution(data(:,1),sigma(i,4),group(i,4));
    miudensity2(:,5) = weight(i+1,5).*data(:,1).*distribution(data(:,1),sigma(i,5),group(i,5));
    miudensity2(:,6) = weight(i+1,6).*data(:,1).*distribution(data(:,1),sigma(i,6),group(i,6));
    miudensity2(:,7) = weight(i+1,7).*data(:,1).*distribution(data(:,1),sigma(i,7),group(i,7));
    miudensity2(:,8) = weight(i+1,8).*data(:,1).*distribution(data(:,1),sigma(i,8),group(i,8));
    miudensity2(:,9) = weight(i+1,9).*data(:,1).*distribution(data(:,1),sigma(i,9),group(i,9));
    miudensity2(:,10) = weight(i+1,10).*data(:,1).*distribution(data(:,1),sigma(i,10),group(i,10));
    miudensity2(:,11) = weight(i+1,11).*data(:,1).*distribution(data(:,1),sigma(i,11),group(i,11));
    
    a = miudensity2(:,1)./miudensity1(:,12); a1 = a((~isnan(a)));
    b = miudensity2(:,2)./miudensity1(:,12); b1 = b((~isnan(b)));
    c = miudensity2(:,3)./miudensity1(:,12); c1 = c((~isnan(c)));
    d = miudensity2(:,4)./miudensity1(:,12); d1 = d((~isnan(d)));
    e = miudensity2(:,5)./miudensity1(:,12); e1 = e((~isnan(e)));
    f = miudensity2(:,6)./miudensity1(:,12); f1 = f((~isnan(f)));
    g = miudensity2(:,7)./miudensity1(:,12); g1 = g((~isnan(g)));
    h = miudensity2(:,8)./miudensity1(:,12); h1 = h((~isnan(h)));
    j = miudensity2(:,9)./miudensity1(:,12); j1 = j((~isnan(j)));
    k = miudensity2(:,10)./miudensity1(:,12); k1 = k((~isnan(k)));
    L = miudensity2(:,11)./miudensity1(:,12); L1 = L((~isnan(L)));
    
    group(i+1,1) = sum(a1)./miudensity(i,1);
    group(i+1,2) = sum(b1)./miudensity(i,2);
    group(i+1,3) = sum(c1)./miudensity(i,3);
    group(i+1,4) = sum(d1)./miudensity(i,4);
    group(i+1,5) = sum(e1)./miudensity(i,5);
    group(i+1,6) = sum(f1)./miudensity(i,6);
    group(i+1,7) = sum(g1)./miudensity(i,7);
    group(i+1,8) = sum(h1)./miudensity(i,8);
    group(i+1,9) = sum(j1)./miudensity(i,9);
    group(i+1,10) = sum(k1)./miudensity(i,10);
    group(i+1,11) = sum(L1)./miudensity(i,11);
    % sigma
    sdensity1(:,1) = weight(i+1,1).*distribution(data(:,1),sigma(i,1),group(i+1,1));
    sdensity1(:,2) = weight(i+1,2).*distribution(data(:,1),sigma(i,2),group(i+1,2));
    sdensity1(:,3) = weight(i+1,3).*distribution(data(:,1),sigma(i,3),group(i+1,3));
    sdensity1(:,4) = weight(i+1,4).*distribution(data(:,1),sigma(i,4),group(i+1,4));
    sdensity1(:,5) = weight(i+1,5).*distribution(data(:,1),sigma(i,5),group(i+1,5));
    sdensity1(:,6) = weight(i+1,6).*distribution(data(:,1),sigma(i,6),group(i+1,6));
    sdensity1(:,7) = weight(i+1,7).*distribution(data(:,1),sigma(i,7),group(i+1,7));
    sdensity1(:,8) = weight(i+1,8).*distribution(data(:,1),sigma(i,8),group(i+1,8));
    sdensity1(:,9) = weight(i+1,9).*distribution(data(:,1),sigma(i,9),group(i+1,9));
    sdensity1(:,10) = weight(i+1,10).*distribution(data(:,1),sigma(i,10),group(i+1,10));
    sdensity1(:,11) = weight(i+1,11).*distribution(data(:,1),sigma(i,11),group(i+1,11));
    sdensity1(:,12) = sdensity1(:,1) + sdensity1(:,2) + sdensity1(:,3) + sdensity1(:,4)...
        + sdensity1(:,5) + sdensity1(:,6) + sdensity1(:,7) + sdensity1(:,8) + sdensity1(:,9)...
        + sdensity1(:,10) + sdensity1(:,11);
    
    a = sdensity1(:,1)./sdensity1(:,12); a1 = a((~isnan(a)));
    b = sdensity1(:,2)./sdensity1(:,12); b1 = b((~isnan(b)));
    c = sdensity1(:,3)./sdensity1(:,12); c1 = c((~isnan(c)));
    d = sdensity1(:,4)./sdensity1(:,12); d1 = d((~isnan(d)));
    e = sdensity1(:,5)./sdensity1(:,12); e1 = e((~isnan(e)));
    f = sdensity1(:,6)./sdensity1(:,12); f1 = f((~isnan(f)));
    g = sdensity1(:,7)./sdensity1(:,12); g1 = g((~isnan(g)));
    h = sdensity1(:,8)./sdensity1(:,12); h1 = h((~isnan(h)));
    j = sdensity1(:,9)./sdensity1(:,12); j1 = j((~isnan(j)));
    k = sdensity1(:,10)./sdensity1(:,12); k1 = k((~isnan(k)));parameter = 2*11 * (2/3);
    L = sdensity1(:,11)./sdensity1(:,12); L1 = L((~isnan(L))); 
    
    sdensity(i,1) = sum(a1);
    sdensity(i,2) = sum(b1);
    sdensity(i,3) = sum(c1);
    sdensity(i,4) = sum(d1);
    sdensity(i,5) = sum(e1);
    sdensity(i,6) = sum(f1);
    sdensity(i,7) = sum(g1);
    sdensity(i,8) = sum(h1);
    sdensity(i,9) = sum(j1);
    sdensity(i,10) = sum(k1);
    sdensity(i,11) = sum(L1);
    
    sdensity2(:,1) = weight(i+1,1).*(data(:,1)-group(i+1,1)).^2.*distribution(data(:,1),sigma(i,1),group(i+1,1));
    sdensity2(:,2) = weight(i+1,2).*(data(:,1)-group(i+1,2)).^2.*distribution(data(:,1),sigma(i,2),group(i+1,2));
    sdensity2(:,3) = weight(i+1,3).*(data(:,1)-group(i+1,3)).^2.*distribution(data(:,1),sigma(i,3),group(i+1,3));
    sdensity2(:,4) = weight(i+1,4).*(data(:,1)-group(i+1,4)).^2.*distribution(data(:,1),sigma(i,4),group(i+1,4));
    sdensity2(:,5) = weight(i+1,5).*(data(:,1)-group(i+1,5)).^2.*distribution(data(:,1),sigma(i,5),group(i+1,5));
    sdensity2(:,6) = weight(i+1,6).*(data(:,1)-group(i+1,6)).^2.*distribution(data(:,1),sigma(i,6),group(i+1,6));
    sdensity2(:,7) = weight(i+1,7).*(data(:,1)-group(i+1,7)).^2.*distribution(data(:,1),sigma(i,7),group(i+1,7));
    sdensity2(:,8) = weight(i+1,8).*(data(:,1)-group(i+1,8)).^2.*distribution(data(:,1),sigma(i,8),group(i+1,8));
    sdensity2(:,9) = weight(i+1,9).*(data(:,1)-group(i+1,9)).^2.*distribution(data(:,1),sigma(i,9),group(i+1,9));
    sdensity2(:,10) = weight(i+1,10).*(data(:,1)-group(i+1,10)).^2.*distribution(data(:,1),sigma(i,10),group(i+1,10));
    sdensity2(:,11) = weight(i+1,11).*(data(:,1)-group(i+1,11)).^2.*distribution(data(:,1),sigma(i,11),group(i+1,11));
    
    a = sdensity2(:,1)./sdensity1(:,12); a1 = a((~isnan(a)));
    b = sdensity2(:,2)./sdensity1(:,12); b1 = b((~isnan(b)));
    c = sdensity2(:,3)./sdensity1(:,12); c1 = c((~isnan(c)));
    d = sdensity2(:,4)./sdensity1(:,12); d1 = d((~isnan(d)));
    e = sdensity2(:,5)./sdensity1(:,12); e1 = e((~isnan(e)));
    f = sdensity2(:,6)./sdensity1(:,12); f1 = f((~isnan(f)));
    g = sdensity2(:,7)./sdensity1(:,12); g1 = g((~isnan(g)));
    h = sdensity2(:,8)./sdensity1(:,12); h1 = h((~isnan(h)));
    j = sdensity2(:,9)./sdensity1(:,12); j1 = j((~isnan(j)));
    k = sdensity2(:,10)./sdensity1(:,12); k1 = k((~isnan(k)));
    L = sdensity2(:,11)./sdensity1(:,12); L1 = L((~isnan(L)));
    
    sigma(i+1,1) = (sum(a1)./sdensity(i,1)).^0.5;
    sigma(i+1,2) = (sum(b1)./sdensity(i,2)).^0.5;
    sigma(i+1,3) = (sum(c1)./sdensity(i,3)).^0.5;
    sigma(i+1,4) = (sum(d1)./sdensity(i,4)).^0.5;
    sigma(i+1,5) = (sum(e1)./sdensity(i,5)).^0.5;
    sigma(i+1,6) = (sum(f1)./sdensity(i,6)).^0.5;
    sigma(i+1,7) = (sum(g1)./sdensity(i,7)).^0.5;
    sigma(i+1,8) = (sum(h1)./sdensity(i,8)).^0.5;
    sigma(i+1,9) = (sum(j1)./sdensity(i,9)).^0.5;
    sigma(i+1,10) = (sum(k1)./sdensity(i,10)).^0.5;
    sigma(i+1,11) = (sum(L1)./sdensity(i,11)).^0.5;
end
%% AIC&BIC
parameters = [group(end,:);weight(end,:);sigma(end,:)]';
parameters_sort = sortrows(parameters,1);

group11age_KDE = parameters_sort(:,1);
weight11age_KDE = parameters_sort(:,2);
sigma11age_KDE = parameters_sort(:,3);


result = log(weight11age_KDE(1).*distribution(data(:,1),sigma11age_KDE(1),group11age_KDE(1))+...
    weight11age_KDE(2).*distribution(data(:,1),sigma11age_KDE(2),group11age_KDE(2))+...
    weight11age_KDE(3).*distribution(data(:,1),sigma11age_KDE(3),group11age_KDE(3))+...
    weight11age_KDE(4).*distribution(data(:,1),sigma11age_KDE(4),group11age_KDE(4))+...
    weight11age_KDE(5).*distribution(data(:,1),sigma11age_KDE(5),group11age_KDE(5))+...
    weight11age_KDE(6).*distribution(data(:,1),sigma11age_KDE(6),group11age_KDE(6))+...
    weight11age_KDE(7).*distribution(data(:,1),sigma11age_KDE(7),group11age_KDE(7))+...
    weight11age_KDE(8).*distribution(data(:,1),sigma11age_KDE(8),group11age_KDE(8))+...
    weight11age_KDE(9).*distribution(data(:,1),sigma11age_KDE(9),group11age_KDE(9))+...
    weight11age_KDE(10).*distribution(data(:,1),sigma11age_KDE(10),group11age_KDE(10))+...
    weight11age_KDE(11).*distribution(data(:,1),sigma11age_KDE(11),group11age_KDE(11)));
result1 = result((~isinf(result)));

Likelihood11KDE = sum(result1);

BIC11_KDE = -2*Likelihood11KDE+parameter*log(n);
end