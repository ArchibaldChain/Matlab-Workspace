
MonthlyPaymentTable = repmat(blanks(72), 20,1)
title = 'Monthly Payment Table'
l = length(title) -  1

MonthlyPaymentTable(1, 25:25+l) = title
tablel_head = char('Interest Rate','5 Year Term', '10 Year Term', '20 Year Term')
l = length(tablel_head) -1
MonthlyPaymentTable(3, 1:1+l) = tablel_head(1,:)
MonthlyPaymentTable(3, 20:20+l) = tablel_head(2,:)
MonthlyPaymentTable(3, 40:40+l) = tablel_head(3,:)
MonthlyPaymentTable(3, 60:60+l) = tablel_head(4,:)

yearRate = (4:0.125:6)/100
years = [5,10,20]
monthRate = yearRate/12
P = 100000
for k = 1:length(monthRate)
    disp(k)
    i = monthRate(k)
    str = sprintf('%5.3f%%', yearRate(k) *100)
    l = length(str) - 1
    MonthlyPaymentTable(3+k, 5:5+l) = str

    for j = 1:length(years)
        n = 12 * years(j)
        A = i*P*(1+i)^n/((1+i)^n - 1)
        str = sprintf('$%7.2f', A)
        l = length(str) - 1
        MonthlyPaymentTable(3+k, j*20+2: j*20+2 + l) = str
    end
end

