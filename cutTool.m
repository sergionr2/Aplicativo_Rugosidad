close all
clear all

kr = 30;
e = 40;
r = 0.2;
ap = 0.25;
f = 0.5;

dx = f/100;

K = 50

y = fcut( K, e, r, 0, ap, 0, dx, -3*f, 3*f );
x = (-3*f:dx:3*f);

s = 2*f;
center = ap - s/3;
figure
plot( x,y )

A = [x;y];
O = [ ones( size(x) )*0; ones( size(y) )*(ap-r) ]; %origin

angle = (kr-K) * pi/180;
rot = [ cos(angle) -1*sin(angle); sin(angle) cos(angle) ];
X = rot*( A - O ) + O;

hold on
plot( X(1,:), X(2,:) )
axis([-f 3*f -s+center s+center]);
grid on 
title('Tool')
legend('Tool', 'Rotated Tool' )
