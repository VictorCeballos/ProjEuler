%% Clear windows and start timing
clc; clear; close all; addpath(genpath('./helpers/')); tic;

%% Constants for the problem
N = 10;

%% 
s = 0;

sums = f(N, 0);

for k = 1:length(sums)
    sum = sums{k};
    [a,b] = histc(sum, unique(sum));
    y = a(b);
    if all(y <= 2)
        s = s + 1;
    end
end

%% Print result
time = toc; 
formatSpec = 'Project Euler no.169 = %d.\nIt took %f seconds.\n';
fprintf(formatSpec,s,time)

%%
function sums = f(N, i)

    sums = {};

    while true

        if (2^i == N)
            sum = [2^i];
            sums{end+1} = sum;
            break;
        elseif (2^i > N/2)
            break;
        end
        
        prevs = f(N - 2^i, i);
        for k = 1:length(prevs)
            prevs{k} = [2^i, prevs{k}];
        end
        sums = {sums{:}, prevs{:}};

        i = i + 1;

    end

    sums = sums';
    
end