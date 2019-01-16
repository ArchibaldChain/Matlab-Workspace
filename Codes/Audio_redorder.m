h = figure(1);

for i = 1:100
    bar(10*rand(1, 10));

     F(i) = getframe(h);
end


videowriter(F, 'video_sample.avi', 'compression', 'None');

% 作者：out_of_nothing 
% 来源：CSDN 
% 原文：https://blog.csdn.net/out_of_nothing/article/details/78356922 
% 版权声明：本文为博主原创文章，转载请附上博文链接！