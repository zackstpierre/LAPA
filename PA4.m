%PA4
%Zachary St. Pierre
%101094217

%-------------------------------------------------------------------------%
clc;
clear;
close all;
%-------------------------------------------------------------------------%

N = 1000; %num of iterations

delta_n = 100; % number of divisions of plane

%boundary values

boundary_top = 0;
boundary_right = 1;
boundary_bottom = 0;
boundary_left = 1;

%make array of size m * n

field_points = zeros(delta_n, delta_n);
field_points_prev = zeros(delta_n, delta_n);
%initialize boundary conditions

field_points(:,1) = boundary_left;
field_points(:,delta_n) = boundary_right;
field_points(1,:) = boundary_top;
field_points(delta_n,:) = boundary_bottom;

iterations = 0;

while iterations < N

    field_points_prev = field_points;

    for i = 2:1:delta_n-1 %inside x dimensions
        for j = 2:1:delta_n-1 %inside y dimensions
            field_points(i,j) = (field_points(i+1,j) + field_points(i-1,j) + field_points(i,j+1) + field_points(i,j-1))/4;
        end
    end

    iterations = iterations +1;

    surf(field_points);

    [Field_X , Field_Y] = gradient(field_points);
    
    
    quiver(Field_X,Field_Y)

    pause(0.01)

end
    





    

