close all
clear all
clc

% Parameters
v = 2;
D = 1.86;
m = 14.3;
h = 0.23;
J = 0.0178;
g = 9.81;
b = 0.88;
lambda = deg2rad(78.7);
c = 0.012;
a = 0.4401;

% Simplified Plant
s = tf('s');
P = (v*(D*s + m*v*h)) / (b * (J*s*s - m*g*h));

% Complete plant
P_num = ((D*v*sin(lambda)*s)/b) + (m*v*v*h - a*c*g*m)*(sin(lambda)/b);
P_den = (J*s*s - m*g*h);
P_complete = P_num / P_den;

% Controller
Kp = 2.1582;
Ki = 0;
Kd = 0;

s = tf('s');
C = Kp + Ki/s + Kd*s;

% Closed loop system
T = (C*P) / (1 + (C*P))
T = feedback(C*P, 1)
%T_complete = (C*P_complete) / (1 + C*P_complete)
t = 0:0.01:2;
step(T,t)
grid on
%step(T_complete, t)

% Plot poles and zeros
figure()
pzmap(T)
poles = pole(T)
zeros = zero(T)

(b*g) / (v*v)


