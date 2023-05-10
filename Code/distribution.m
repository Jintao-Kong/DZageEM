function r = distribution(age,error,group)
r = (error.*sqrt(2.*pi)).^-1.*exp(-(age-group).^2./(2.*error.^2));