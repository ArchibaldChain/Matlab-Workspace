function newContrast = increaseContrast(maxNum, minNum, img)

    %% Judge wheter the parameter in range
    if maxNum > 255 || minNum < 0 || maxNum < 0 || maxNum > 255
        newContrast = img;
        return
    end
    
    if maxNum < minNum
        temp = maxNum;
        maxNum = minNum;
        minNum = temp;
    end
    remove(maxNum,minNum, img);

    %% Calculate the change function
    k = 255 / (maxNum - minNum);
    b = -minNum;
    newContrast = round(k * (img + b));

   
end

function r = remove(a, b, matrix)
    %% Remove others larger than 255 and  smaller than 0
    for i = 1:size(matrix, 1)
        for j = 1:size(matrix, 2)
            if matrix(i,j) > a
               matrix(i,j) = 255;
            end
            if matrix(i,j) < b
                matrix(i,j) = 0;
            end
        end
    end
    r = matrix;
end