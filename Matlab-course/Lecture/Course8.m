%% week 8

inputnum = input('Enter a positive number:');
while inputnum >= 0
    fpirntf('You entered a %f\n', inputnum)
    inputnum = input('Enter a positive number:')''
end

fprintf('ok') 

% prompting the user for negative numbers until the user enters a non-negative
% the script print the average.
% If no negative are postive

sum = 0
i = 1
in = input('');
sum = sum + in;
    
while(in < 0)
    in = input('');
    sum = sum + in;
    i++
end

if sum >= 0 
    fprintf('Error');
end
fprintf('%f\n', (sum-in)/(i-1));

%%  running time 
tic 
v= rand(3000, 1)
v = 3* v
toc

%%
myvec = sqrt(0:0.5:3);

newmat = sign(mat);