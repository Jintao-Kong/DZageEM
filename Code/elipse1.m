function elipse1(x,y,sigma,k,color)
%input first age or proportion, second age or proportion, and covariance

[V,D] = eig(sigma);
[D_sort,index] = sort(diag(D),'descend');

V_sort = V(:,index);


c = chi2inv(0.95,k).^0.5;
h = x;%��Э�������������ֵ��������������Ե�֪��Բ�ĳ����᷽�򼰳��ȣ�
%��Ҫע�⣬�ڲ�����������������תʱ���ȼ���ԭ��Բ��ԭ�㣬�ȱ��x0��y0
%����ת���ٷֱ���x0��y0���
k = y;
a = max(abs(c.*(D(1,1).^0.5)),abs(c.*(D(2,2).^0.5)));
b = min(abs(c.*(D(1,1).^0.5)),abs(c.*(D(2,2).^0.5)));

t = -pi:0.00001:pi;

originalhorizontal =  a*b./sqrt( a^2.*sin(t).^2 + b^2.*cos(t).^2 ).*cos(t);
originalvertical = a*b./sqrt( a^2.*sin(t).^2 + b^2.*cos(t).^2 ).*sin(t);
%δ����ת����Բ����������ԭ�㣬��ʵ��Ӧ���Ƿֱ���x0��y0��Ӽ�
%originalhorizontal = x0 + a*b./sqrt( a^2.*sin(t).^2 + b^2.*cos(t).^2 ).*cos(t);
%originalvertical = y0 + a*b./sqrt( a^2.*sin(t).^2 + b^2.*cos(t).^2 ).*sin(t);

matr = [originalhorizontal; originalvertical];
result = V_sort *matr;%������ת����Բ����������ԭ��
if color == 1
    hold on
    plot(result(1,:)+h,result(2,:)+k,'r-');
    scatter(x,y,80,'k+','LineWidth',2);
    xlabel('Age (Ma)');ylabel('Weight');
    hold off
    %������ת����Բ��ƽ�Ƶ�x0��y0
else
    hold on
    plot(result(1,:)+h,result(2,:)+k,'b-.');
    scatter(x,y,80,'gx','LineWidth',2);
    xlabel('Age (Ma)');ylabel('Weight');
    hold off
end
end

