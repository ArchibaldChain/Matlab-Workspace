% header 
% the comment here is used for the basic description

radius = 5

%{
first line
second line
third line
 %}
  
%% input 
% input number
radius = input('Enter the radius');

% input char
letter = input('Enter the char:', 's');
% if 's' is not added, the single char input will cast into ASCII:
letter1 = input('Enter the char:')
% if input contains '' then, matlab will not make the symbow become part of string, unless 's' is added.
letter2 = input('Enter the char: \letter\','s');

% input a vector 
v = input('Input a vector') 

%% output
% formatting output
fprintf('The value is %d', 4^2);
fprintf('%f', 4^3);
fprintf('%s', 3^3);
fprintf('%s', [4, 45]);
fprintf('%c', 'd');

fprintf('|%6.4d|\n', 34) %  the number before the point keeping the || has the same distance
fprintf('%3.5f', 323.3)
% the number after '.' keeps the float number has so many decimals

fprintf("|%15.8f|\n", randi([1,200],10,1) + rand([10,1])) % make the number flush right
fprintf("|%-15.8f|\n", randi([1,200],10,1) + rand([10,1])) %make the number flush left 

fprintf("line 1\nline 2\n\nline 4");
fprintf(' '' \\ ');

%% plot
x = 11
y = 48

% change the axes and label them
axis([9 12 35 55]) ; % axis([xmin xmax ymin ymax])
axis([x-2 x+2 y-10 y+10]) ; % axis([xmin xmax ymin ymax])
xlabel('Time')
ylabel('Temperature')

%Put a title on the plot
title('Time and Temperature')

% another plot
x = 1:6
y = [1 3 4 5 9 11]
plot(x,y,'*b-.')% for specific turned to help plot

% default , means '-' there is only line
% 'x' means there is only point.

 hold % only means on or off when it is only off or on;
 hold on  % is turn on.

% figure()
figure(); % open a new figure
% figure 1 is inactive, figure 2 is active  

figure(1); % figure 1 is active, figure 2 is inactive
