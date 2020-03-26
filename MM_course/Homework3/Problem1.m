BDP = [14200, 20705, 39312, 16800, 22955, 26500, 16500, 19950];
c_0 = [500 750 1000 500 0 0 900 1000];
r_y = [0.045 0.0438 0.0428 0.044 0.048 0.03 0.0425 0.043];
r_m = r_y/12;
D = [60 60 60 60 60 48 60 60];
names = ["Ford Fiesta", "Ford Focus","Chery Volt","Chery Cnzz", "Toyota Camry", "Toyota Camry Hybrid", "Toyota Corolla", "Toyota Prius"];
c = 500;
% N = zeros(1,length(BDP))
[N, TP] = Minimal_payment(BDP, c_0, r_m, c)


c = Minimal_MothPay((BDP-c_0), r_m, D)

for i = 1:length(BDP)
    fprintf("%s & %d & %d & %.2f &  %d &%.2f\\\\\n", names(i), N(i), D(i), TP(i), BDP(i), c(i))
end