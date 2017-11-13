%% Clear windows and start timing
clc; close all; clear all; tic;

%% Constants for the problem
limit = 20161;

%% Create a list of abundant numbers
abns = [];
for n=1:limit
    if is_abundant(n)
        abns = [abns,n];
    end  
end

%% Compute the list of sums of two abundant numbers
k = length(abns);
sum_of_abns = zeros(k,k);
for i=1:k
    for j=1:k
        sum_of_abns(i,j) = abns(i) + abns(j);
    end
end
sum_of_abns = unique(sum_of_abns);

%% Check whether each number is in the list of sums of abundant numbers
s=0;
for n=1:limit
    if ~any(n==sum_of_abns)
        s = s+n;
    end
end

%% Print result
time = toc; 
formatSpec = 'Project Euler no.23 = %d.\nIt took %f seconds.\n';
fprintf(formatSpec,s,time)

