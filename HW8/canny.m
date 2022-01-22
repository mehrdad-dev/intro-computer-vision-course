RGB_im = imread('b.jpg');
im = im2double (rgb2gray(RGB_im ));

blur_im = imgaussfilt(im, 1);   % apply gaussian filter

sobel_y_oprator = [1,  2,  1;
                   0,  0,  0;
                  -1, -2, -1];
      
sobel_x_oprator = [-1,  0,  1;
                   -2,  0,  2;
                   -1,  0,  1];
       
pad = padarray(blur_im, [1 1],'replicate');      % apply pading

tmp = conv2(pad, (sobel_y_oprator), 'same');     % apply Convolution 2D
gradiant_y = tmp(2:end-1,2:end-1);               % remove pading    

tmp = conv2(pad, (sobel_x_oprator), 'same');     % apply Convolution 2D
gradiant_x = tmp(2:end-1,2:end-1);               % remove pading    

gradiant_mag = abs(gradiant_x) + abs(gradiant_y);
gradiant_dir = atan2(gradiant_y, gradiant_x);

tlow = 30;
thigh = 70;

[gm_row, gm_col] = size(gradiant_mag);
G_R = (gradiant_mag * 100);
for r = 1:gm_row
    for c = 1:gm_col
        if G_R(r,c) > thigh
            G_R(r,c) = 255;
        elseif G_R(r,c) < thigh   &&   G_R(r,c) > tlow
             G_R(r,c) = 127;
        else
             G_R(r,c) = 0;
        end
    end
end    


figure(1);
subplot(2,4,1);
imshow(im);
title('original image');

subplot(2,4,2);
imshow(blur_im);
title('blur image');

subplot(2,4,3);
imshow(gradiant_y);
title('soble in y diraction');

subplot(2,4,4);
imshow(gradiant_x);
title('soble in x diraction');

subplot(2,4,4);
imshow(gradiant_x);
title('soble in x diraction');

subplot(2,4,5);
imshow(gradiant_mag);
title('gradiant magnitude');

subplot(2,4,6);
imshow(gradiant_dir);
title('gradiant diraction');

subplot(2,4,7);
imshow(G_R);
title('edge');


