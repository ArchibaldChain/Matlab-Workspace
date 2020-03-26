%% Numerical Method
N = 100;
M_next = @(O,M) 1.2*M - 0.001 *O.*M;
O_next = @(O,M) 0.7*O + 0.002 *O.*M;
O = zeros(4, N);
M = zeros(4, N);
O(:,1) = [1 0 150 200]';
M(:,1) = [200 1 200 150]';
for i = 1:N - 1
    O(:,i+1) = O_next(O(:,i), M(:,i));
    O(O <0) = 0;
    M(:,i+1) = M_next(O(:,i), M(:,i));
    M(M <0) = 0;
end


for i = 1:4
    figure(i)
    hold on;
    xlabel("time")
    ylabel("quantity")
    plot(O(i,:),"r-.");
    
    plot(M(i,:),"b--");
    legend("owls", "mise")
end 

%% Differential Equation
