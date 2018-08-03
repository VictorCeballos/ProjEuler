%% Clear windows and start timing
clc; clear; close all; addpath(genpath('./helpers/')); tic;

%% Solution

% Keep count
s = 0;

% Count how many days since Monday, 01/01/1900
numDays = 365 + isLeapYear(1900) * 1;

% Loop over the 1st of every month
for year = 1901:2000
    for month = 1:12
                
        % Check if it fell on Sunday (index 6)
        if (mod(numDays,7) == 6)
            s = s + 1;
        end
        
        % Accumulate days
        numDays = numDays + daysOfMonth(month, year);
    end
    
end

%% Print result
time = toc; 
formatSpec = 'Project Euler no.19 = %d.\nIt took %f seconds.\n';
fprintf(formatSpec,s,time)

