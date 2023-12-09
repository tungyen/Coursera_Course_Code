close all; clc; clear;
load('Samples.mat', 'Samples');
Samples = im2double(Samples);
% Convert the color space to hsv
samples_HSV = rgb2hsv(Samples);
scatter3(samples_HSV(:,1),samples_HSV(:,2),samples_HSV(:,3),'.');

% Let's focus on the H value
mu = mean(samples_HSV(:,1));
sigma = var(samples_HSV(:,1));

save('estimate_G_parameters.mat', 'mu', 'sigma');