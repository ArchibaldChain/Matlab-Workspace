function area - calcarea(radius)
    global g; % produce chaos that could 
    print(area)

function num = posnum
% Prompt user and error-check until the
%  user enters a positive number
 
num = input('Enter a positive number: ');
while num < 0
    errorsubfn(num)
    num = input('Enter a positive number: ');
end
end

function errorsubfn(num)
% Fill this in
    num = num + 1
end