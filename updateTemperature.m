function updatedPlate = updateTemperature(plate);
%{
This function will  accept the current temperature matrix as an input. It
will find the average of the current (yet-to-be-updated) temperatures of
its four neighboring points. This will be done by having a copy of the
array with the same boundary points. It will update the copy matrix as the loop
continues and average the points of the original matrix. 
%}
%creating the copy array since it is a nxn matrix, we will only get the
%rowindex as the main value. However, if this is used on an array that is
%not nxn then throw an error function daying that it needs to be the same
[rowNum, colNum] = size(plate);
if rowNum ~= colNum
    msg = 'This function can only be used on a n by n array.';
    error(msg)
else if rowNum==2
        msg = ['This function updates the interior points of the plate.' ...
            'Since this matrix is a 2 by 2, there are no interior points to update.'];
        error(msg)
else
    updatedPlate = zeros(rowNum,colNum);

    for i=1:rowNum
        for j=1:colNum 
            if i==1                 %copying top boarder
                updatedPlate(i,j) = plate(i,j);
            else if j==colNum            %copy right boarder
                updatedPlate(i,j) = plate(i,j);
            else if i==rowNum           %copy bottom boarder
                    updatedPlate(i,j) = plate(i,j);
            else if j==1            %copy left boarder
                    updatedPlate(i,j) = plate(i,j);
            end
            end
            end
            end
        end
    end
    %I will be averaging the points
    for i=2:rowNum-1
        for j=2:colNum-1
            top = plate(i+1,j);
            bot = plate(i-1,j);
            left = plate(i,j-1);
            right = plate(i,j+1);
            average = (top+bot+left+right)/4;
            updatedPlate(i,j) = average;
        end
    end
    updatedPlate;
end
end
end
