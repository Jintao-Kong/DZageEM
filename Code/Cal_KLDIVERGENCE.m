function result = Cal_KLDIVERGENCE(data1,data2)
x = 10^-315;
TempKL1 = data1 .* (log(data1+x) - log(data2+x));
TempKL2 = data2 .* (log(data2+x) - log(data1+x));
result = (sum(TempKL1) + sum(TempKL2))./2;
end
