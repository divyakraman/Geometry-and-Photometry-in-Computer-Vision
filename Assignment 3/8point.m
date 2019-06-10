%RANSAC for 8 point algorithm

I1 = rgb2gray(imread('Images/DSC_0767.JPG'));
I2 = rgb2gray(imread('Images/DSC_0768.JPG'));
points1 = detectSURFFeatures(I1);
points2 = detectSURFFeatures(I2);
[f1,vpts1] = extractFeatures(I1,points1);
[f2,vpts2] = extractFeatures(I2,points2);
indexPairs = matchFeatures(f1,f2) ;
matchedPoints1 = vpts1(indexPairs(:,1));
matchedPoints2 = vpts2(indexPairs(:,2));
%figure; showMatchedFeatures(I1,I2,matchedPoints1,matchedPoints2);

l = length(indexPairs);
Niter = 100;
storeinlier_number = 0;
Fstore = ones(3,3);
inlier = 0;
F = ones(3,3);
rng('shuffle');
r = ones(1,8);
iter = 0;
while iter<Niter

    r = randi([1,l],1,8);
%while length(r) ~= length(unique(r))
if length(r) ~= length(unique(r))
    continue
end

%end

x1 = [matchedPoints1(r(1)).Location,1];
x2 = [matchedPoints1(r(2)).Location,1];
x3 = [matchedPoints1(r(3)).Location,1];
x4 = [matchedPoints1(r(4)).Location,1];
x5 = [matchedPoints1(r(5)).Location,1];
x6 = [matchedPoints1(r(6)).Location,1];
x7 = [matchedPoints1(r(7)).Location,1];
x8 = [matchedPoints1(r(8)).Location,1];
x1n = [matchedPoints2(r(1)).Location,1];
x2n = [matchedPoints2(r(2)).Location,1];
x3n = [matchedPoints2(r(3)).Location,1];
x4n = [matchedPoints2(r(4)).Location,1];
x5n = [matchedPoints2(r(5)).Location,1];
x6n = [matchedPoints2(r(6)).Location,1];
x7n = [matchedPoints2(r(7)).Location,1];
x8n = [matchedPoints2(r(8)).Location,1];
F = findFundamentalMatrix(x1,x2,x3,x4,x5,x6,x7,x8,x1n,x2n,x3n,x4n,x5n,x6n,x7n,x8n);
inlier = findInlierCount(F,matchedPoints1,matchedPoints2);
if inlier>storeinlier_number
    Fstore = F;
    storeinlier_number = inlier;
end
eps = 1 - storeinlier_number/l;
Niter = log(1-0.99)/log(1-power(1-eps,8))
iter = iter+1;
end

function F = findFundamentalMatrix(x1,x2,x3,x4,x5,x6,x7,x8,x1n,x2n,x3n,x4n,x5n,x6n,x7n,x8n)
%Finding T
center = (x1+x2+x3+x4+x5+x6+x7+x8)/8;
maxi = [0,0];mini = [0,0];
maxi(1) = max([x1(1),x2(1),x3(1),x4(1),x5(1),x6(1),x7(1),x8(1)]);
maxi(2) = max([x1(2),x2(2),x3(2),x4(2),x5(2),x6(2),x7(2),x8(2)]);
mini(1) = min([x1(1),x2(1),x3(1),x4(1),x5(1),x6(1),x7(1),x8(1)]);
mini(2) = min([x1(2),x2(2),x3(2),x4(2),x5(2),x6(2),x7(2),x8(2)]);
scale = (maxi-mini);
T = [1/scale(1),0,(-center(1)/scale(1));0,1/scale(2),(-center(2)/scale(2));0,0,1];
x1 = T*x1'; x2 = T*x2'; x3 = T*x3'; x4 = T*x4'; x5 = T*x5'; x6 = T*x6'; x7 = T*x7'; x8 = T*x8';

%Finding Tn
center = (x1n+x2n+x3n+x4n+x5n+x6n+x7n+x8n)/8;
maxi = [0,0];mini = [0,0];
maxi(1) = max([x1n(1),x2n(1),x3n(1),x4n(1),x5n(1),x6n(1),x7n(1),x8n(1)]);
maxi(2) = max([x1n(2),x2n(2),x3n(2),x4n(2),x5n(2),x6n(2),x7n(2),x8n(2)]);
mini(1) = min([x1n(1),x2n(1),x3n(1),x4n(1),x5n(1),x6n(1),x7n(1),x8n(1)]);
mini(2) = min([x1n(2),x2n(2),x3n(2),x4n(2),x5n(2),x6n(2),x7n(2),x8n(2)]);
scale = (maxi-mini);
Tn = [1/scale(1),0,(-center(1)/scale(1));0,1/scale(2),(-center(2)/scale(2));0,0,1];
x1n = T*x1n'; x2n = T*x2n'; x3n = T*x3n'; x4n = T*x4n'; x5n = T*x5n'; x6n = T*x6n'; x7n = T*x7n'; x8n = T*x8n';

A = [x1n(1)*x1(1),x1n(1)*x1(2),x1n(1),x1n(2)*x1(1),x1n(2)*x1(2),x1n(2),x1(1),x1(2),1;
    x2n(1)*x2(1),x2n(1)*x2(2),x2n(1),x2n(2)*x2(1),x2n(2)*x2(2),x2n(2),x2(1),x2(2),1;
    x3n(1)*x3(1),x3n(1)*x3(2),x3n(1),x3n(2)*x3(1),x3n(2)*x3(2),x3n(2),x3(1),x3(2),1;
    x4n(1)*x4(1),x4n(1)*x4(2),x4n(1),x4n(2)*x4(1),x4n(2)*x4(2),x4n(2),x4(1),x4(2),1;
    x5n(1)*x5(1),x5n(1)*x5(2),x5n(1),x5n(2)*x5(1),x5n(2)*x5(2),x5n(2),x5(1),x5(2),1;
    x6n(1)*x6(1),x6n(1)*x6(2),x6n(1),x6n(2)*x6(1),x6n(2)*x6(2),x6n(2),x6(1),x6(2),1;
    x7n(1)*x7(1),x7n(1)*x7(2),x7n(1),x7n(2)*x7(1),x7n(2)*x7(2),x7n(2),x7(1),x7(2),1;
    x8n(1)*x8(1),x8n(1)*x8(2),x8n(1),x8n(2)*x8(1),x8n(2)*x8(2),x8n(2),x8(1),x8(2),1];

f = null(A);
F = reshape(f,3,3);
F = F';
[U S V] = svd(F);
F = U*[S(1,1) 0 0;0 S(2,2) 0;0 0 S(3,3)]*V';
F = Tn'*F*T;

end

function inlier = findInlierCount(F,matchedPoints1,matchedPoints2)
a = matchedPoints1.Location;
b = matchedPoints2.Location;
l = length(matchedPoints1);
c = ones(l,1);
a = [a c]; b = [b c];
err = zeros(l,1);
for j=1:l
err(j) = b(j,:)*F*a(j,:)';
end
err = err.*err;
d = abs(err)<0.01;
inlier = sum(d);
end