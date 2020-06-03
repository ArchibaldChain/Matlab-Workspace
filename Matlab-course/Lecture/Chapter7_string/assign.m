A = [3 -2; 2 4]; 
b = [5; -2];
linearSystem = matrixInterpreter(A, b)


function [linearSystem] = matrixInterpreter(A, b)
%Enter the commands for your function here. Be sure to assign values 
%to the output variable linearSystem defined in the function command on line 1.
for i = 1:2
        t = [str(A(i,1)), 'x']
    if A(i,2) >= 0
        temp(i, :) = [t , '+', char(string(A(i,2))) , 'y']
    else
        temp(i, :) = [t , char(string(A(i,2))) , 'y']
    end
end
linearSystem = {[temp(1,:), '=',str(b(1))];[temp(2,:),'=', str(b(2))]}
function s = str(A)
    s =  char(string(A))
end
end