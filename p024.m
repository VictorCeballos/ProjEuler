%% Clear windows and start timing
clc; clear; close all; addpath(genpath('./helpers/')); tic;

%% Constants for the problem
objs = 0:9;
N = size(objs, 2);
n = 999999;

%% First compute indices, then take them in order from objects

indx = zeros(1,N);
for i = 1:N
    f = factorial(N-i);
    indx(i) = floor(n / f);
    n = mod(n, f);
end

s = zeros(1,N);
for i = 1:N
    o = objs(indx(i)+1);
    objs(indx(i)+1) = [];
    s(i) = o;
end

%% Print result
time = toc; 
formatSpec = 'Project Euler no.24 = %s.\nIt took %f seconds.\n';
fprintf(formatSpec,mat2str(s),time)

