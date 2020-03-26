%% plot
plot(1:0.1:10,sin(1:0.1:10), 1:0.1:10,cos(1:0.1:10))

% read from line
% written to file
% append to file

mymat = rand(2,3)
save testfile.dat mymat -ascii

mymat2 = rand(4,3)
save testfile.dat mymat2 -ascii % cover the origin data

mymat3 = rand(5,3)
save testfile.dat mymat3 -ascii -append % add to the end

type testfile.dat
%prompt the user for the number

% load testfile.dat

%% function 
function outputArgument = calcarea(rad)
    area = pi * rad ^2
end

