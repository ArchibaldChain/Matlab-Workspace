
% number sequence for rows
rKey = {...
[1 2],...
[2 2],...
[5],...
[4],...
[1]};

% number sequence for columns
cKey = { ...
[4],...
[3],...
[3],...
[4],...
[3]};

m=length(rKey);
n=length(cKey);
global saverow
global savecolumn
global ansrow
global anscolumn
ansrow={};
anscolumn={};
C = (-1)*ones(m,n);
for i=1:m
saverow{i}=generation_row(n,rKey{i});
end
for i=1:n
savecolumn{i}=generation_column(m,cKey{i});
end
while ~isempty(find(C == -1 ,1))
    for i=1:m
        [pos1,pos0]=mustfill(saverow{i},length(saverow{i}),C(i,:));
        
        C(i,pos0)=0;
        C(i,pos1)=1;
        
    end
    for i=1:n
        for j = 1:length(savecolumn)
            savecolumn{j} = savecolumn{j}'
        end 
        [pos11,pos00]=mustfill((savecolumn{i}),length(savecolumn{i}), C(:,i)');
        C(pos00,i)=0;
        C(pos11,i)=1;
    end
    C
end

function [pos1,pos0]=mustfill(save,j, vector)
pos1=[];
pos0=[];
B=[];
if j>1
    for i=1:j
        if Check(vector, save{i}) == 0
            continue
        end
        B(i,:) = save{i};
    end
    B=sum(B);
else
    B = save{1};
end
pos0=find(B==0)
pos1=find(B==j)
end

function result = Check(line, vec)

    index = find(line ~= -1);
    result = isequal(vec(index), line(index));

end


        
function an=generation_row(leng,need)
    an={};
    if(isempty(need))
        an{1}=zeros(leng);
    else
        hh=zeros(1,leng);
        global gh
        gh={};
        itr(hh,leng,1,1,need);
        an=gh;
    end
end

function an=generation_column(leng,need)
    an={};
    if(isempty(need))
        an{1}=zeros(leng);
    else
        hh=zeros(leng,1);
        global gh
        gh={};
        itr(hh,leng,1,1,need);
        an=gh;
    end
end

function an=itr(hh,leng,head,step,need)
    global gh
    if(step==length(need)+1)
        gh = [gh,hh];
    else
        m=0;
        for i=step:length(need)
            m=m+need(i)+1;
        end
        m=m-1;
        top = leng - head + 1 - m;
        for i=0:top
            for j = 0:need(step)-1
                hh(head+i+j)=1;
            end
            itr(hh,leng,head+1+i+need(step),step+1,need);
            for j = 0:need(step)-1
                hh(head+i+j)=0;
            end
        end
    end
end