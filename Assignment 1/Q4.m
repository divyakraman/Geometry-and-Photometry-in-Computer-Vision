%Rectify the images upto similarity by finding a transformed circle and 
%directly finding the circular points by intersecting it with the line at infinity.

%Images 1,2,3: Take circle passing through 3 corners of the square
%Image 1
%Im1 = imread('Images_Assign1/Image1.JPG');
%x1 = [2828,2668];
%x2 = [4012,2292];
%x3 = [3444,1452];
%center = (x1+x3)/2;
%radius = 777.8;

%l1 = line(2364,1716,2820,2660);
%l2 = line(3460,1436,4020,2276);
%l1 and l2 are parallel, intersect at x5
%x5 = cross(l1,l2);
%x5 = x5/x5(3); x5 = x5(1:2);
%l3 = line(2820,2660,4020,2276);%using x2 and x4
%l4 = line(2364,1716,3460,1436);%using x1 and x3
%l3 and l4 are parallel, intersect at x6
%x6 = cross(l3,l4);
%x6 = x6/x6(3); x6 = x6(1:2);

%linfi = line(x5(1),x5(2),x6(1),x6(2));
%linfi = linfi/linfi(3);
%linfi = [0,0.0002,1.0409];
%circle line intersection at: (3.13-7i,-5)*1000 and (3.13+7i,-5)*1000
%syms x
%solve((x*x)-(6272*x)+59073096==0,x);
%I = [(3.13-7i)*1000,-5000,1]';
%J = [(3.13+7i)*1000,-5000,1]';

%Image 2
%Im1 = imread('Images_Assign1/Image2.JPG');
%x1 = [1828,1844];
%x2 = [3124,2388];
%x3 = [4188,2156];
%center = (x1+x3)/2;
%radius = 1230;

%l1 = line(1828,1844,3124,2372);
%l2 = line(2796,1492,4196,2148);
%l1 and l2 are parallel, intersect at x5
%x5 = cross(l1,l2);
%x5 = x5/x5(3); x5 = x5(1:2);
%l3 = line(1828,1844,2796,1492);
%l4 = line(3140,2396,4196,2148);
%l3 and l4 are parallel, intersect at x6
%x6 = cross(l3,l4);
%x6 = x6/x6(3); x6 = x6(1:2);

%linfi = line(x5(1),x5(2),x6(1),x6(2));
%linfi = linfi/linfi(3);
%linfi = [0,-0.0002,1.0409];
%circle line intersection at: (3-2.73i,5)*1000 and (3+2.73i,5)*1000
%syms x
%solve(((x-3008)*(x-3008))+7487100==0,x)
%I = [(3-2.73i)*1000,5000,1]';
%J = [(3+2.73i)*1000,5000,1]';

%Image 3
Im1 = imread('Images_Assign1/Image1.JPG');
x1 = [2860,2532];
x2 = [3828,2204];
x3 = [3356,1404];
center = (x1+x3)/2;
radius = 722.66;

l1 = line(2860,2532,3828,2204);
l2 = line(2444,1628,3356,1404);
%l1 and l2 are parallel, intersect at x5
x5 = cross(l1,l2);
x5 = x5/x5(3); x5 = x5(1:2);
l3 = line(2860,2532,2444,1628);
l4 = line(3828,2204,3356,1404);
%l3 and l4 are parallel, intersect at x6
x6 = cross(l3,l4);
x6 = x6/x6(3); x6 = x6(1:2);

linfi = line(x5(1),x5(2),x6(1),x6(2));
linfi = linfi/linfi(3);
linfi = [0,0.0002,1.0409];
%circle line intersection at: (3.1-6.93i,-5)*1000 and (3.1+6.93i,-5)*1000
%syms x
%solve((x-3108)^2+(1968+5000)^2==(722.66*722.66),x);
I = [(3.1-6.93i)*1000,-5000,1]';
J = [(3.1+6.93i)*1000,-5000,1]';

%Image 4
%Im1 = imread('Images_Assign1/Image4.JPG');
%x1 = [1988,2420];
%x2 = [852,2652];
%x3 = [604,1948];
%center = (x1+x3)/2;
%radius = 820;

%l1 = line(1420,2820,2308,2388);
%l2 = line(2676,3900,3604,3300);
%l1 and l2 are parallel, intersect at x5
%x5 = cross(l1,l2);
%x5 = x5/x5(3); x5 = x5(1:2);
%l3 = line(1420,2820,2676,3900);
%l4 = line(2308,2388,3604,3300);
%l3 and l4 are parallel, intersect at x6
%x6 = cross(l3,l4);
%x6 = x6/x6(3); x6 = x6(1:2);

%linfi = line(x5(1),x5(2),x6(1),x6(2));
%linfi = linfi/linfi(3);
%linfi = [0,0.0003,1.0409];
%circle line intersection at: (1.3-2.69i,-5)*1000 and (1.3+2.69i,-5)*1000
%syms x
%solve(((x-1296)*(x-1296))+7257456==0,x)
%I = [(1.2960 - 5.4557i)*1000,3333,1]';
%J = [(1.2960 + 5.4557i)*1000,3333,1]';


%Image 5
%Im1 = imread('Images_Assign1/Image5.JPG');
%x1 = [4764,2756];
%x2 = [4716,2388];
%x3 = [5076,2148];%3 points to construct a circle
%center = [5070,2529];
%radius = 381;

%l1 = line(1988,1236,3988,638);
%l2 = line(2196,3500,3924,2228);
%l1 and l2 are parallel, intersect at x5
%x5 = cross(l1,l2);
%x5 = x5/x5(3); x5 = x5(1:2);
%l3 = line(1988,1236,2196,3500);
%l4 = line(3988,638,3924,2228);
%l3 and l4 are parallel, intersect at x6
%x6 = cross(l3,l4);
%x6 = x6/x6(3); x6 = x6(1:2);

%linfi = line(x5(1),x5(2),x6(1),x6(2));
%linfi = linfi/linfi(3);
%linfi = [-0.0001,0,1];
%circle line intersection at: (5.3924,5.3224)*1000 and (2.7291,2.2436)*1000
%syms x
%solve(((x-1296)*(x-1296))+7257456==0,x)
%I = [10000,2529-4915i,1]';
%J = [10000,2529+4915i,1]';

%Image 6
%Im1 = imread('Images_Assign1/image6.png');
%x1 = [295,495];
%x2 = [323,485];
%x3 = [326,436];
%center = (x1+x3)/2;
%radius = 49;

%l1 = line(361,37,594,167);
%l2 = line(332,599,579,482);
%l1 and l2 are parallel, intersect at x5
%x5 = cross(l1,l2);
%x5 = x5/x5(3); x5 = x5(1:2);
%l3 = line(361,37,332,599);
%l4 = line(594,167,579,482);
%l3 and l4 are parallel, intersect at x6
%x6 = cross(l3,l4);
%x6 = x6/x6(3); x6 = x6(1:2);

%linfi = line(x5(1),x5(2),x6(1),x6(2));
%linfi = linfi/linfi(3);
%linfi = [-0.0011,0,1];
%circle line intersection at: (3-2.73i,5)*1000 and (3+2.73i,5)*1000
%syms x
%solve(((x-3008)*(x-3008))+7487100==0,x)
%I = [909,465.50 - 696.78i,1]';
%J = [909,465.50 + 696.78i,1]';

C = (I*J'+J*I');%dual conic
[U D V] = svd(C);
H = U;
tform = projective2d(inv(H'));
Im1 = imresize(Im1,0.05);
Im2 = imwarp(Im1,tform);
figure
imshow(Im2)

[a,b] = linecirc((-linfi(2)/linfi(1)),(-linfi(3)/linfi(1)),center(1),center(2),radius);

function l = line(x1,y1,x2,y2)
l = [(y2-y1) (x1-x2) ((-x1*y2)+(y1*x2))];
end
