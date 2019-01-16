recObj = audiorecorder;
disp('Start speaking.')
recordblocking(recObj, 3);
disp('End of Recording.');
pause;

play(recObj);
y = getaudiodata(recObj);
load chirp.mat;
pause;
sound(y, Fs);
plot(y);