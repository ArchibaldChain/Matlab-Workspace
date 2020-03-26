%This code solves SIS model 
[t, x]= ode45(@SIS,[0,10],[40,10]);
plot (t,x);
grid on
xlabel ('time') 
title('SIS Model with ${R}_{0}\ge 1 $',...
'FontAngle', 'italic', 'Interpreter', ... 
'Latex') 
ylabel('population') 
legend('susceptible', 'Infected') ; 
function Si=SIS(t,x)
    beta =4 ; 
    N=50;
    gamma=0.9;%Recovery rate
    Si(1,:) = -(beta/N) * x(1) *x(2) + gamma *x(2);
    Si(2,:) = (beta/N)* x(1) *x(2) - gamma *x(2);
end
