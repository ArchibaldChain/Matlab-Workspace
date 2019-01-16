L2_06 = [15,16.6, 18, 19,19.2,19.3,19.5,20,23,25];
plot(L2_06, find64(:,1),'b');

hold on;
plot(L2_06, find64(:,2),'r');
plot(L2_06,44*ones(10,1),'--','Color','b');
plot(L2_06,47*ones(10,1),'--','Color','r');
xlabel('L2/mm');
ylabel("T/¡æ");
legend('t = 25min', 't = 30min' );