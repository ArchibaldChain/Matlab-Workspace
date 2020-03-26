namelengthmax = 63
whos % returns the existed variable 


% variable type 
single_pi = single(pi) % construct a single type of pi

format long
single_pi  % output all the value of pi

double_pi = double(pi)

integer_14_int16 = int16(14)
integer_14_int32 = int32(14)
integer_14_int64 = int64(14)

integer_14_uint8 = uint8(14)
integer_14_uint16 = uint16(14)

format loose 
format short


% complex number
1 + 1i
1 + 1j

%% randam number

for i = 1:3
    rng(1)
    rand()
    rand()
    rand()
end
% every time will be the same

100*rand() % random number in [0, 100]
randi([1,14]) % random inteager between 1 to 14

%% Two kinds of character variable

Apple_char = 'Apple'
Apple_string = "Apple"

double('a') % ASCII 'a'
char(1:128)

%% logic operation
% < <= == > >= == ~= 

% && ||
3 < 5 && 3 > 2 % return 1
3 < 5 && 3 > 3 % return 0

% xor: i.f.f one of the operation is ture return 1
xor(3<5, 1<0) 
xor(3<4, 1<4)

%%

intmax('int8')
intmax('int16')  %2^16/2-1
intmin('uint8')
intmax('uint8')

int8(-200) %-128
% saturation 饱和

double(3E308) % return Inf
double(-3E308) % -Inf

% do not compre equatlity of two double number
% Instead, comrpre them by using abs difference less than a small number


%% Roiunding and remainder

%fix Round towards zero
%floor ROund towards infinity
%cell Round towards -inf
%round the closest integer
round(pi)
round(pi,2)


%%
sign(Inf) %1
sign(NaN) %0

mod(a,b)
rem(a,b)

%% degree and radin
red2deg(pi)
deg2red(180)

