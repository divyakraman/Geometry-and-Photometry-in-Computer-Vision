%Rectify the image upto similarity in two stages by ?rst computing the line at in?nity 
%by connecting two points at in?nity and then computing dual conic to the circular points 
%using two perpendicular directions/lines.



%Line at infinity:

%Image1
%Im1 = imread('Images_Assign1/Image1.JPG');
%x1 = [2364,1716];x2 = [2820,2660];
%coefficients = polyfit(x1, x2, 1);
%a = coefficients (1);
%b = coefficients (2);
%l1 = line(2364,1716,2820,2660);
%x3 = [3460,1436];x4 = [4020,2276];
%l2 = line(3460,1436,4020,2276);
%l1 and l2 are parallel, intersect at x5
%x5 = cross(l1,l2);
%x5 = x5/x5(3); x5 = x5(1:2);
%l3 = line(2820,2660,4020,2276);%using x2 and x4
%l4 = line(2364,1716,3460,1436);%using x1 and x3
%l3 and l4 are parallel, intersect at x6
%x6 = cross(l3,l4);
%x6 = x6/x6(3); x6 = x6(1:2);

%Image 2
%Im1 = imread('Images_Assign1/Image2.JPG');
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

%Image 3
%Im1 = imread('Images_Assign1/Image3.JPG');
%l1 = line(2860,2532,3828,2204);
%l2 = line(2444,1628,3356,1404);
%l1 and l2 are parallel, intersect at x5
%x5 = cross(l1,l2);
%x5 = x5/x5(3); x5 = x5(1:2);
%l3 = line(2860,2532,2444,1628);
%l4 = line(3828,2204,3356,1404);
%l3 and l4 are parallel, intersect at x6
%x6 = cross(l3,l4);
%x6 = x6/x6(3); x6 = x6(1:2);

%Image 4
%Im1 = imread('Images_Assign1/Image4.JPG');
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

%Image 5
%Im1 = imread('Images_Assign1/Image5.JPG');
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

%Image 6
Im1 = imread('Images_Assign1/image6.png');
l1 = line(361,37,594,167);
l2 = line(332,599,579,482);
%l1 and l2 are parallel, intersect at x5
x5 = cross(l1,l2);
x5 = x5/x5(3); x5 = x5(1:2);
l3 = line(361,37,332,599);
l4 = line(594,167,579,482);
%l3 and l4 are parallel, intersect at x6
x6 = cross(l3,l4);
x6 = x6/x6(3); x6 = x6(1:2);

linfi = line(x5(1),x5(2),x6(1),x6(2));
linfi = linfi/linfi(3);
Hp = [1 0 0;0 1 0;linfi];
tform = projective2d(Hp');
Im1 = imresize(Im1,0.05);
Im2 = imwarp(Im1,tform);
figure
imshow(Im2)
%Dual conic

%Image 1
%l5 = line(1758,858,1849,1346);
%l6 = line(1849,1346,2892,1207);%l5 and l6 are perpendicular
%l7 = line(1758,858,739,1002);%l5 and l7 are perpendicular

%Image 2,3,4,5,6
l5 = inv(Hp')*l1';
l6 = inv(Hp')*l2';
l7 = inv(Hp')*l3';
l8 = inv(Hp')*l4';
%l5 and l7 are perpendicular, l6 and l8 are perpendicular

A = [l8(1)*l6(1) (l8(1)*l6(2)+l8(2)*l6(1)) l8(2)*l6(2)
    l5(1)*l7(1) (l5(1)*l7(2)+l5(2)*l7(1)) l5(2)*l7(2)];
h = null(A);
S = [h(1) h(2);h(2) h(3)];
C = [S [0;0];0 0 0];
[U D V] = svd(C);
h = U;
tform = projective2d(inv(h'));
J = imwarp(Im2,tform);
figure
imshow(J)

function l = line(x1,y1,x2,y2)
l = [(y2-y1) (x1-x2) ((-x1*y2)+(y1*x2))];
end