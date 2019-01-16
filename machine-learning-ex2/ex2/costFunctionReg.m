function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples
n = length(theta); %number of feature

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

h = sigmoid(X * theta);
a = y .* log(h) + (1-y) .* log(1-h);
th = [0; theta(2:n)]; % remove the first number of theta 
          % which is the parameter of the number "1"
J = - 1/m * sum(a) + 1/(2*m) * lambda * sum(th.^2);
Error = h - y;
% grad(1) = 1/m * (X(:,1)' * Error(1));
% grad(2:n) = 1/m * ( X(:,2:n)' * Error(2:n) ) + lambda*(1/m)*th;
grad = 1/m * ( X' * Error ) + lambda*(1/m)*th;

% =============================================================

end
