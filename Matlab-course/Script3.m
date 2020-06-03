boltMeasurements = 0.5+0.005*randn(500,1);
[missedBy, percentPassed] = toleranceCheck(boltMeasurements)


function [missedBy, percentPassed] = toleranceCheck(boltMeasurements)
%enter commands for the function here
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