%% Clear windows and start timing
clc; clear; close all; addpath(genpath('./helpers/')); tic;

%% Constants for the problem
N = 1000;

%% For each possible value of the perimeter p, and for each pair (a,b)
%  use Pitagoras theorem to compute c and check whether p=a+b+c.

number_of_solns = zeros(1,N);
for p=1:N
    for a=1:p
        for b=1:p
            c=sqrt(a*a+b*b);
            if a+b+c==p
                number_of_solns(p) = number_of_solns(p) + 1;
            end
        end
    end
end
number_of_solns = number_of_solns ./ 2;
[~, s] = max(number_of_solns);

%% Print result
time = toc; 
formatSpec = 'Project Euler no.39 = %d.\nIt took %f seconds.\n';
fprintf(formatSpec,s,time)


