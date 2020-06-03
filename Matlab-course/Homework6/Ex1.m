

function rootValues = quadraticSolver(a,b,c)
    delta = b.^2 - 4 * a *c;
    if delta < 0
        r = 0;
    else if delta = 0
        r = 1;
    else
        r = 2;
    end
    rootCondition = uint8(r);

    if rootConditon = 2
        rootValues[1] = (-b +sqrt(delta)) / 2/2
        rootValues[2] = (-b -sqrt(delta)) / 2/2
    else if rootCondition = 1
        rootValues[1] = (-b -sqrt(delta)) / 2/2
        rootValues[2] = (-b -sqrt(delta)) / 2/2
    else 
        rootValues = 'complex roots'     
end

%% Assignment 2

function whatLeft, count =  divideBySeven(number)
    r = number/7
    count = 1
    while( r > 1)
        r/7
        count = count + 1
    end
    whatLeft = r
end    

%% Assingment 3

function totalTax, effectiveTaxRate = incomeTax(income)
    a = 9225 * 0.1
    b = (34750 - 9225) * 0.15
    c = - (37450 - 90750) * 0.25
    d = - (90750 - 189300) * 0.28
    e = - (189300 - 411500) * 0.33
    f = (413200 - 411500) * 0.35
    if income < 9225
        tax = income * 0.1 
    elseif income < 37450
        tax = (income - 9225) * 0.15 + a
    elseif income < 90750
        tax = (income - 37450) * 0.25 + b + a
    elseif income < 189300
        tax = (income - 90750) * 0.28 + c + b + a
    elseif income < 411500
        tax = (income - 189300) * 0.33 + d + c + b + a
    elseif income < 413200
        tax = (income - 411500) * 0.35 + e + d + c + b + a
    else
        tax = (income - 41300) * 39.6 + f + e + d + c + b + a
    end
    totalTax = tax
    effectiveTaxRate = tax/income
end

%% ASS 4
function [terms, relError] = sequenceToSqrt2(N)
    x = 1
    for i = 1:N
        x = 1/2 * (x + 2/x)
    end
    terms = x
    relError = abs(sqrt(2)-x) /sqrt(2)

end

%% Ass 5
function [lastTerm, numTerms] = sqrt2approx(errorTol)
    relError = @(x) abs(sqrt(2)-x) /sqrt(2)
    x = 1
    numTerms = 1
    while(relError(x) > errorTol)
        x = 1/2 * (x + 2/x)
        numTerms = numTerms + 1
    end
    lastTerm = x
end

%% Ass 6
function seriesSums = maclaurinCosine(x,N)
    y = ones(N, 1)
    temp = 1
    for i = 2:N
        y(i) =  temp
        temp = temp + (-1)^(i+1) * x^i / factorial(i)
    end
end

%% Ass 7
function fib fibGenerator(N)
    fib = uint32(ones(1,N))
    for i = 3:N
        fib(i) = fib(i-1) + fib(i-2)
    end 

end
%% Ass 9
function [GoldenRatio, lastFib, numTerms] = fibGenerator(tolGR) 
    E = @(F1,F2,F3 ) abs(double(F2)/double(F1) - double(F3)/double(F2))
    fib1 = uint32(1)
    fib2 = uint32(1)
    temp = fib1 + fib2
    numTerms = uint8(3)
    while(E(fib1, fib2, temp)>tolGR)
        fib1 = fib2
        fib2 = temp
        temp = fib1 + fib2
        numTerms = numTErms +1
    end
    GoldenRatio = E(fib1,fib2,temp)
    lastFib = temp
end 


%% ass 10
function count = signChangeCounter(numberList)
    count = 0
    for i = 2:length(numberList)
        count = count + x
    end
end 

funciton x = isChageSign(a,b)
    x = a*b <= 0? 1:0
end

%% 
function [primesInInterval, numberPrimes] = primeFinder(interval) 
    numberPrimes = 0
    for i = interval(1):interval(2)
        if isPrime(i)
        primesInInterval[end+1] = i
        numberPrimes = numberPrimes + 1
        end
    end
    function y = isPrime(n)
        for i = 2:round(sqrt(i))
            if mod(n,i) == 0
            y = false
            break
            end
        end
        if (isempty(y))
            y = true
        end
    end
end

%%
function [missedByOrMadeBy, points] = fieldGoal(yardLine, v0, theta0)
    g = 32.2
    y = @(x) x * tan(theta0) - 1/2 *x^2*g/(v0 cos(theta0))
    x = yardLine + 17 * 3;

function [missedBy, percentPassed] = toleranceCheck(boltMeasurements)
    count = 0
    for i = 1: length(boltMeasurements)
        if boltMeasurements(i) > 0.51
            count  = count +1
            missedBy(count) = boltMeasurements(i) - 0.51
        elseif boltMeasurements(i) < 0.49
            count  = count +1
            missedBy(count) = 0.49 - boltMeasurements(i)
        end
    end
    percentPassed = 1 - count / length(boltMeasurements)
end