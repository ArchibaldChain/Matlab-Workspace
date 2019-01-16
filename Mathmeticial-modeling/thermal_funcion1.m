%%this was used to calculate the thermatical equation

L1 = 0.6;   %  mm  wall thickness

n = 20;         %  number of the node
T0 = 25;     %initail wall temparture
Tout = 75;      % Temparture ouside
Tin0 = 37;      %   initail Temparture inside 


alpha = 0.198499;   % thermal parameters  k/(c*Rou)  lenth unit in mm



dx = L1/n;
dT_dt = zeros(n,1);

x = dx/2:dx:L1-dx/2;
x = x';
T = T0 * ones(n,1) ;


dt = 0.001; 
t_final = 1000;    % end time
t = 0:dt :t_final;

T(n) = 37;
for i = 1:length(t)
	for j = 2:n-1
		dT_dt(j) = alpha * (-(T(j)-T(j-1))/dx^2 + (T(j+1)-T(j))/dx^2);
    end
	dT_dt(1) = alpha * (-(T(1)-Tout)/dx^2 + (T(2)-T(1))/dx^2);
    
    %dT_dt(n) = alpha * (-(T(n)-T(n-1))/dx^2 + (Tin0-T(n))/dx^2);
    dT_dt(n) = alpha * (-( T(n)-T(n-1) )/dx^2 );
	T = T + dT_dt .* dt;
    figure(1);
	plot(x, T);
    xlabel("x mm");
    ylabel("T ¡æ");
    disp(i);
    pause;
    
    
end

