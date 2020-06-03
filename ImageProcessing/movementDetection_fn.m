function [mf] = movementDetection_fn(img1, img2)
%% Convert img to Grey
imgGrey1 = rgb2gray(img1);
imgGrey2 = rgb2gray(img2);

%% Substract img
imgDiff = abs(imgGrey1 - imgGrey2);

%% Enlarge contrast
newImg = increaseContrast(5,5,imgDiff);

%% Fill in Regions
imgFilled = bwareaopen(newImg, 150);

%% Only Care About Things Large Than 80
imageStats = regionprops(imgFilled, 'MajorAxisLength');
imgLengths = [imageStats.MajorAxisLength];
idx = imgLengths > 80;
imageStatsFinal = imageStats(idx);
%disp(imageStatsFinal)

%% Determine if Change is Significant

if isempty(imageStatsFinal)
   
    disp('0');
    mf = img2;
else 
    disp('1');
    imgBoth = imoverlay(img2, findObject(imgFilled), [1,0,0]);
    mf = imgBoth;
end

%% find Object
function fu = findObject(img)
%% find the derivative
    m = size(img,1);
    n = size(img,2);
    row = sum(img);
    col = sum(img, 2);
    dev_row = 1/n * (row(2:end) - row(1:end-1));
    dev_col = 1/m * (col(2:end) - col(1:end-1)); 
%% find the max and second max 
    [maxn, secondmax] = findPeak(dev_row);
    left = find(dev_row == maxn);
    right = find(dev_row == secondmax);
    if ~isscalar(left)
        left = min(left);
    end
    if ~isscalar(right)
        right = max(right);
    end
    if left > right
        temp = left;   
        left = right;
        right = temp;
    end
   
    [maxn, secondmax] = findPeak(dev_col);
    up = find(dev_col == secondmax);
    down = find(dev_col == maxn);
    if ~isscalar(up)
        up = min(up);
    end
    if ~isscalar(down)
        down = max(down);
    end
    if up > down 
        temp = down;   
        down = up;
        up = temp;
    end
   
    
%% Return Value
    fu = zeros(m, n);
    fu(up:down, left) = ones(down - up +1, 1);
    fu(up:down, right) = ones(down - up + 1, 1);
    fu(up, left:right) = ones(1, right - left + 1);
    fu(down, left:right) = ones(1, right - left + 1);
    
end

function [maxpeak, secMaxPeak] = findPeak(x)
    y = findpeaks(x);
    [a] = sort(y);
    maxpeak = a(end);
    secMaxPeak = a(end - 1);
end

end

imwrite(