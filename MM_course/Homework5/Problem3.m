x1 = [0 1 2 3 4 5 6 7]
y1 = [2 8 24 56 110 192 308 464]

x2 = [0 1 2 3 4 5 6 7]
y2 = [23 48 73 98 123 148 173 198]

x3 = [0 1 2 3 4 5 6 7]
y3 = [7 15 33 61 99 147 205 273]

x4 = [0 1 2 3 4 5 6 7]
y4 = [1 4.5 20 90 403 1808 8103 36316]

M = d_d_table(x4,y4)

function M = d_d_table(x,y)
M = zeros(length(x));
M(1,:) = y
for i = 2:length(x)
    for j = 1:length(x) - i + 1
        x(i)- x(i+j-1)
        M(i,j) = (M(i-1,j) - M(i-1,j+1)) /(x(j)- x(i+j-1))
        if j~= 1 && M(i,j) == 0 && M(i,j-1) == 0 
            break;
        end
    end
    if sum(M(i,:) ~= 0) == 0
        break;
    end
end
end