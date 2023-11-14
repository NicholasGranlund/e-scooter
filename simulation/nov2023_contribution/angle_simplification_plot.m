close all
clear all
clc


delta_e = linspace(-100,100,10000);
a = 1;
b = 1.5;

beta = rad2deg( atan( (a/b) * tan( deg2rad(delta_e) ) ) );
beta_simplified = (a/b) * delta_e;

figure()

plot(delta_e, beta)
hold on;
grid on
plot(delta_e, beta_simplified)
xlabel('\delta_e'); ylabel('\beta')
legend('\beta = arctan(  a/b * tan(\delta_e)  )', '\beta = a/b * \delta_e')