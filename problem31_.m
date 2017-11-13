%% Clear windows and start timing
clc; close all; clear all; tic;

%% Constants for the problem
N = 50;

%% Create a table where to store the results for the sub-problems.
createTable(1,N);

%% Call the function for this problem.
c = coins(N);
s = size(c,1);

%% Print result
time = toc; 
formatSpec = 'Project Euler no.31 = %d.\nIt took %f seconds.\n';
fprintf(formatSpec,s,time)

