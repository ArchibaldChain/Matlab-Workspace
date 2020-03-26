function [parameter, A, y] = Parameter_Regression(E, I, D, Death, R, N_0)

N = N_0 - Death;
S = (N - E - I - D - R)* 0.05; % The amount of suscetible
Q = (N - E - I - D - R) * 0.95; % The amount of Quaratine.
n = length(E) - 1


%% construct A
A_1 = zeros(n,10);
A_2 = zeros(n,10);
A_3 = zeros(n,10);
A_4 = zeros(n,10);
A_5 = zeros(n,10);
A_6 = zeros(n,10);


for i = 1:n
    A_1(i,2) = -E(i)*S(i)/(N(i)-Q(i));
    A_1(i,3) = -I(i)*S(i)/(N(i)-Q(i)); 
    A_1(i,4) = E(i) ;

    A_2(i,2) = E(i)*S(i)/(N(i)-Q(i)); 
    A_2(i,3) = I(i)*S(i)/(N(i)-Q(i));
    A_2(i,4) = -E(i);
    A_2(i,5) = -E(i);
    A_2(i,6) = -E(i);

    
    A_3(i, 5) = E(i);
    A_3(i, 6) = -I(i);
    A_3(i, 7) = -I(i);

    A_4(i, 6) = E(i);
    A_4(i, 7) = I(i);
    A_4(i, 9) = -D(i);
    A_4(i, 10) = -D(i);

    A_5(i, 8) = I(i);
    A_5(i, 9) = D(i);
    
    A_6(i, 10) = D(i);
end

A = [A_1;A_2;A_3;A_4; A_5; A_6];
A(:, 1) = 1;

%% construct y
y = zeros(6*n, 1);
for i = 1:n
    y(i) = S(i+1) - S(i);
    y(n + i) = E(i+1) - E(i);
    y(2*n + i) = I(i+1) - I(i); 
    y(3*n + i) = D(i+1) - D(i);
    y(4*n +i) = R(i+1) - R(i);
    y(5*n + i) = Death(i+1) - Death(i);
end

%% Regression
% parameter = regress(y(n+1: end), A(n+1:end, :));
parameter = regress(y, A);
end 