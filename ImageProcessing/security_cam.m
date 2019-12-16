function security_cam()
clear; close all; imaqreset;

%% Set up Image Aquisition
hCamera = webcam;

hShow = imshow(zeros(480, 640, 3, 'uint8')); 
title ('Security Camera');

%% Acquire reference image
ref_vid_img = snapshot(hCamera);
%%
% 
%  Here we made a test
% 

%% Quantize images and Outputing to the screen
frames = 2000;
for i = 1: frames
    vid_img = snapshot(hCamera);
    object_detected = movementDetection_fn(ref_vid_img, vid_img);
 %   object_detected = movementDisplay_fu(ref_vid_img, vid_img);
    set(hShow, 'CData', object_detected);
    drawnow;
    
end

clear hShow;
