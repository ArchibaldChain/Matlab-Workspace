h = figure(1);

for i = 1:100
    bar(10*rand(1, 10));

     F(i) = getframe(h);
end


videowriter(F, 'video_sample.avi', 'compression', 'None');

% ���ߣ�out_of_nothing 
% ��Դ��CSDN 
% ԭ�ģ�https://blog.csdn.net/out_of_nothing/article/details/78356922 
% ��Ȩ����������Ϊ����ԭ�����£�ת���븽�ϲ������ӣ�