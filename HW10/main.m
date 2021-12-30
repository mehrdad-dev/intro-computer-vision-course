im = imread('a.jpg');

figure(1);

subplot(1,3,1);
imshow ( myfunc(im, 'R') );
title('change R channel');

subplot(1,3,2);
imshow ( myfunc(im, 'G') );
title('change G channel');

subplot(1,3,3);
imshow ( myfunc(im, 'B') );
title('change B channel');