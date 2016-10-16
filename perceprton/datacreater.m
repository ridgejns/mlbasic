clear, clc
mu1=[4,1]';
mu2=[3,4]';
% mu2=[2,5]';
sigma1 = [1.3, 1; 1, 1.7];
sigma2 = [1.3, 1; 1, 1.7];

data1 = mvnrnd(mu1,sigma1,500);
data2 = mvnrnd(mu2,sigma2,500);

mu1 = mean(data1);
mu2 = mean(data2);
sigma1 = cov(data1);
sigma2 = cov(data2);

save('created_data.mat', 'data1', 'data2', 'mu1', 'mu2', 'sigma1', 'sigma2')
