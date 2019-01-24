function [MovementDetection_fun] = movementDisplay_fu(img1,img2)
%% Convert img to Grey
imgGrey1 = rgb2gray(img1);
imgGrey2 = rgb2gray(img2);

%% Substract img
imgDiff = abs(imgGrey1 - imgGrey2);


%% Find the max difference
maxDiff = max(max(imgDiff));
[~, ~] = find(imgDiff == maxDiff);
[~,~] = size(imgDiff);

%% Enlarge contrast
newImg = increaseContrast(5,5,imgDiff);

%% Fill in Regions
imgFilled = bwareaopen(newImg, 150);

%% Overlay onto Original Image
imgBoth = imoverlay(img1, imgFilled, [1,0,0]);

%% Only Care About Things Large Than 80
imageStats = regionprops(imgFilled, 'MajorAxisLength');
imgLengths = [imageStats.MajorAxisLength];
idx = imgLengths > 100;
imageStatsFinal = imageStats(idx);
disp(imageStatsFinal)

%% Determine if Change is Significant

if isempty(imageStatsFinal)
    disp('0');
    MovementDetection_fun = img2;
else 
    disp('1');
    MovementDetection_fun = imgBoth;
end


