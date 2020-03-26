
data=xlsread('hubei.xlsx');

N_0 = 57237727; % total people


data1 = data(1:13,:);% From Jan 24th to Feb 14th
data2 = data(14:end, : );


%% Data before 20th Feb.
I = data1(:,5); % Infected 
R = data1(:,2); % Recovered
E = data1(:,8); % Exposed
D = data1(:, 11); % Diagosis  
Death = data1(:, 3); % Dead 

Para1 = Parameter_Regression(E, I, D, Death, R, N_0) ;

%% Data after 21st Feb.
I = data2(:,5); % Infected 
R = data2(:,2); % Recovered
E = data2(:,8); % Exposed
D = data2(:,11); % Diagosis  
Death = data2(:, 3); % Dead 

Para2 = Parameter_Regression(E, I, D, Death, R, N_0) ;

%% Data for the whole period 
I = data(:,5); % Infected 
R = data(:,2); % Recovered
E = data(:,8); % Exposed
D = data(:, 11); % Diagosis  
Death = data(:, 3); % Dead 

Para = Parameter_Regression(E, I, D, Death, R, N_0) ;


fprintf(' %e\t',Para1);
fprintf(' %e\t',Para2);
fprintf(' %e\t',Para);
function parameter = Parameter_Regression(E, I, D, Death, R, N_0)

N = N_0 - Death;
S = (N - E - I - D - R);

n = length(E) - 1;


%% construct A
A_1 = zeros(n,10);
A_2 = zeros(n,10);
A_3 = zeros(n,10);
A_4 = zeros(n,10);
A_5 = zeros(n,10);
A_6 = zeros(n,10);


for i = 1:n
    A_1(i,3) = -E(i)*S(i)/N(i);
    A_1(i,2) = -I(i)*S(i)/N(i); 
    A_1(i,4) = E(i) ;

    A_2(i,3) = I(i)*S(i)/N(i);
    A_2(i,2) = E(i)*S(i)/N(i); 
    A_2(i,4) = -E(i); 
     A_2(i,5) = -E(i);
      A_2(i,6) = -E(i);
    
    A_3(i, 5) = E(i);
    A_3(i, 7) = -I(i);
    A_3(i, 8) = -I(i);

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
parameter = regress(y, A);
end 



