% The program is used for prediction(estimate) of population in USA between 1910 and 2000.

% time interval
t = (1910:10:2000)'

% Population
p = [91.972 105.711 123.203 131.669 150.697...
179.323 203.212 226.505 249.633 281.422]';

% Plot
plot(t, p, 'bo')
axis ([1910 2020 0 400]);
title('Population of U.S. 1910-2000')
ylabel('Millions')

n = length(t);
s = (t - 1950) /50 %-0.8 -.6 -.4 -.2 0 .2 .4 .6 .8 1.0
A = zeros(n);
A(:,end) = 1;

for j = n-1:-1:1
    A(:,j) = s .* A(:,j+1);
end

c = A(:,n-3:n)\p
v = (1910:2020)';
x = (v - 1950)/50;
w = (2010 - 1950);
y = polyval(c,x);
z = polyval(c,w);


hold on
plot(v, y, 'g-');
plot(2010, z, 'sg');
text(2010, z+15, num2str(z))


pause 

c = A(:,n-4:n)\p
y = polyval(c,x);
z = polyval(c,w);


hold on
plot(v, y, '-r');
plot(2010, z, 'sr');
text(2010, z+15, num2str(z))
hold off


figure();

hold on
plot(t,p,'bo')

axis([1910 2020 0 400])

colors = hsv(8);

labels = {'data'};
for d = 1:8
    [Q,R] = qr(A(:,n-d:n));
    R = R(1:d+1,:);
    Q = Q(:,1:d+1);
    c = R\(Q'*p);
    y = polyval(c,x);
    z = polyval(c,11);
    plot(v, y, 'color', colors(d,:));
    labels{end+1} = ['degree = ' int2str(d)];
end
legend(labels, 'Location', 'NorthWest')
hold off


