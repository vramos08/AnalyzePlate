function [avgTemp, maxChangePoint] = analyzePlate(initialPlate, plate);
%{
This calculates the average temperature of the plate. The function also
identifies the index of the point with the highest temperature change
between the first and last iteration. To do this, I will be comparing the
absolute difference between the two plates and keeping track of the max
value. 
%}
%first I will be finding the average temperature
avgTemp = 0;
total=0;
[rowNum, colNum] = size(plate);

for i=1:rowNum
    for j=1:colNum
        total = total + plate(i,j);
    end
end
avgTemp = total/(rowNum*colNum);

%now I will be finding the maximum change point by saving the maximum
%difference and keeping track of the point.
maxDiff = 0;
saveI=0;
saveJ=0;

% This loop check the absolute difference and saves the currentDifference as
%the max difference if it is bigger than the current maxDifference. This
%keeps track of the first biggest difference.
for i=1:rowNum
    for j=1:colNum
        currentDifference = abs(plate(i,j)-initialPlate(i,j));
        if currentDifference > maxDiff
            maxDiff = currentDifference;
            saveI = i;
            saveJ = j;
        end
    end
end
maxChangePoint(1,1) = saveI;
maxChangePoint(1,2) = saveJ;
maxChangePoint;
end
