function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; 
hold on;
% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

% for i = 1:size(X,1)
%     if y(i) == 1
%         plot(X(i,1),X(i,2),'r+');
%     else
%         plot(X(i,1),X(i,2),'bo');
%     end
% end

% Find Indices of Positive and Negative Examples
pos = find(y==1); neg = find(y == 0);
% Plot Examples
plot(X(pos, 1), X(pos, 2), 'r+');
plot(X(neg, 1), X(neg, 2), 'bo');


% =========================================================================



hold off;

end
