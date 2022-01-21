im = imread('a.jpg');
[r, c] = size(im);

mirror_x = im;
for i=1:r
    for j=1:c
        mirror_x(r-i+1,j) = im(i,j);
    end
end

mirror_y = im;
for i=1:r
    for j=1:c
        mirror_y(i,c-j +1) = im(i,j);
    end
end

mirror_xy = im(end:-1:1,end:-1:1,:);  


subplot(1,4,1);
imshow(im);
title('original image');

subplot(1,4,2);
imshow(mirror_x);
title('mirror with x axis');

subplot(1,4,3);
imshow(mirror_y);
title('mirror with y axis');

subplot(1,4,4);
imshow(mirror_xy);
title('mirror with x = y axis');