L1 = 0.6;   % thickness of layerI, mm
L2 = 6;     % thickness of layerII, mm
L3 = 3.6;   % thickness of layerIII, mm
L4 = 5;     % thickness of layerIV, mm
L5 = 100;  %

alpha1 = 0.19849915;    %thermal para of layerI
% alpha2 = 0.02043973;     %thermal para of layerII
% alpha3 = 0.035137254;   %thermal para of layerIII
% alpha4 = 2.361075976;    %thermal para of layerIV
% alpha5 = 0.1371337;
alpha2 = alpha1;
alpha3 = alpha2;
alpha4 = alpha1;
alpha5 = alpha1;

n1 = 10;         % number of the node
n2 = 20;
n3 = 15;
n4 = 50;
n5 = 600;

T0 = 25;        % initail wall temparture
Tout = 75;      % Temparture ouside
Tin0 = 37;      % initail Temparture inside

dt = 0.001;


dx1 = L1/n1;
dx2 = L2/n2;
dx3 = L3/n3;
dx4 = L4/n4;
dx5 = L5/n5;

x1 = dx1/2:dx1:L1-dx1/2;
x2 = L1+dx2/2:dx2:L1+L2-dx2/2;
x3 = L1+L2+dx3/2:dx3:L1+L2+L3-dx3/2;
x4 = L1+L2+L3+dx4/2:dx4:L1+L2+L3+L4-dx4/2;
x5 = L1+L2+L3+L4+dx5/2:dx5:L1+L2+L3+L4+L5-dx5/2;


dT_dt1 = zeros(1,n1);
dT_dt2 = zeros(1,n2);
dT_dt3 = zeros(1,n3);
dT_dt4 = zeros(1,n4);
dT_dt5 = zeros(1,n5);


T1 = T0 * ones(1,n1) ;
T2 = T0 * ones(1,n2) ;
T3 = T0 * ones(1,n3) ;
T4 = T0 * ones(1,n4) ;
T5 = 37*ones(1,n5);


t_final = 5400;    % end time
t = 0:dt :t_final;

for i = 1:length(t)
    
    %layerI
    for j = 2:n1-1
        dT_dt1(j) = alpha1 * ((T1(j+1)-T1(j))/dx1^2-(T1(j)-T1(j-1))/dx1^2);
    end
    dT_dt1(1) = alpha1 * ((T1(2)-T1(1))/dx1^2-(T1(1)-Tout)/dx1^2);
    dT_dt1(n1) = alpha1 * (-(T1(n1) - T1(n1-1))/dx1^2);
    T1 = T1 + dT_dt1 * dt;
    
    
    % layerII
    for j = 2:n2-1
        dT_dt2(j) = alpha2 * ((T2(j+1)-T2(j))/dx2^2-(T2(j)-T2(j-1))/dx2^2);
    end
    dT_dt2(1) = alpha2 * ((T2(2)-T2(1))/dx2^2-(T2(1)-T1(n1))/dx2^2);
    dT_dt2(n2) = alpha2 * (-(T2(n2) - T2(n2-1))/dx2^2);
    T2 = T2 + dT_dt2 * dt;
    
    % layerIII
    for j = 2:n3-1
        dT_dt3(j) = alpha3 * ((T3(j+1)-T3(j))/dx3^2-(T3(j)-T3(j-1))/dx3^2);
    end
    dT_dt3(1) = alpha3 * ((T3(2)-T3(1))/dx3^2-(T3(1)-T2(n2))/dx3^2);
    dT_dt3(n3) = alpha2 * (-(T3(n3) - T3(n3-1))/dx3^2);
    T3 = T3 + dT_dt3 * dt;
    
    % layerIV
    for j = 2:n4-1
        dT_dt4(j) = alpha4 * ((T4(j+1)-T4(j))/dx4^2-(T4(j)-T4(j-1))/dx4^2);
    end
    dT_dt4(1) = alpha4 * ((T4(2)-T4(1))/dx4^2-(T4(1)-T3(n3))/dx4^2);
    dT_dt4(n4) = alpha4 * (-(T4(n4) - T4(n4-1))/dx4^2);
    T4 = T4 + dT_dt4 * dt;
    
    
    % Body
    for j = 2:n5-1
        dT_dt5(j) = alpha5 * ((T5(j+1)-T5(j))/dx5^2-(T5(j)-T5(j-1))/dx5^2);
    end
    dT_dt5(1) = alpha5 * ((T5(2)-T5(1))/dx5^2-(T5(1)-T4(n4))/dx5^2);
    dT_dt5(n5) = alpha5 * (-(T5(n5) - T5(n5-1))/dx5^2);
    T5 = T5 + dT_dt5 * dt;
    
    T = zeros(1,n1+n2+n3+n4+30);
    T(1:n1) = T1;
    T(n1+1:n1+n2) = T2;
    T(n1+n2+1:n1+n2+n3) = T3;
    T(n1+n2+n3+1:n1+n2+n3+n4) = T4;
    T(n1+n2+n3+n4+1:n1+n2+n3+n4+30) = T5(1:30);
    
    
    x = zeros(1,n1+n2+n3+n4+30);
    x(1:n1) = x1;
    x(n1+1:n1+n2) = x2;
    x(n1+n2+1:n1+n2+n3) = x3;
    x(n1+n2+n3+1:n1+n2+n3+n4) = x4;
    x(n1+n2+n3+n4+1:n1+n2+n3+n4+30) = x5(1:30);
    
    
    %subplot(2,2,1);
    
    pause(0.000001);
    
    if mod(i,50)==0
        figure(1);
        plot(x,T);
    end 
     
    display(i);
    
    
end

display("end");



