% This is a simple module for perceptron test.
% If there has no 'created_data', please run 'datacreater.m' before.

close all
clear, clc
disp('Selecting gradient decending method: 1 for RGD, 2 for BGD')
gdmethod = input('Please typing the number:');
iterations = input('typing the number of iterations:');

run datadrawer
load created_data
orig_labeled_data = zeros(1000, 4);
orig_labeled_data(1:500, :) = [data1,ones(500,1),ones(500,1)];
orig_labeled_data(501:1000, :) = [data2,ones(500,1),-ones(500,1)];
cvp = cvpartition(1000,'HoldOut', 0.2);
labeled_train_data = orig_labeled_data(cvp.training, :);
labeled_test_data = orig_labeled_data(cvp.test, :);

a = rand([3,1]);
lr = 0.1;   % learning rate

Y = labeled_train_data(:,1:3);
f = labeled_train_data(:,4);
cnt = 0;

if gdmethod==1
    %% This part for random gradient decending test.
    disp('running the RGD method...')
    while(1)
        f_res = sign(Y*a);
        M_mask = boolean(-f_res.*f+1);
        M_num = sum(M_mask);
        if((M_num == 0) || (cnt>=iterations))
            break
        end
        M_idx = find(M_mask==1);
        M_idx_rand = M_idx(ceil(rand*M_num));
        a_old = a;
        gd = Y(M_idx_rand,:)'*f(M_idx_rand);
        a = a_old+lr*gd;
        cnt = cnt+1;
        sp = sprintf('%d iterations, %d misclassification', cnt, M_num);
        disp(sp)
        fh = @(x,y) a(1)*x + a(2)*y + a(3);
        pause(0.3)
        ezplot(fh)
    end
else
    %% This part for batch gradient decending test.
    disp('running the BGD method...')
    while(1)
        f_res = sign(Y*a);
        M_mask = boolean(-f_res.*f+1);
        M_num = sum(M_mask);
        M_idx = find(M_mask==1);
        if((M_num == 0) || (cnt>=iterations))
            break
        end
        a_old = a;
        gd = Y(M_mask,:)'*f(M_mask)/M_num;
        a = a_old + lr*gd;
        cnt = cnt+1;
        sp = sprintf('%d iterations, %d error classification', cnt, M_num);
        disp(sp)
        fh = @(x,y) a(1)*x + a(2)*y + a(3);
        pause(0.3)
        ezplot(fh)
    end
end
sp = sprintf('%d iterations, convergence', cnt+1);
disp(sp)
fh = @(x,y) a(1)*x + a(2)*y + a(3);
plt = ezplot(fh);
plt.LineColor = 'r';
plt.LineWidth = 2;