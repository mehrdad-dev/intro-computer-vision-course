image = imread('Lenna.png');

h = [ 0  -1  0 
     -1   5  -1
      0  -1   0 ];
filtered = imfilter(image, h);
figure(1);
imshowpair(image, filtered, 'montage');
