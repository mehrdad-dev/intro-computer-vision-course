clc;
clear all;
close all;

im=imread('Lenna.png');

figure(1);

for sigma = 1:6
    img = imgaussfilt(im,sigma);
    finimg = im - img;
    subplot(2,3,sigma);
    imshow(finimg);
    title("sigma="+sigma);
end