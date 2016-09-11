close all
clear all

kr = 68;
e = 40;
r = 0.2;
f = 0.5;
ap = 0.25;

dx = f/100;

a0 = fcut( kr, e, r, f, ap, 0, dx, 0, 3*f );
a1 = fcut( kr, e, r, f, ap, 1, dx, 0, 3*f );
a2 = fcut( kr, e, r, f, ap, 2, dx, 0, 3*f );
a3 = fcut( kr, e, r, f, ap, 3, dx, 0, 3*f );

A = max( a0, a1 );
A = max( A, a2 );
A = max( A, a3 );
A = max( A, 0 );

figure
s = 2*f;
center = ap - s/3;
x = ( 0 :dx: 3*f );
plot( x,A )
axis([-f 3*f -s+center s+center]);
grid on 
title('F_{profile}')
legend('F_{profile}')
%%
R = ap - A;

figure
s = 3*f/2;
center = ap - s/3;
area( x,R )
axis([0 3*f 0 s+center]), 'a';
grid on 
title('Rugosidad')
legend('a_p - F_{profile}')
