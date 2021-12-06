clc;
clear all;
close all;
figure(1);
% R = 1,  G = 2 ,  B = 3

% RGB =  1,2,3
RGB=imread('men2.jpg');
subplot(3,2,1);
imshow(RGB);
title("RGB");

% RBG =  1,3,2
RBG(:,:,1) = RGB(:,:,1);
RBG(:,:,2) = RGB(:,:,3);
RBG(:,:,3) = RGB(:,:,2);
subplot(3,2,2);
imshow(RBG);
title("RBG");

% BGR =  3,2,1
BGR(:,:,1) = RGB(:,:,3);
BGR(:,:,2) = RGB(:,:,2);
BGR(:,:,3) = RGB(:,:,1);
subplot(3,2,3);
imshow(BGR);
title("BGR");

% BRG =  3,1,2
BRG(:,:,1) = RGB(:,:,3);
BRG(:,:,2) = RGB(:,:,1);
BRG(:,:,3) = RGB(:,:,2);
subplot(3,2,4);
imshow(BRG);
title("BRG");

% GRB =  2,1,3
GRB(:,:,1) = RGB(:,:,2);
GRB(:,:,2) = RGB(:,:,1);
GRB(:,:,3) = RGB(:,:,3);
subplot(3,2,5);
imshow(GRB);
title("GRB");

% GBR =  2,3,1
GBR(:,:,1) = RGB(:,:,2);
GBR(:,:,2) = RGB(:,:,3);
GBR(:,:,3) = RGB(:,:,1);
subplot(3,2,6);
imshow(GBR);
title("GBR");
