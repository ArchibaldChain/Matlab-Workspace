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

% there are four different states of figure
% not exist, active, inactive, invisiable
close(1) % kill figure 1
clf % clear current figure
figure()
% another way similar clf
close(1)
figure(1)

% when you pause the code, and use mouse can also active a figure.