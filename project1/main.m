first  = im2double( rgb2gray( imread('kafka.jpg') ) );
low_pass = imgaussfilt(first, 10);

second = im2double( rgb2gray( imread('niche.jpg') ) );
g = imgaussfilt(second, 20);
hight_pass = second - g;

final = hight_pass + low_pass;   % create hybrid
imshow(final);

% save it
% imwrite(final, 'hybrid-result.jpg')
