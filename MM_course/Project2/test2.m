data = xlsread('Data_using.xlsx');


para1 = [
   1.995738587552853
   0.018872555235150
   0.001136110412638
   0.018145899295266
  -0.000024962443155
   0.000190013109133
   0.001620048768106
  -0.000369119006158
   0.000279883686622
   0.0000155331943390
] * 10^3;

para2 = [
   -2.207149415917732
  -0.019265394108875
   0.002122803601276
  -0.018356700347925
   0.000128898675072
   0.000504307218410
   0.002631313809606
  -0.008543828491279
   0.001051060414253
   0.0000956372641798
] * 10 ^2;

para = [
  -1.363841369485459
  -0.027319610138765
   0.002112477534693
  -0.025979369204787
   0.000038693928870
   0.000245684414506
   0.001950969605788
  -0.000756673066440
   0.000535800435409
   0.000068430751391

] * 10^2;

data = data(:, [4, 5, 3, 1, 2]);  % set the data with the order as [E, D, I, R, Death]

%% First part
% x_1 = data(1,:); % the data on Jan 24th
% days1 = 13;
% [S, E, D, I, R, Death, Q, N] = prediction(N_0, x_1, days1, para1);
% figure(1);
% 
% subplot(3, 2, 1);
% hold on;
% title('E');
% plot(  E( 1  :(min(find(E>10^5, 1 )) -1)  )  , 'r'  );
% plot(data(1:days1, 1),'b');
% legend('predict', 'real');
% 
% subplot(3, 2, 2);
% hold on;
% title('D');
% plot(D( 1  :(min(find( D>10^5, 1 )) -1)  ), 'r');
% plot(data(1:days1, 2),'b');
% legend('predict', 'real');
% 
% subplot(3, 2, 3);
% hold on;
% title('I');
% plot(I( 1  :(min(find(I>10^5, 1 )) -1) ), 'r');
% plot(data(1:days1, 3),'b');
% legend('predict', 'real');
% 
% subplot(3, 2, 4);
% hold on;
% title('R');
% plot(R( 1  :(min(find(R>10^5, 1 )) -1)  ), 'r');
% plot(data(1:days1, 4),'b');
% legend('predict', 'real');
% 
% subplot(3, 2, 5);
% hold on;
% title('Death');
% plot( Death( 1  :(min(find(Death>10^5, 1 )) -1)  ), 'r');
% plot(data(1:days1, 5),'b');
% legend('predict', 'real');
% 
% subplot(3, 2, 6);
% hold on;
% title('S');
% plot(S( 1  :(min(find(S>10^5, 1 )) -1)  ), 'r');
% plot(0.05 * (N_0 - sum(data(1:days1,:)')),'b');
% legend('predict', 'real');
% 
%% Second part
x_2 = data(14,:); % the data on Feb 15th
d2 = 14;
days2 = 31;
[S, E, D, I, R, Death, Q, N] = prediction(N_0, x_2, days2, para2);


figure(1)
hold on;
title('E');
plot(  E( 1  :(min(find(E>10^5, 1 )) -1)  )  , 'r'  );
plot(data(d2:end, 1),'b');
legend('predict', 'real');
hold off;

figure(2)
hold on;
title('D');
plot(D( 1  :(min(find( D>10^5, 1 )) -1)  ), 'r');
plot(data(d2:end, 2),'b');
legend('predict', 'real');
hold off;

figure(3)
hold on;
title('I');
plot(I( 1  :(min(find(I>10^5, 1 )) -1) ), 'r');
plot(data(d2:end, 3),'b');
legend('predict', 'real');
hold off;

figure(4)
hold on;
title('R');
plot(R( 1  :(min(find(R>10^5, 1 )) -1)  ), 'r');
plot(data(d2:end, 4),'b');
legend('predict', 'real');
hold off;

figure(5)
hold on;
title('Death');
plot( Death( 1:(min(find(Death>10^5, 1 )) -1)  ), 'r');
plot(data(d2:end, 5),'b');
legend('predict', 'real');

% %% whole period
% 
% x_1 = data(1,:); % the data on Jan 24th
% days = 44;
% [S, E, D, I, R, Death, Q, N] = prediction(N_0, x_1, days, para);
% figure(3);
% 
% subplot(3, 2, 1);
% hold on;
% title('E');
% plot(  E( 1  :(min(find(E>10^5, 1 )) -1)  )  , 'r'  );
% plot(data(:, 1),'b');
% legend('predict', 'real');
% 
% subplot(3, 2, 2);
% hold on;
% title('D');
% plot(D( 1  :(min(find( D>10^5, 1 )) -1)  ), 'r');
% plot(data(:, 2),'b');
% legend('predict', 'real');
% 
% subplot(3, 2, 3);
% hold on;
% title('I');
% plot(I( 1  :(min(find(I>10^5, 1 )) -1) ), 'r');
% plot(data(:, 3),'b');
% legend('predict', 'real');
% 
% subplot(3, 2, 4);
% hold on;
% title('R');
% plot(R( 1  :(min(find(R>10^5, 1 )) -1)  ), 'r');
% plot(data(:, 4),'b');
% legend('predict', 'real');
% 
% subplot(3, 2, 5);
% hold on;
% title('Death');
% plot( Death( 1  :(min(find(Death>10^5, 1 )) -1)  ), 'r');
% plot(data(:, 5),'b');
% legend('predict', 'real');
% 
% subplot(3, 2, 6);
% hold on;
% title('S');
% plot(S( 1  :(min(find(S>10^5, 1 )) -1)  ), 'r');
% plot(0.05 * (N_0 - sum(data(1:days1,:)')),'b');
% legend('predict', 'real');