function yo = SpeechSynthesis1(N, s, fs, fsl)
yo = zeros(1, length(s));
for i = 1:N
    [b, a]=butter(4, [200+6800/N*(i-1) 200+6800/N*i]/(fs/2));
    y = filter(b, a, s); %带通滤波
    [bl, al] = butter(4, fsl/(fs/2));
    ye = filter(bl, al, abs(y')); %正弦包络
    %x = 0:2*pi/length(ye):2*pi-2*pi/length(ye);
    x = 0:length(ye)-1;
    ysin = sin((200+6800/N*(2*i-1)/2)*2*pi.*x/fs);
    yo = yo+ye.*ysin;
end
yo = yo*norm(s)/norm(yo);