file_name = input('input the data: ', 's')
try
    load(file_name)
catch
    fprintf('File not found error\n')
%     file_name = '32x10.mat'
    file_name = '20x30.mat'
    load(file_name)
    
end

disp('press any key to continue\n')
pause

% function resultMatrix = project_script(rKey, cKey)
tic
m = length(rKey);
n = length(cKey);
if m >= n
    row_first = 1
else m < n 
    row_first = 0
end

resultMatrix = -1* ones(m, n);

while ~isempty(find(resultMatrix == -1 ,1))
    if row_first == 1
        
        for i = special_sort(rKey)
            resultMatrix(i,:) = generator(resultMatrix(i,:), rKey{i});
        end
        for i = special_sort(cKey)
            resultMatrix(:,i) = (generator(resultMatrix(:,i)', cKey{i}))';
        end
    elseif row_first == 0
        
        for i = special_sort(cKey)
            resultMatrix(:,i) = (generator(resultMatrix(:,i)', cKey{i}))';
        end
        for i = special_sort(rKey)
            resultMatrix(i,:) = generator(resultMatrix(i,:), rKey{i});
        end

    end
end 
toc
Paint = resultMatrix;
 

% get the order from more information to less
function i_index = special_sort(key)
    temp = zeros(1, length(key));
    for i = 1:length(key)
        temp(i) = sum([key{i}]);
    end
    [sorted, i_index] = sort(temp);
end
   

% end


function newLine = generator(Line, condition)
% line will be -1, 1, 0. 
% -1 for uncertainty, 1 and 0 for certain
% line and condition should be row vector and newLine is a row vector
len_con = length(condition);
len_line = length(Line);

if isequal(Line, -1*ones(1, len_line)) && len_con >= 2* sum(condition)
    newLine = Line;
else 
    newLine = nextConsective(0, 1);
end

function value = nextConsective(line_index, con_index)
    %line_index is the previous last index, which is start from 0
    %con_index is start from 1, the first condition
    if con_index <= len_con

        value = [];
        % for from the leftest to righest (squeeze to the right)
        for i = 0:len_line - line_index - ...
        sum(condition(con_index:end)) - (len_con - con_index)%(len_con - (con_index-1) - 1)
            if con_index > 1 && i == 0
                continue
            end

            newPart = [zeros(1,i), ones(1, condition(con_index))];
            subLine = Line(line_index + 1: line_index + i + condition(con_index));

            if CertainCheck(subLine, newPart) == 0
                continue
            end
            recall = nextConsective(line_index + i + condition(con_index), con_index+1);

            % If every step is skipped, we need give recall a default
            % value.
            if isempty(recall)
                recall = -1 * ones(1, len_line - (line_index+i+condition(con_index) ) );
            end
            temp = [newPart, recall];
%             subLine = Line(line_index + 1: end);
            subLine = Line(line_index + i + condition(con_index)+1: end);
            if CertainCheck(subLine, recall) == 0
                continue
            end           

            if isempty(value)
                value = temp ;
            else
                value = LogOperator(value, temp);
            end
        end
    else
        value = zeros(1, len_line - line_index);
    end
end

function result = CertainCheck(line, vec)

    index = find(line ~= -1);
    result = isequal(vec(index), line(index));
    % 1 if all vec are ok
    % 0 if not ok 
end

function logicalResult = LogOperator(vect1, vect2)
    logicalResult = -1*ones(size(vect1));
    index = find(vect1==vect2 & vect1~= -1);
    logicalResult(index) = vect1(index);

end


end 