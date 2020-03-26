%% ------------Matrix and vector---------------

%% matrix laboratory

x = linspace(3,9,7)
y = logspace(3,9,7)

v = 3:9
v([3 1 3 3 2 5])
v(end)
v(2:end - 1)
v([3, 4, end])

%% conlumn vector
% ' prime conjugate transpose

%% Matrix
randi([1,10], 3,4)
zeros(3,4)
ones(3,5)
eye(3)

v = 1:3
diag(v)

diag(v, -1)

M = randi([1,10],3,4)
M(1,1)
M(2,:)
M(2)
M(3)

size(M) % return [row conlumn]
length(v) 

[n,m] = size(M)

numel(M) %number of Element

zeros(size(M))

