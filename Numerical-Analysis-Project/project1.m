
x_tk = -5:0.1:5;
x_k = -5:1:5;
figure(1)
plot(x_tk, f(x_tk), 'r')
hold on;
plot(x_tk, LangPoly(x_tk, x_k ), 'b');
hold on;
plot(x_tk, CubicSpline(x_tk, x_k),'g');
hold on;
%plot(x_tk, L_k(x_tk, x_k, x_k(11)), 'y');
hold off;

figure(2)
x_k = -5:0.5:5;
plot(x_tk, f(x_tk), 'r')
hold on;
plot(x_tk, LangPoly(x_tk, x_k ), 'b');
hold on;
plot(x_tk, CubicSpline(x_tk, x_k), 'g');
hold on;
%plot(-4:0.1:4, L_k(-4:0.1:4, x_k, x_k(11)), 'y' );


%%  Set the funciton
function y = f(x)
    y = 1./(1+x.^2); 
%     y = cos(x);
end


%% Using Langrange polynomial
function poly =  LangPoly(x, x_k)
    
    n = length(x_k);
    m = length(x);
    
    poly = zeros(1, m);
    y_k = f(x_k);
    for i = 1:n
        poly = poly + L_k(x, x_k, x_k(i)) * y_k(i) ;
    end
end

function poly_k = L_k(x, x_k, x_i)
   poly_k = ones(1,length(x));
        for j = 1:length(x_k)
            if x_k(j) ~= x_i
            poly_k = poly_k.*(x - x_k(j)) /  ...
                   (x_i - x_k(j) );
            end 
        end  
end

%% Clamped Cubic Spline
function value = CubicSpline(x, x_k)
    n = length(x_k);
    f_prime = @(x) -2 * (1+x.^2).^-2 .* x;
%     f_prime = @(x) -sin(x);
    
    a = f(x_k);
    FPO = f_prime(x_k(1));% f prime 0
    FPN = f_prime(x_k(n));% f prime n
    
    % step 1
    h(1:n-1) = x_k(2:n) - x_k(1: n-1);
    
    % step 2
    alpha = zeros(1,n);
    alpha(1) = 3*(a(2) - a(1) )/h(1) - 3*FPO;
    alpha(n) = 3*FPN - 3*(a(n) - a(n-1))/h(n-1);
    
    % step 3
    alpha(2:n-1) = 3./h(2:n-1) .* ( a(3:n) - a(2:n-1) ) - ...
        3 ./h(1:n-2) .* (a(2:n-1) - a(1:n-2));
    % which is the vector form.
    
    % step 4
    l = zeros(1, n);
    z = zeros(1, n);
    u = zeros(1, n);
    
    l(1) = 2 * h(1);
    u(1) = 0.5;  
    z(1) = alpha(1)/l(1);
    
    % step 5
    for i = 2:n-1
        l(i) = 2 * (x_k(i+1) - x_k(i-1)) - h(i-1) * u(i-1) ;
        u(i) = h(i)/l(i);
        z(i) = (alpha(i) - h(i-1)*z(i-1) )/l(i);
    end
    
    % step 6
    c = zeros(1,n);
    l(n) = h(n-1) * (2 - u(n-1));
    z(n) = (alpha(n) - h(n-1) * z(n-1)) / l(n);
    c(n) = z(n);
    
    % step 7
    b = zeros(1, n);
    d = zeros(1, n);
    
    for i = fliplr(1:n-1)
        c(i) = z(i) - u(i) * c(i+1);
        b(i) = ( a(i+1) - a(i) )/h(i) - h(i) * (c(i+1) + 2 * c(i) ) /3;
        d(i) = (c(i+1) - c(i))/( 3 * h(i) );
    end
    
    % step 8
    value = zeros(1, length(x));
  
    for i = 1:n-1
        index = (x >= x_k(i) & x < x_k(i+1) ); 
    
        value(index) = a(i) + b(i) * (x(index) - x_k(i)) + c(i) * (x(index) -x_k(i)).^2 + ....
            d(i) * (x(index)- x_k(i)) .^3 ;
    end
            
end
            
    


