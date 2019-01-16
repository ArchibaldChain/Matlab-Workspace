function J = costFunction(X,Y,theta)

% x is the "design matrix" contains our training examples
% y is the class label

m = size(X,1); % number of training examples and "sizw(x,1) means the row of the x"
predictions = X * theta; %prediction of  hypothesis on all m examples
sqrErrors = (predictions - y).^2; % squared Errors
J = 1/(2*m) * sum(sqrErrors);
end