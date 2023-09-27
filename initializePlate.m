function plate = initializePlate(n);
%making an array out of n and setting them to 25
plate = 25*ones(n,n);

% checking the size of the plate input, if it is one or zero 
% throw an error message
% then make the top be 100, bottom 50, left 0, abd right 75
if n<2
    msg = 'Input a higher number.';
    error(msg)
else if n==2            %this will make each side have a different value
        plate(1,1) = 100;
        plate(1,2) = 75;
        plate(2,1) = 0;
        plate(2,2) = 50;
else
    for i=1:n
        for j=1:n 
            if i==1                 %top boarder
                plate(i,j) = 100;
            else if j==n            %right boarder
                    plate(i,j) = 75;
            else if i==n            %bottom boarder
                    plate(i,j) = 50;
            else if j==1            %left boarder
                    plate(i,j) = 0;
            end
            end
            end
            end
        end
    end
end
end

%this part of the code takes the average of the adjacent points for the
%four corners. This will be done by checking if the loop is at a corner and
%and getting the values of the corners near it. 
%doesnt work for 2 will need its own statement becuase it will update the
%corners creating an odd average. This way it will have its own average
%with the corners taken into account
if n == 2         
    corner1 = (100+50)/2;
    corner2 = (75+0)/2;
    plate(1,1) = corner2;
    plate(2,2) = corner2;
    plate(1,2) = corner1;
    plate(2,1) = corner1;
else if n>2       %this will avoid the ones and other numbers smaller
        for i=1:n
            for j=1:n
                if i==1 && j==1      %this is the top left
                    average = (plate(1,2) + plate(2,1))/2;
                    plate(i,j) = average;
                else if i==1 && j==n     %this is the top right
                        average = (plate(1,n-1) + plate(2,n))/2;
                        plate(i,j) = average;
                else if i==n && j==1     %this is the bottom left
                        average = (plate(n,2) + plate(n-1,1))/2;
                        plate(i,j) = average;
                else if i==n && j==n      %this is the bottom right
                        average = (plate(n-1,n) + plate(n,n-1))/2;
                        plate(i,j) = average;
                end
                end
                end
                end
            end
        end
end
plate;
end
