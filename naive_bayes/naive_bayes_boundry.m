% This is a simple draw the boundary of naive bayes classification

load created_data
data1_N = length(data1);
data2_N = length(data2);
data_N = data1_N+data2_N;
% orig_labeled_data = zeros(data_N, 4);
% orig_labeled_data(1:data1_N, :) = [data1,ones(data1_N,1),ones(data1_N,1)];
% orig_labeled_data(data1_N+1:data_N, :) = [data2,ones(data2_N,1),-ones(data2_N,1)];
% cvp = cvpartition(data_N,'HoldOut', 0.2);
% labeled_training_data = orig_labeled_data(cvp.training, :);
% labeled_test_data = orig_labeled_data(cvp.test, :);

P1 = data1_N/data_N;
P2 = data2_N/data_N;

A = inv(sigma1)-inv(sigma2);
B = 2*(sigma2\mu2- sigma1\mu1); 
% B = 2*(inv(sigma2)*mu2-inv(sigma1)*mu1);
C = mu1'/sigma1*mu1-mu2'/sigma2*mu2+log(P2*det(inv(sigma1))/(P1*det(inv(sigma2)))); 
% C = mu1'*inv(sigma1)*mu1-mu2'*inv(sigma2)*mu2;

warning('off', 'last');
figure(), hold on
plt1 = plot(data1(:,1),data1(:,2), 'co');
plt2 = plot(data2(:,1),data2(:,2), 'bx');
bound = ezplot(@(x, y) [x, y]*A*[x; y]+[x, y]*B+C);
set(bound, {'LineColor', 'LineWidth'}, {'r', 2});
legend('positive', 'negative', 'boundary')

text(-3.5,6,'sigma1: ')
text(-2.5,6,num2str(sigma1))
text(-3.5,5,'sigma2: ')
text(-2.5,5,num2str(sigma2))

xlim([-4,8])
ylim([-4,8])