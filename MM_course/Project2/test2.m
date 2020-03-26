data = xlsread('Data_using.xlsx');


para1 = [
    
  -2.361352371651989
   0.000155637728223
   0.000134638477735
   0.000195844267935
   0.000022249328513
   0.000121436541080
  -0.000215801832382
   0.000049610349472
   0.000067480571006
   0.000066733554517
] * 10^3;

para2 = [
      -2.964793926995287
   0.010513179736169
   0.010253652532292
   0.010614477552397
   0.000000247511477
  -0.000301635119231
   0.000683558292405
  -0.008336665501919
   0.001060033490542
   0.000141501524026
] * 10 ^2;

para = [
      -5.405683885758283
   0.002487945998541
   0.001750120964230
   0.002641168546914
  -0.000040359785392
   0.000408390936557
  -0.000903987508410
  -0.000689125527246
   0.000625979045686
   0.000290937210875
] * 10^2;

data = data(:, [4, 5, 3, 1, 2]);  % set the data with the order as [E, D, I, R, Death]

%% First part
x_1 = data(1,:); % the data on Jan 24th
days1 = 13;
[S, E, D, I, R, Death, Q, N] = prediction(N_0, x_1, days1, para1);
figure(1);

subplot(3, 2, 1);
hold on;
title('E');
plot(E, 'r');
plot(data(1:days1, 1),'b');
legend('predict', 'real');

subplot(3, 2, 2);
hold on;
title('D');
plot(D, 'r');
plot(data(1:days1, 2),'b');
legend('predict', 'real');

subplot(3, 2, 3);
hold on;
title('I');
plot(I, 'r');
plot(data(1:days1, 3),'b');
legend('predict', 'real');

subplot(3, 2, 4);
hold on;
title('R');
plot(R, 'r');
plot(data(1:days1, 4),'b');
legend('predict', 'real');

subplot(3, 2, 5);
hold on;
title('Death');
plot(Death, 'r');
plot(data(1:days1, 5),'b');
legend('predict', 'real');

subplot(3, 2, 6);
hold on;
title('S');
plot(S, 'r');
plot(0.05 * (N_0 - sum(data(1:days1,:)')),'b');
legend('predict', 'real');

%% Second part
% x_2 = data(14,:); % the data on Feb 15th
% days2 = 31;
% [S, E, D, I, R, Death, Q, N] = prediction(N_0, x_2, days2, para2);
% figure(2);
% 
% subplot(3, 2, 1);
% hold on;
% title('E');
% plot(E, 'r');
% plot(data(days2:end, 1),'b');
% legend('predict', 'real');
% hold off;
% 
% subplot(3, 2, 2);
% hold on;
% title('D');
% plot(D, 'r');
% plot(data(days2:end, 2),'b');
% legend('predict', 'real');
% hold off;
% 
% subplot(3, 2, 3);
% hold on;
% title('I');
% plot(I, 'r');
% plot(data(days2:end, 3),'b');
% legend('predict', 'real');
% hold off;
% 
% subplot(3, 2, 4);
% hold on;
% title('R');
% plot(R, 'r');
% plot(data(days2:end, 4),'b');
% legend('predict', 'real');
% hold off;
% 
% subplot(3, 2, 5);
% hold on;
% title('Death');
% plot(Death, 'r');
% plot(data(days2:end, 5),'b');
% legend('predict', 'real');