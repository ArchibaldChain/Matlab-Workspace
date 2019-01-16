function [] = thermal_newone_latest3_3(L2, L4)

L1 = 0.6;   % thickness of layerI, mm
L3 = 3.6;   % thickness of layerIII, mm
L5 = 100;   % Assuming thinckness of body, mm

alpha1 = 0.19849915;    %thermal para of layerI
alpha2 = 0.2043973;     %thermal para of layerII
alpha3 = 0.35137254;    %thermal para of layerIII
alpha4 = 23.61075976;   %thermal para of layerIV
alpha5 = 0.1371337*0.4;


n1 = 7; 
dx = L1/n1;

        % number of the node
n2 = floor(L2/dx);
n3 = floor(L3/dx);
n4 = floor(L4/dx);
n5 = floor(L5/dx);

n = n1+n2+n3+n4;

T0 = 25;        % initail costum temparture
Tout = 75;      % Temparture ouside
Tin0 = 37;      % initail Temparture inside

dt = 0.00015;   % the step long of time

dT_dt = zeros(1,n+n5); % initial rate of change

T0 = T0 * ones(1,n);
T5 = Tin0 * ones(1,n5);
T = [T0 T5];

t_final = 5400;    % end time
t = 0: dt :t_final;

tempMatrix = T(n);

for i = 1:length(t)

	for j = 2:n+n5-1
        if j <= n1
			alpha = alpha1;
        elseif j <= n1+n2
			alpha = alpha2;
        elseif j <= n1 + n2 + n3
			alpha = alpha3;
        elseif j <= n1+n2+n3+n4
			alpha = alpha4;
        else 
			alpha = alpha5;
        end
		
		dT_dt(j) = alpha * ((T(j+1)-T(j))/dx^2-(T(j)-T(j-1))/dx^2); 
	end
	dT_dt(1) = alpha1 * ((T(2)-T(1))/dx^2-(T(1)-Tout)/dx^2); %the rate of change of first node 
	dT_dt(n+n5) = alpha5 * (-(T(n+n5)-T(n+n5-1))/dx^2);      %the rate of change of first node
  
    T = T + dT_dt * dt;

    
    if (t(i) == fix(t(i)))
        display(t(i));
    end

    if mod(i,10/dt)==0       % Every 10s we get a temperature
        tempMatrix = [tempMatrix; T(n)];
    end

end
save('F:/Matlab/Q2/rac_05/answer.mat', 'tempMatrix');
disp('end');

end

