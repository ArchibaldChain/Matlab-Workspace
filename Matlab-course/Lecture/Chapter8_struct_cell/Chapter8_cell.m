%% cell 元胞

zeros(3,4)

cellrowvec = {23,'a', 1:2:10, "hello"}
cell2 = cellrowvec(2)
cell = cellrowvec{2}

cellmat = {23,'a'; 1:2:10, "hello"}
cellmat{2,1}(2)

cellrowvec{2} = 1
cellrowvec(2) = {'a'}
cellrowvec(2) = []

cvnames_char = {'a', 'b', 'c'}
cvnames = strjoin{cvnames_char,'-'};
strsplit(cvnames)

cvnames_char_modified = [cvnames_char 123]
iscellstr(cvnames_char_modified)


function Practiced_8dot1(inputCell)
    TotalNumElement = numel(inputCell)
    randIndex = randi(TotalNumElement)
    disp(inputCell{randIndex})
    % One step expression
    disp(inputCell{randi(numel(inputCell))})
end