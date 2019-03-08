function [] = thermal_newone_latest0_1(dt,racial)

L1 = 0.6;   % thickness of layerI, mm
L2 = 6;     % thickness of layerII, mm
L3 = 3.6;   % thickness of layerIII, mm
L4 = 5;     % thickness of layerIV, mm
L5 = 100;   % Assuming thinckness of body, mm

alpha1 = 0.19849915;    %thermal para of layerI
alpha2 = 0.2043973;     %thermal para of layerII
alpha3 = 0.35137254;    %thermal para of layerIII
alpha4 = 23.61075976;   %thermal para of layerIV
alpha5 = 0.1371337*racial;


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

%  dt = 0.00015;

x1 = dx/2 : dx : L1-dx/2;
x2 = L1+dx/2 : dx : L1+L2-dx/2;
x3 = L1+L2+dx/2 : dx : L1+L2+L3-dx/2;
x4 = L1+L2+L3+dx/2 : dx :L1+L2+L3+L4-dx/2;
x5 = L1+L2+L3+L4+dx/2 : dx : L1+L2+L3+L4+L5-dx/2;

dT_dt = zeros(1,n+n5);

T0 = T0 * ones(1,n);
T5 = 37 * ones(1,n5);
T = [T0 T5];

t_final = 5400;    % end time
t = 0: dt :t_final;

tempMatrix = T(1:n);

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
	dT_dt(1) = alpha1 * ((T(2)-T(1))/dx^2-(T(1)-Tout)/dx^2);
	dT_dt(n+n5) = alpha5 * (-(T(n+n5)-T(n+n5-1))/dx^2);
  
    T = T + dT_dt * dt;
    
    
    x = [x1 x2 x3 x4 x5(1:20)];

    %subplot(2,2,1);
    
    if mod(i,100000)==0 	
        figure(1);
        plot(x,T(1:n+10));
        pause(0.0001);
    end 
    
    
    if (t(i) == fix(t(i)))
        display(t(i));
    end

    if mod(i,10/dt)==0
        tempMatrix = [tempMatrix; T(1:n)];
    end
    
    if mod(i,100/dt)==0
        fileName = [num2str(int32(t(i))),'sFile.mat'];
        save(['F:/Matlab/Q2/rac_05/',fileName],'tempMatrix','dT_dt');
    end    
    
    if isnan(T(1))
        break;
    end
    
   
    
end
% save('F:/Matlab/Q2/rac_05/answer.mat', 'tempMatrix');
 disp('end');

end

