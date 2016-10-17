close all
clear, clc

% This is a simple moudle for data create.
clear, clc
mu1=[0,2]';
mu2=[1.7,2.5]';
sigma1 = [2, 0.5; 0.5, 2];
sigma2 = [2, 1; 1, 2];

data1 = mvnrnd(mu1,sigma1,200);
data2 = mvnrnd(mu2,sigma2,200);

mu1 = mean(data1)';
mu2 = mean(data2)';
sigma1 = cov(data1);
sigma2 = cov(data2);

save('created_data.mat', 'data1', 'data2', 'mu1', 'mu2', 'sigma1', 'sigma2')
