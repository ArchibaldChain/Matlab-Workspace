data=xlsread('data_using.xlsx');

N_0 = 57237727; % total people


data1 = data(1:14,:);% From Jan 24th to Feb 14th
data2 = data(15:end, : );


%% Data before 20th Feb.
I = data1(:,3); % Infected 
R = data1(:,1); % Recovered
E = data1(:,4); % Exposed
D = data1(:, 5); % Diagosis  
Death = data1(:, 2); % Dead 

Para1 = Parameter_Regression(E, I, D, Death, R, N_0) ;

%% Data after 21st Feb.
I = data2(:,3); % Infected 
R = data2(:,1); % Recovered
E = data2(:,4); % Exposed
D = data2(:, 5); % Diagosis  
Death = data2(:, 2); % Dead 

Para2 = Parameter_Regression(E, I, D, Death, R, N_0) ;

%% Data for the whole period 
I = data(:,3); % Infected 
R = data(:,1); % Recovered
E = data(:,4); % Exposed
D = data(:, 5); % Diagosis  
Death = data(:, 2); % Dead 

Para = Parameter_Regression(E, I, D, Death, R, N_0) ;