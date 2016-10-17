clear, clc
load created_data

wF = (sigma1+sigma2)\(mu1-mu2); % equal wF = inv(sigma1+sigma2)*(mu1-mu2);
wU = wF/norm(wF);
xx = -6:0.1:6;
yy = xx*wF(2)/wF(1);
plot(xx,yy,'r', 'LineWidth', 2);

invC = inv(sigma1);
w = 2*invC*(mu2-mu1);
b = mu1'*invC*mu1-mu2'*invC*mu2;
y = (-b - w(1)*xx)/w(2);
plot(xx,y,'c', 'LineWidth', 2);