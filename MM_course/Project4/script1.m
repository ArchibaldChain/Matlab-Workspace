[m,n] = size(data)
data_ = cell(m,1)
for i = 1:m
    data_{i} = table2array(data(i,4:end))
end

s = ones(m,m)
for i = 1:m
    for j = 1:m
        s(i,j) = sum((data_{i}== data_{j}))
    end
end

[x,y] = meshgrid(1:m)
h = pcolor(x,y,s)
set(h, 'LineStyle','none')

