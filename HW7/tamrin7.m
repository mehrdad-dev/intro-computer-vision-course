image = imread('men.jpg');
new = reduceBlueColor(image, 50);
imshowpair(image, new,'montage');