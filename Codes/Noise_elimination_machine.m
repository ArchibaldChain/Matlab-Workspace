recObj = audiorecorder;
load chirp.mat;
disp('Pause to Start.')
pause;
for i = 0:10^4 
    recordblocking(recObj, 0.05);
%     play(recObj);
    y = getaudiodata(recObj);
    sound(-10*y,Fs);
end

disp('End');
pause;
