close all
clear all
clc

% E-scooter values
b = 0.88;
lambda = deg2rad(78.7);
x_fork = 0.82;
y_fork = 0.42;

% Steering bar
m_bar = 0.9;
l_bar = 0.7;
x_bar = x_fork - 0.35*cos(lambda);
y_bar = y_fork + 0.35*sin(lambda);

% Steering handle
m_handle = 0.7;
l_handle = 0.43;
x_handle = x_fork - 0.7*cos(lambda);
y_handle = y_fork + 0.7*sin(lambda);

% Control box
m_box = 3.7;
x_box = 0.42;
y_box = 0.23;

% Scooter base
m_base = 12.5;
x_base = 0.41;
y_base = 0.15;

% Front wheel
m_frontwheel = 3.06;
x_frontwheel = 0.88;
y_frontwheel = 0.00;

% Beckwheel
m_backwheel = 3.06;
x_backwheel = 0.00;
y_backwheel = 0.00;


sum = (m_bar         .*[x_bar, y_bar] +...
       m_handle      .*[x_handle, y_handle] +...
       m_box         .*[x_box, y_box] +...
       m_base        .*[x_base, y_base] +...
       m_frontwheel  .*[x_frontwheel, y_frontwheel] +...
       m_backwheel   .*[x_backwheel, y_backwheel]); 

m_tot = (m_bar + m_handle + m_box + m_base + m_frontwheel + m_backwheel)

CoM = sum ./ m_tot


