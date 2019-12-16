% Project #2
u_exact = @(t) t.^2.* (1-t).^2;

%% a.x
N = 49;
h = 1 / (N + 1);
x = 0:h:(N + 1) * h;
f = @(x) 12* x.^2 - 12* x + 2 - 100* x.^2.*(1 - x).^2;
u0 = u_exact(x(2:N+1))';

%% b.
F = f(x(2:N + 1)');
u = zeros(N, 1);

A = zeros(N, N);
A(1, 1) = -2 / h^2 - 100;
A(1, 2) = 1 / h^2;
A(N, N) = -2 / h^2 - 100;
A(N, N - 1) = 1 / h^2;

for i = 2:N - 1
    A(i, i - 1) = 1 / h^2;
    A(i, i) = -2 / h^2 - 100;
    A(i, i + 1) = 1 / h^2;
end

%% c.
[L, U] = lu(A);
y = L \ F;
u = U \ y;
u1 = u;
subplot(4,2, 1);
% title("General method against exact value");
plot(x, [0; u; 0],'b');
hold on;
plot(x, [0; u0; 0],'r');
xlabel("t");
ylabel("u");
subplot(4,2, 2);
plot(x, [0; abs(u-u0); 0])
xlabel("t");
ylabel("error");


%% d. Jacon's method
F = f(x(2:N + 1)');
u = zeros(N, 1);
u_0 = u;
n = 20;
for k = 1:n

    for i = 1:N
        s = sum(A(i,:)*u_0) - A(i,i)*u_0(i);
        u(i) = 1/A(i,i) * (F(i) - s);
    end
    u_0 = u;
end
u2 = u;
subplot(4,2, 3);
title("Jacobi's method against exact value");
plot(x, [0; u; 0],'b');
hold on;
plot(x, [0; u0; 0],'r');
xlabel("t");
ylabel("u");
subplot(4,2, 4);
plot(x, [0; abs(u-u0); 0])
xlabel("t");
ylabel("error");

%% e. Gauss-Seidel method
u = zeros(N,1);
for k = 1:n

    for i = 1:N
        s = sum(A(i,:)*u) - A(i,i)*u(i);
        u(i) = 1/A(i,i) * (F(i) - s);
    end
end
u3 = u;
subplot(4,2, 5);
title("Gauss-Seidel method against exact value");
plot(x, [0; u; 0],'b');
hold on;
plot(x, [0; u0; 0],'r');
xlabel("t");
ylabel("u");
subplot(4,2, 6);
plot(x, [0; abs(u-u0); 0])
xlabel("t");
ylabel("error");

%% f. SOR iteration
u = zeros(N,1);
w = 2/(1+sin(pi/N));
for k = 1:n

    for i = 1:N
        s = sum(A(i,:)*u) - A(i,i)*u(i);
        u(i) = (1-w)*u(i) + w * 1/A(i,i) * (F(i) - s);
    end
end
u4 = u;
subplot(4,2,7);
title("SOR method agianst true value");
plot(x, [0; u; 0],'b');
hold on;
plot(x, [0; u0; 0],'r');
xlabel("t");
ylabel("u");
subplot(4,2, 8);
plot(x, [0; abs(u-u0); 0])
xlabel("t");
ylabel("error");