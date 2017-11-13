%% Clear windows and start timing
clc; close all; clear all; tic;

%% Constants for the problem
N = 15;

%% First compute the probability p. Then p*x<1 gives x = floor(1/p).
p = 0;
for b=N:-1:1
    r = N-b;
    if (b>r)
        C = nchoosek(1:N,r);
        p = p + sum(prod(C,2),1);
    end
end
p = p / factorial(N+1);
s = floor(1/p);

%% Print result
time = toc; 
formatSpec = 'Project Euler no.121 = %d.\nIt took %f seconds.\n';
fprintf(formatSpec,s,time)

