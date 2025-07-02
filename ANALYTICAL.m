clc; clear; close all;
syms theta1 theta2 D3 

d1=1.00; %in m
a1=0.80;
a2=0.60;

DH=@( a, alpha, d, theta)...
[ cos(theta), -sin(theta)*cos(alpha),  sin(theta)*sin(alpha), a*cos(theta);
  sin(theta),  cos(theta)*cos(alpha), -cos(theta)*sin(alpha), a*sin(theta);
           0,             sin(alpha),             cos(alpha),            d;
           0,                      0,                      0,           1]; 

A1=DH( a1, 0, d1, theta1)
A2=DH( a2, 0, 0, theta2)
A3=DH( 0, 0, -D3, 0)

T = simplify(A1 * A2 * A3)

theta1_val = deg2rad(0)
theta2_val = deg2rad(0)
D3_val = 0.25;

newT = vpa(subs(T, [theta1 theta2 D3], ...
                    [theta1_val theta2_val D3_val]), 4)

