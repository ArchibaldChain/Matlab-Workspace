x = [17 19 20 22 23 25 28 31 32 33 36 37 39 42]
y = [19 25 32 51 57 71 113 140 153 187 192 205 250 260]
x2 = x.^2
x3 = x.^3
X = [ones(length(x),1), x2' x3']
hold on
p = polyfit(x,y,1);
% Evaluate the fitted polynomial p and plot:
f = polyval(p,x);
plot(x,y,'o',x,f,'-.')


p = polyfit(x2,y,1);
% Evaluate the fitted polynomial p and plot:
f = polyval(p,x2);
plot(x,f,'--')

p = polyfit(x3,y,1);
% Evaluate the fitted polynomial p and plot:
f = polyval(p,x3);
plot(x,f,'-*')

pa = regress(y', X)
% Evaluate the fitted polynomial p and plot:
f = X*pa;
plot(x,f,'-')

p = polyfit(x,y,3);
% Evaluate the fitted polynomial p and plot:
f = polyval(p,x);
plot(x,f,'--')
legend('data','linear fit', 'qudratic model', 'third power model', 'poly model', 'full poly model')