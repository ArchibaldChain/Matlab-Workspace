img1 = imread('Image1.jpg');
img1 = rgb2gray(img1);
[m,n] = size(img1)
deconding_img = zeros(m,n);
for i = 1:m
    for j = 1:n
        temp = 0;
        for x = 1:m
            for y = 1:n
                temp = temp+img1(x,y)*exp(-2*pi*i*(i*x/m+j*y/n));
            end
        end
        deconding_img(i,j) = temp;
    end
end

imwrite(deconding_img, 'deconding_img.jpg')