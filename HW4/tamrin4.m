clc;
clear all;
close all;

im = imread('pout.tif');
im = im2double(im);
im_log = log(im);

figure(1);
subplot(1,2,1);
imshow(im);
title('orginal image');

subplot(1,2,2);
imshow(im_log,[]);
title('apply log transformation on image');