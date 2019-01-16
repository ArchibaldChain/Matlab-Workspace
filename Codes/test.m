[s fs]=audioread('C:\Users\Archibald Chain\Documents\Tencent Files\1274565902\FileRecv\C_01_01.wav');
r=1000000;
k=1000;
z=1000;
t=1000;
u=abs(fftshift(fft(s)));
for j=64:-1:20
for i=1:1000
    y0=SpeechSynthesis1(j,s,fs,i);
    if abs(sum(abs(fftshift(fft(y0)))-u'))<r & abs(sum(y0-s'))<k & abs(var(abs(fftshift(fft(y0)))-u'))<z & abs(var(y0-s'))<t
        bestFrequency=i;
        bestN=j;
        r=abs(sum(fftshift(fft(y0))-u'));
        k=abs(sum(y0-s'));
        z=abs(var(fftshift(fft(y0))-u'));
        t=abs(var(y0-s'));
end
end
disp(j);
end
