%% char

Apple_char = 'Apple'
class(Apple_char)
Apple_string = "Apple"
class(Apple_string)
size(Apple_char)
double(Apple_char)

Apple_char'

%%
size(Apple_string)

Apple_string{1}(1)
string_vect{1} = Apple_string
string_vect{2} = "abcd"
string_vect{1} 

majors_string = ["ab","cd","ef"];
majors_char = ['English', 'History', 'Engineering']
majors_char = char('English', 'History', 'Engineering')
string(majors_char)

"str1"+"str2"
['str1', 'str2']



['']
[""]
isempty("")
isempty('')

repmat('ab',4,5)
['space' blanks(15) 'Cowboy']
%%
% x = input('Enter a sentence: ','s')
% display(x(1))
% display(x(end))

strcat("a", "b")

a = "_____________Hello________________"
strip(a, '_')
b = 'sfs xxxxxxxxxxxxxxxxxxxxd'
erase(b, 'x')

[a,b] = strtok("fsf_sdf_sdf", "_")

strcmpi("hi", "Hi")
[D, M, Y] = sperateDate()
function [D,M,Y] = sperateDate()
    s = date();
    [D, M] = strtok(s, "-")
    
    M = M(2:end)
    [M,Y] = strtok(M, "-")
    Y = Y(2:end)
end
