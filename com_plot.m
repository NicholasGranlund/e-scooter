close all;
clear all;
clc;
l = 50;
m_add = 25;
x_add = linspace(0.1079, 0.68, l);
y_add = linspace(0.17, 1.1065, l);
com = zeros(2, length(x_add)*length(y_add));

for i=1:length(x_add)
    for j=1:length(y_add)
         [x_com, y_com] = get_com(m_add, x_add(i), y_add(j));
         com(1,j + l*(i-1)) = x_com;
         com(2,j + l*(i-1)) = y_com;
    end
end

figure()
hold on
% scatter(x_add, y_add, 'x')
scatter(com(1,:), com(2,:))
xlim([0, 0.68])
ylim([0, 1.1068])
axis tight; 
hold on
I = imread('bg.png'); 
h = imagesc(xlim([0, 0.68]),flip(ylim([0, 1.1068])),I); 
uistack(h,'bottom')
