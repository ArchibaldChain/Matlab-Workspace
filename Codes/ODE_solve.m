
syms 
M=70;H=1.75;alpha=8*pi/9;Ig=14;d1=0.017;d2=0.031;
theta = pi-(alpha/2)*t^2;
%f = @(d, y)((0.186*H)^2-(d-y)^2)*((d+y)^2-(0.186*H)^2);
% y1 = solve(f(d1,y1)/f(d2,y2)-(d1^2)/(d2^2), y1);
y1 = -(d2*((-8649*H^2*d1 + 8649*H^2*d2 + 250000*d1^2*d2 - 250000*d1*d2^2 + 250000*d1*y2^2)/d2^3)^(1/2))/500;
F1 = (5117500*((3481*diff(y1,t)^2)/2500 - (137837*diff(y1,t))/125000 + 133240849/25000000)^(1/2))/6111 - (6038650*diff(y1,t))/6111 + 2047/18;
F2 = (882500*((3481*diff(y2,t)^2)/2500 - (137837*diff(y2,t))/125000 + 133240849/25000000)^(1/2))/2037 - (1041350*diff(y2,t))/2037 + 353/6;

eqn = 0.00636*M*H +...
          F1 * (0.186)*H*d1/y1-...
          F2 * (0.186)*H*d2/y2 == - (Ig+2.24e-4*M*H^2)*alpha/sin(theta);

dsolve('0 =ode(t, y)'.'t' );



M=70;H=1.75;alpha=8*pi/9;Ig=14;d1=0.017;d2=0.031;
theta = pi-(alpha/2)*t^2;
y1 = -(d2*((-8649*H^2*d1 + 8649*H^2*d2 + 250000*d1^2*d2 - 250000*d1*d2^2 + 250000*d1*y2^2)/d2^3)^(1/2))/500;
F1 = (5117500*((3481*(dy1/dt)^2)/2500 - (137837*(dy1/dt))/125000 + 133240849/25000000)^(1/2))/6111 - (6038650*(dy1/dt))/6111 + 2047/18;
F2 = (882500*((3481*(dy2/dt)^2)/2500 - (137837*(dy2/dt))/125000 + 133240849/25000000)^(1/2))/2037 - (1041350*dy2/dt))/2037 + 353/6;
0.00636*M*H +F1 * (0.186)*H*d1/y1- F2 * (0.186)*H*d2/y2 == -(Ig+2.24e-4*M*H^2)*alpha/sin(theta);

%f(d,y) =((0.186*H)^2-(d-y)^2)*((d+y)^2-(0.186*H)^2);
% y1 = solve(f(d1,y1)/f(d2,y2)-(d1^2)/(d2^2), y1);