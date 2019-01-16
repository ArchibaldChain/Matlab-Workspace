N = 1000;
vid = videoinput('winvideo',1,'YUY2_640x480');
filename = 'test_audio';
 writerObj = VideoWriter( [filename '.avi'] );
 writerObj.FrameRate = N;
 open(writerObj);
 
 figure;
 for ii = 1: N
     frame = getsnapshot(vid);
     imshow(frame);
     f.cdata = frame;
     f.colormap = [];
     writeVideo(writerObj,f);
end
