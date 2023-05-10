function elipse1(x,y,sigma,k,color)
%input first age or proportion, second age or proportion, and covariance

[V,D] = eig(sigma);
[D_sort,index] = sort(diag(D),'descend');

V_sort = V(:,index);


c = chi2inv(0.95,k).^0.5;
h = x;%对协方差矩阵求特征值特征向量，便可以得知椭圆的长短轴方向及长度；
%需要注意，在采用特征向量进行旋转时，先假设原椭圆在原点，先别加x0，y0
%在旋转后再分别与x0，y0相加
k = y;
a = max(abs(c.*(D(1,1).^0.5)),abs(c.*(D(2,2).^0.5)));
b = min(abs(c.*(D(1,1).^0.5)),abs(c.*(D(2,2).^0.5)));

t = -pi:0.00001:pi;

originalhorizontal =  a*b./sqrt( a^2.*sin(t).^2 + b^2.*cos(t).^2 ).*cos(t);
originalvertical = a*b./sqrt( a^2.*sin(t).^2 + b^2.*cos(t).^2 ).*sin(t);
%未经旋转的椭圆，但假设在原点，真实的应该是分别与x0和y0相加即
%originalhorizontal = x0 + a*b./sqrt( a^2.*sin(t).^2 + b^2.*cos(t).^2 ).*cos(t);
%originalvertical = y0 + a*b./sqrt( a^2.*sin(t).^2 + b^2.*cos(t).^2 ).*sin(t);

matr = [originalhorizontal; originalvertical];
result = V_sort *matr;%经过旋转的椭圆，但假设在原点
if color == 1
    hold on
    plot(result(1,:)+h,result(2,:)+k,'r-');
    scatter(x,y,80,'k+','LineWidth',2);
    xlabel('Age (Ma)');ylabel('Weight');
    hold off
    %经过旋转的椭圆，平移到x0，y0
else
    hold on
    plot(result(1,:)+h,result(2,:)+k,'b-.');
    scatter(x,y,80,'gx','LineWidth',2);
    xlabel('Age (Ma)');ylabel('Weight');
    hold off
end
end

