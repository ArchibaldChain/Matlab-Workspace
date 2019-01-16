L2_06 = [15, 20, 21.5, 21.9, 22, 22.2, 25];
plot(L2_06, find0_6(:,1),'b');


hold on;
plot(L2_06, find0_6(:,2),'r');
plot(L2_06,44*ones(7,1),'--','Color','b');
plot(L2_06,47*ones(7,1),'--','Color','r');
xlabel('L2/mm');
ylabel("T/¡æ");
legend('t = 25min', 't = 30min' );