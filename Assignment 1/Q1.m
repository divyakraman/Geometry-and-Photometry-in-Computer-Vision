%Compute the transformation matrix directly and rectify the given image using four points and 
%some transformed corrected co-ordinates for these points.

%Image1
%I = imread('Images_Assign1/Image1.JPG');
%p1 = [2364,1724];
%p2 = [3452,1444];
%p3 = [4012,2284];
%p4 = [2820,2668];
%p1n = [0,1100];
%p2n = [1100,1100];
%p3n = [1100,0];
%p4n = [0,0];

%Image2
%I = imread('Images_Assign1/Image2.JPG');
%p1 = [1828,1844];
%p2 = [204,1220];
%p3 = [1004,692];
%p4 = [2764,1476];
%p1n = [0,0];
%p2n = [0,1740];
%p3n = [1740,1740];
%p4n = [1740,0];

%Image3
I = imread('Images_Assign1/Image3.JPG');
p1 = [2860,2532];
p2 = [3828,2204];
p3 = [3356,1404];
p4 = [2444,1628];
p1n = [0,0];
p2n = [1022,0];
p3n = [1022,1022];
p4n = [0,1022];

%Image 4
%I = imread('Images_Assign1/Image4.JPG');
%p4 = [2700,3884];
%p1 = [1428,2812];
%p2 = [2340,2356];
%p3 = [3628,3292];
%p1n = [0,1592];
%p2n = [1592,1020];
%p3n = [1020,0];
%p4n = [0,0];

%Image 5
%I = imread('Images_Assign1/Image5.JPG');
%p1 = [2196,3484];
%p2 = [1996,1212];
%p3 = [3972,636];
%p4 = [3948,2204];
%p1n = [0,0];
%p2n = [0,1924];
%p3n = [2114,1924];
%p4n = [2114,0];

%Image 6
%I = imread('Images_Assign1/image6.png');
%p1 = [337,590];
%p2 = [364,43];
%p3 = [593,163];
%p4 = [579,479];
%p1n = [0,0];
%p2n = [0,432];
%p3n = [492,432];
%p4n = [492,0];


A = [p1(1) p1(2) 1 0 0 0 -(p1n(1)*p1(1)) -(p1(2)*p1n(1)) -p1n(1);
    0 0 0 -p1(1) -p1(2) -1 (p1n(2)*p1(1)) (p1(2)*p1n(2)) p1n(2);
    p2(1) p2(2) 1 0 0 0 -(p2n(1)*p2(1)) -(p2(2)*p2n(1)) -p2n(1);
    0 0 0 -p2(1) -p2(2) -1 (p2n(2)*p2(1)) (p2(2)*p2n(2)) p2n(2);
    p3(1) p3(2) 1 0 0 0 -(p3n(1)*p3(1)) -(p3(2)*p3n(1)) -p3n(1);
    0 0 0 -p3(1) -p3(2) -1 (p3n(2)*p3(1)) (p3(2)*p3n(2)) p3n(2);
    p4(1) p4(2) 1 0 0 0 -(p4n(1)*p4(1)) -(p4(2)*p4n(1)) -p4n(1);
    0 0 0 -p4(1) -p4(2) -1 (p4n(2)*p4(1)) (p4(2)*p4n(2)) p4n(2)];
[U D V] = svd(A);
h = V(:,9);
h = vec2mat(h,3);
h = h/h(3,3);%scaling factor
tform = projective2d(h');
%I = imresize(I,0.05);
J = imwarp(I,tform);
figure
imshow(J)