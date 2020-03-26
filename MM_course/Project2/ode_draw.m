function [S, E, D, I, R ,death] = ode_draw(parameter, data_0, days)

    % set the parameter
    bias = para(1);
    beta1 = para(2);
    beta2 = para(3);
    delta_E = para(4);
    sigma = para(5);
    epsilon_E = para(6);
    epsilon_I = para(7);
    gamma_I = para(8);
    gamma_D = para(9);
    dd = para(10);

equ1 = @(S,E,I,N) - beta1 * S*E /(N - 19*S) - beta2 *S*I/(N - 19*S) + delta_E *E;
equ2 = @(S,E,I,N)  beta1 * S*E/(N - 19*S)...
             + beta2 * S*I/(N - 19*S）...
            - sigma * E - delta_E * E - epsilon_E * E;
equ3 = @(E,I) I + sigma * E - gamma_I * I - epsilon_I * I;
equ4 = @(E,I,D) D + epsilon_E * E + epsilon_I * I...
            - dd * D - gamma_D * D;
equ5 = @(I, R) R + gamma_I * I + gamma_D * D;
equ6 = @(D)    dd * D;
equ7 = @(Death) N0 - Death
equ8 = @(E, D, I, R, Death, N)  N - E - D - I - R - Death;

ode_draw('DS/dt = equ1(S, E, D, I, N), DE/dt = equ2(S,E,I,N), dI/dt = equ3(E,I), D(D)/dt = equ4(E,I,D),dR/dt = equ5(I, D), death = equ6(D), N = equ7(death), S = equ8(E, D, I, R, death, N)', data_0, [1:days])

