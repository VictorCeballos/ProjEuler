%% Clear windows and start timing
clc; close all; clear all; tic;

%% Constants for the problem
N = 100;

%% Construct the list of different powers
M = zeros(N-1,N-1);
for a=2:N
    for b=2:N
        M(a-1,b-1) = a.^b;
    end
end
M = unique(M);

%% Result will be just the length of the constructed list
s = length(M);

%% Print result
time = toc; 
formatSpec = 'Project Euler no.29 = %d.\nIt took %f seconds.\n';
fprintf(formatSpec,s,time)

