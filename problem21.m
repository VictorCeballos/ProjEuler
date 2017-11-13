%% Clear windows and start timing
clc; close all; clear all; tic;

%% Constants for the problem
limit = 10000;

%% For each number, accumulate it and its pair if it's an amicable pair
s = 0;
for a = 2:limit
    
    b = sum(divisors(a));
    if (b > a && sum(divisors(b)) == a)
        s = s + a + b;
    end
    
end

%% Print result
time = toc; 
formatSpec = 'Project Euler no.21 = %d.\nIt took %f seconds.\n';
fprintf(formatSpec,s,time)