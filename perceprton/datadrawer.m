% This is a simple module to draw the data.
% If there has no 'created_data', please run 'datacreater.m' before.

load created_data
xgv = linspace(-2,8,101);
ygv = linspace(-2,8,101);
[x, y] = meshgrid(xgv, ygv);
pdf1 = zeros(101);
pdf2 = zeros(101);

for i = 1:101
    for j = 1:101
        pdf1(i,j) = mvnpdf([x(i,j),y(i,j)],mu1,sigma1);
        pdf2(i,j) = mvnpdf([x(i,j),y(i,j)],mu2,sigma2);
    end
end

figure(), hold on
plot(data1(1:5:500,1), data1(1:5:500,2), 'x')
plot(data2(1:5:500,1),data2(1:5:500,2),'o')
% contour(x,y,pdf1,5)
% contour(x,y,pdf2,5)

orig_labeled_data = zeros(1000, 4);
orig_labeled_data(1:500, :) = [data1,ones(500,1),ones(500,1)];
orig_labeled_data(501:1000, :) = [data2,ones(500,1),-ones(500,1)];



% figure(), hold on
% mesh(x,y,pdf1)
% mesh(x,y,pdf2)