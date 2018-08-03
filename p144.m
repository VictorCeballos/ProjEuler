%% Clear windows and start timing
clc; clear; close all; addpath(genpath('./helpers/')); tic;

%% Constants for the problem
x_old = 0;   y_old = 10.1; 
x_new = 1.4; y_new = -9.6;

%% For each bounce, compute direction vector D, normal vector to ellipse N
%  and reflected vector R.

s = 0;

while ( x_new<-0.01 || x_new>0.01 || y_new<0 )
    
    % Direction vector
    D = [x_new-x_old, y_new-y_old];
    D = D/norm(D);
    
    % Normal vector to ellipse
    N = [-4*x_new/y_new, -1];
    N = N/norm(N);
    
    % Reflected vector
    R = D - ( (2.*dot(D,N)).* N );
    R = R/norm(R);
    
    % y=mx+n is the line containing the refelcted vector
    m = R(2)./R(1);
    n = y_new-m.*x_new;

    % Update last point of reflection
    x_old = x_new; y_old = y_new;
    
    % Compute intersection between ellipse and y=mx+n
    sol1 = ((-1*m*n)+2*sqrt(25*m^2-n^2+100))/(4+m^2);
    sol2 = ((-1*m*n)-2*sqrt(25*m^2-n^2+100))/(4+m^2);
    
    % Update new point of reflection
    if (abs(sol1 - x_new) > abs(sol2 - x_new))
        x_new = sol1;
    else
        x_new = sol2;
    end
    y_new = m*x_new + n;
    
    % Update counter
    s = s + 1; 
    
end


%% Print result
time = toc; 
formatSpec = 'Project Euler no.144 = %d.\nIt took %f seconds.\n';
fprintf(formatSpec,s,time)
    
    
    
