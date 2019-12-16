% Project #2
u_exact = @(t) t.^2 .* (1 - t).^2;

%% a.x
N = 49;
h = 1 / (N + 1);
x = 0:h:(N + 1) * h;
f = @(x) 12 * x.^2 - 12 * x + 2 - 100 * x.^2 .* (1 - x).^2;
u0 = u_exact(x(2:N + 1))';

%% b.
F = f(x(2:N + 1)');
u = zeros(N, 1);
a1 = (-2 / h^2 - 100);
a2 = (1 / h^2);

%% c.

[L, U] = lu_triangular(a2 * ones(N - 1, 1), a1 * ones(N, 1), a2 * ones(N - 1, 1));
y = L \ F;
u = U \ y;
u1 = u;
subplot(4, 2, 1);
% title("General method against exact value");
plot(x, [0; u; 0], 'b');
hold on;
plot(x, [0; u0; 0], 'r');
xlabel("t");
ylabel("u");
subplot(4, 2, 2);
plot(x, [0; abs(u - u0); 0])
xlabel("t");
ylabel("error");

%% d. Jacon's method
F = f(x(2:N + 1)');
u = zeros(N, 1);
u_0 = u;
n = 20;

for k = 1:n

    for i = 1:N
        J = [i - 1, i + 1];
        J = J(J >= 1 & J <= N);
        s = A_(i, J) * u_0(J);
        u(i) = 1 / A_(i, i) * (F(i) - s);
    end

    u_0 = u;
end

u2 = u;
subplot(4, 2, 3);
title("Jacobi's method against exact value");
plot(x, [0; u; 0], 'b');
hold on;
plot(x, [0; u0; 0], 'r');
xlabel("t");
ylabel("u");
subplot(4, 2, 4);
plot(x, [0; abs(u - u0); 0])
xlabel("t");
ylabel("error");

%% e. Gauss-Seidel method
u = zeros(N, 1);

for k = 1:n

    for i = 1:N
        J = [i - 1, i + 1];
        J = J(J >= 1 & J <= N);
        s = A_(i, J) * u(J);
        u(i) = 1 / A_(i, i) * (F(i) - s);
    end

end

u3 = u;
subplot(4, 2, 5);
title("Gauss-Seidel method against exact value");
plot(x, [0; u; 0], 'b');
hold on;
plot(x, [0; u0; 0], 'r');
xlabel("t");
ylabel("u");
subplot(4, 2, 6);
plot(x, [0; abs(u - u0); 0])
xlabel("t");
ylabel("error");

%% f. SOR iteration
u = zeros(N, 1);
w = 2 / (1 + sin(pi / N));

for k = 1:n

    for i = 1:N
        J = [i - 1, i + 1];
        J = J(J >= 1 & J <= N);
        s = A_(i, J) * u(J);
        u(i) = (1 - w) * u(i) + w * 1 / A_(i, i) * (F(i) - s);
    end

end

u4 = u;
subplot(4, 2, 7);
title("SOR method agianst true value");
plot(x, [0; u; 0], 'b');
hold on;
plot(x, [0; u0; 0], 'r');
xlabel("t");
ylabel("u");
subplot(4, 2, 8);
plot(x, [0; abs(u - u0); 0])
xlabel("t");
ylabel("error");

function [L, U] = lu_triangular(beta, alpha, gamma)
    % beta is the diagonal rightside of the main diagnoal with length n-1
    % alpha is the main diagonal with length n
    % gamma is the diagnoal leftside of the main diagnoal with length n-1

    n = length(alpha);
    u = zeros(n, 1);
    l = zeros(n, 1);
    L = zeros(n, n);
    U = zeros(n, n);

    for i = 1:n

        if i == 1
            u(1) = alpha(1);
            U(1, 1) = u(1);
            U(1, 2) = beta(1);
            L(1, 1) = 1;
        elseif i == n
            l(n) = gamma(n - 1) / u(n - 1);
            u(n) = alpha(n) - l(n) * beta(n - 1);
            U(n, n) = u(n);
            L(n, n - 1) = l(n);
            L(n, n) = 1;
        else
            l(i) = gamma(i - 1) / u(i - 1);
            u(i) = alpha(i) - l(i) * beta(i - 1);
            L(i, i - 1) = l(i);
            L(i, i) = 1;
            U(i, i) = u(i);
            U(i, i + 1) = beta(i);
        end

    end

end

function value = A_(i, j)
    h = 1/50;
    a1 = (-2 / h.^2 - 100);
    a2 = (1 / h.^2);
    value = ones(length(i), length(j));

    for p = 1:length(i)

        for q = 1:length(j)

            if (i(p) - j(q) == 0)
                value(p, q) = a1;
            elseif (abs(i(p) - j(q)) == 1)
                value(p, q) = a2;
            else
                value(p, q) = 0;
            end

        end

    end

end
