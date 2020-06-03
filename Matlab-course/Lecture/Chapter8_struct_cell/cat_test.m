A=[...
3,2;...
3,3;...
3,2;...
2,1;...
3,2];
valueset = [1:3];
catnames = { ' child',' adult','senior'};
B = categorical(A, valueset, catnames, 'Ordinal' , true)


weight = [3,2,3]

table(catnames, weight)

names = {'Harry' ,'Sally',' Jose'};
weights =[ 185;133;210];
heights = [74;65.4;72.2];
patients = table(weights , heights, 'RowNames' , names )
