tic
load('20x30.mat');
% rKey = {[1,1];2;1}';cKey = {2;2;1}';
% rKey = {4;0;5;0;3}';
% cKey = {1;[1,1];[1,1,1];[1,1,1];[1,1,1]}';

r = length(rKey); c = length(cKey);
rCountNow = zeros(1,r); cCountNow = zeros(1,c);
pNow = zeros(r,c)-1;

rM = cell(1,r); cM = cell(1,c);

%第一次行排序
rWant = zeros(1,r);
for i = 1:r
    rWant(i) = sum(rKey{1,i})+length(rKey{1,i})-1;
end
[rSorted,rIndex] = sort(rWant,'descend');

for i = 1:r
    if rWant(rIndex(i)) == c
        pNow(rIndex(i),:) = rFill(c,rIndex(i),rKey);
        rCountNow(1,rIndex(i)) = 1;
    end
end

%第一次列排序
cWant = zeros(1,c);
for i = 1:c
    cWant(i) = sum(cKey{1,i})+length(cKey{1,i})-1;
end
[cSorted,cIndex] = sort(cWant,'descend');

for i = 1:c
    if cWant(cIndex(i)) == r
        pNow(:,cIndex(i)) = rFill(r,cIndex(i),cKey)';
        cCountNow(1,cIndex(i)) = 1;
    end
end

%判断是否完成及输出
while isMember(0,rCountNow)
    %while ismember(-1,pNow)
    for i = 1:r
        %     if ismember(-1,pNow(rIndex(i),:))
        %         pNow(rIndex(i),:) = FillChoice(pNow',c,rIndex(i),rKey,rWant);
        %     end
        if rCountNow(rIndex(i)) == 0
            
            [pNow(rIndex(i),:),m1] = FillChoice(pNow',c,rIndex(i),rKey,rWant,rM{1,rIndex(i)});
            
            rM{1,rIndex(i)} = m1;
            
            if ~isMember(-1,pNow(rIndex(i),:))
                rCountNow(rIndex(i)) = 1;
                rM{1,rIndex(i)} = [];
            end
        end
    end
    
    if isMember(-1,cCountNow)
        for i = 1:c
            if cCountNow == 0
                
                [p,m2] = FillChoice(pNow,r,cIndex(i),cKey,cWant,cM{1,cIndex(i)});
                pNow(:,cIndex(i)) = p';
                
                cM{1,cIndex(i)} = m2;
                
                if ~isMember(-1,pNow(:,cIndex(i)))
                    cCountNow(cIndex(i)) = 1;
                    cM{1,cIndex(i)} = [];
                end
            end
        end
    end
end
disp(pNow)
toc


%在已知一些数前提下
function [p,m] = FillChoice(m0,r,I,Key,Want,requireM)
distance = r - Want(I); blank = length(Key{1,I}) + distance; p = zeros(1,r) - 1;
if distance ~= 0
    num = nChoosek(blank, distance);
    m = zeros(num,r) - 1;
    q = reRange(blank,distance);
    
    if isempty(requireM)
        %填充可能结果
        for i = 1:num
            countM = 1; countKey = 1;
            
            for j = 1:blank
                if countKey<= length(Key{1,I}) && countM+Key{1,I}(countKey) <= r && countKey <= length(Key{1,I})
                    if q(i,j) == 1
                        m(i,countM:countM-1+Key{1,I}(countKey)) = 1;
                        countM = countM+Key{1,I}(countKey);
                        if countM <= r
                            m(i,countM) = 0;
                            
                        end
                    else
                        m(i,countM) = 0;
                        countM = countM+1;
                    end
                    countKey = countKey+1;
                    
                end
            end
            
        end
        
        
    else
        [num,col] = size(requireM);
        m = requireM;
        
    end
    
    [num,m] = deletUseless(r,m,m0,I,num);
    
    %取并集
    for i = 1:r
        j = 2; rCount = 1;
        while rCount < num && m(j,i) == m(1,i)
            rCount = rCount + 1;
            j = j + 1;
        end
        if rCount == num
            p(i) = m(1,i);
        end
    end
    
end
end


%删除错误行_在列排序的时候
function [s,m] = deletUseless(r,m,m0,I,num)
for i = 1:r
    if m0(i,I) ~= -1
        for j = 1:num
            if m(j,i) ~= m0(i,I);
                m(j,:) = NaN;
            end
        end
    end
end
m = m(all(~isnan(m),2),:);
[s,t] = size(m);
end

%填满一行
function p = rFill(c,I,rKey)
count = 0; p = zeros(1,c);
for k = 1:length(rKey{1,I})
    if count < c
        for j = 1:rKey{1,I}(k)
            p(1, j+count) = 1;
        end
        count = count + rKey{1,I}(k) + 1;
    end
end
end

%返回具体组合的形式
% function b = reRange(blank,distance)
%      a = zeros(1,blank);
%      for i = 1:distance
%          a(i) = 1;
%      end
%      b = unique(perms(a),'rows');
% end

function m = reRange(blank,distance)
ST = dbstack;
nRecursiveStack = sum(strcmp({ST.file},ST(1).file))
blank
distance
if distance == 0
    m = zeros(1,blank)+1;
elseif distance == blank
    m = zeros(1,blank);
else
    num = nChoosek(blank,distance);
    M = zeros(num,blank) - 1;
    m1 = reRange(blank-1,distance-1);
    m2 = reRange(blank-1,distance);
    [r1,c1] = size(m1)
    [r2,c2] = size(m2)
    for i = 1:r1
        M(i,1) = 0;
        for j = 2:blank
            M(i,j) = m1(i,j-1);
        end
    end
    for i = r1+1:r1+r2
        M(i,1) = 1;
        for j = 2:blank
            M(i,j) = m2(i-r1,j-1);
        end
    end
    m = M;
end
end

function p = nChoosek(n,k)
if k > n/2
    k = n - k;
end
p=1;
for i = 1:k
    p = (n+1-i)/(k+1-i)*p;
end
end

function a = isMember(c,d)
a = false;l = length(d);
for i =1:l
    if d(i) == c
        a = true;
    end
end
end






