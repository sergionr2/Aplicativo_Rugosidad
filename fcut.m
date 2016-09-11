%Esta funcion tiene como argumentos Kr, e, Re, f, ap, 
%u( numero de perfil, 1 si primer perfil ), dx (paso de muestreo)
% x0 punto inicial, xf punto final
function [ F_cut ] = fcut( Kr, E, re, f, ap, u, dx, x0, xf )
x = ( x0 :dx: xf );
F_cut = zeros( size(x) );

h = u*f;
r = re;

if Kr > 90
    kr = pi/2;
else
    kr = Kr * pi/180;
end
e = E * pi/180;
krp = pi - Kr * pi/180 - e;
v = ap - r; % desplazamiento en y

m1 = tan( kr );
theta1 = pi/2 - kr;
x_t1 = -1*r*cos( theta1 ); % Punto tangente 
y_t1 = r * sin( theta1 );
b1 = y_t1 - m1*x_t1 + v; 
y1 = m1*( x-h ) + b1;

m2 = -tan( krp );
theta2 = pi/2 - krp;
x_t2 = r*cos( theta2 ); % Punto tangente 
y_t2 = r * sin( theta2 );

b2 = y_t2 - m2*x_t2 + v;  
y2 = m2* ( x-h )  + b2;

c = sqrt( r^2 - ( x-h ).^2 ) + v;

cont = 1;
for i = x 
    if i < x_t1 + h
    F_cut( cont ) = y1( cont );
    end
    if i >= x_t1 + h
    F_cut( cont ) = c( cont );
    end
    if i > x_t2 + h
    F_cut( cont ) = y2( cont );
    end
    cont = cont + 1;
end

% title('F_{cut}')
% hold on
% grid on
% s = 2*r; 
% axis([ -f 3*f -s+v s+v]);
% plot( x,y1 )
% plot( x,c )
% plot( x,y2 )
% plot( x,F_cut, 'd' )
% legend('m1*x+b1','sqrt(r^2-(x-h)^2)+v','m2*x+b2', 'F_{cut}')

end

