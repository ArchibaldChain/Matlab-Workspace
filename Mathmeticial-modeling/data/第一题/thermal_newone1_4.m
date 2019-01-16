function [] = thermal_newone1_4()

load('data.mat');
L1 = 0.6;   % thickness of layerI, mm
L2 = 6;     % thickness of layerII, mm
L3 = 3.6;   % thickness of layerIII, mm
L4 = 5;     % thickness of layerIV, mm


alpha1 = 0.19849915;    %thermal para of layerI
alpha2 = 0.2043973;     %thermal para of layerII
alpha3 = 0.35137254;    %thermal para of layerIII
alpha4 = 23.61075976;   %thermal para of layerIV

n1 = 7; 
dx = L1/n1;

       
n2 = floor(L2/dx);
n3 = floor(L3/dx);
n4 = floor(L4/dx);
%n5 = floor(L5/dx);

n = n1+n2+n3+n4; % number of the node

T0 = 25;         % initail costum temparture
Tout = 75;       % Temparture ouside

dt = 0.0001;

dT_dt = zeros(1,n);

T = T0 * ones(1,n);

t_final = 5400;    % end time
t = 0: dt : t_final;

tempMatrix = T(1:n);

k = 1;
for i = 1:length(t)
    
    if(t(i) == skintemp(k,1))
        T(n) = skintemp(k,2);
        k = k+1;
    end
    
	for j = 2:n-1
        if j <= n1
			alpha = alpha1;
        elseif j <= n1+n2
			alpha = alpha2;
        elseif j <= n1 + n2 + n3
			alpha = alpha3;
        else
			alpha = alpha4;
        end
		
		dT_dt(j) = alpha * ((T(j+1)-T(j))/dx^2-(T(j)-T(j-1))/dx^2);
	end
	dT_dt(1) = alpha1 * ((T(2)-T(1))/dx^2-(T(1)-Tout)/dx^2);
    
    T = T + dT_dt * dt;
    
    if (mod(i,10/dt)==0)
        tempMatrix = [tempMatrix;zeros(1,n); T(1:n)];
    end
    if (mod(i,20/dt)==0)
        file_name = [num2str(int32(t(i))), 'sFile.mat'];
        save(file_name,'tempMatrix','dT_dt');
    end
    
    if isnan(T(1))
        break;
    end
    disp(t(i));
    
end
final_file_name = ['answer_L2_' num2str(L2) '.mat'];

save(final_file_name, 'tempMatrix');
disp('end');
end



