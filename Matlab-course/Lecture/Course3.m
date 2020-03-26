M = randi([1,9],[3,4])
reshape(M, 2,6)

diag(1:5) + diag(2:2:8,1)

flip(M)% flip M top to down
rot90(M) % rotate M counter-clock

A = [1 2; 3 4]
repmat(A, 2, 3)

B = [nan(4,1),eye(4)]

%%%%%%%%% Tensor %%%%%%%%%%%%%%
T(:,:,1) = M
T(:,:,2) = ones(size(M)) % three dimensions

S = randi([0, 10], 5,4,3,2) % four dimensions

%%%%%%%%% function %%%%%%%%%%%%%%%
B = randi([-4,4],1,4)
abs(B)

min(B)

cumprod(B) % cumulative product / running product
cumsum(B) % cumulative sum / running sum
cummax(B) % cumulative maximum
cummin(B) % cumulative minimum 

sum(M) % sum of the every column
min(M) % min of the every column

min(min(M)) % min of the matrix

diff([1,3,4]) % diff from next element to previous one


%%%%%%%%%%%%%% logic function %%%%%%%%%%%%%
A = randi([-3,3],1,3)
A>0
A(A>0)

find(A > 0)

rng(0)
V = randi([0,1], [1,1000]);
V(1:10)
% We want to find the element of 1 whose previous is 0
diff(V(1:10))


%%%%%%%%%% vector operator %%%%%%%%%%%%%
V1 = 1:3
V2 = 1:3
cross(V1,V2)
V1*V2'  % inner product

M.^2.5 % ???????

find(M == 1)  % we will get a find a index
[I, J] = ind2sub(size(M), find(M == 1)) % convert index to subscript

%%%%%%%%%%%% Chapter 3 %%%%%%%%%%%%%%%%%%%%%%%%

% top-down design
% calculate the input radius
% [1] get the input
% [2] calculate
% [3]
% [3.1]
area = 5^2 *pi
disp(area);   % the output from the matlab
disp(['the area of the disc is ' area]); % output the 'the area of the disc is N'

disp(['the area of the disc is ' num2str(area)]); % output the 'the area of the disc is ####'
fprintf('the area of the disc %f \n',area)

%% A/B % A*inv(B)
%% A\B % inv(A) * B