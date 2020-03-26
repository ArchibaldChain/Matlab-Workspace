data=xlsread('data_using.xlsx');

N_0 = 57237727; % total people

data = data(:, [4, 5, 3, 1, 2]);  % set the data with the order as [E, D, I, R, Death]

data1 = data(1:14,:);% From Jan 24th to Feb 14th
data2 = data(15:end, : );


%% Data before 20th Feb.

E = data1(:,1); % Exposed
D = data1(:, 2); % Diagosis 
I = data1(:,3); % Infected 
R = data1(:,4); % Recovered
Death = data1(:, 5); % Dead 

[Para1, A1, y1] = Parameter_Regression(E, I, D, Death, R, N_0) ;

%% Data after 21st Feb.
E = data2(:,1); % Exposed
D = data2(:, 2); % Diagosis 
I = data2(:,3); % Infected 
R = data2(:,4); % Recovered
Death = data2(:, 5); % Dead 

[Para2, A2, y2] = Parameter_Regression(E, I, D, Death, R, N_0) ;

%% Data for the whole period 
E = data(:,1); % Exposed
D = data(:, 2); % Diagosis 
I = data(:,3); % Infected 
R = data(:,4); % Recovered
Death = data(:, 5); % Dead 

[Para, A, y] = Parameter_Regression(E, I, D, Death, R, N_0) ;