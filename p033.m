%% Clear windows and start timing
clc; clear; close all; addpath(genpath('./helpers/')); tic;

%% For each possible triplet of digits, compute the possible numerators
%  and denominators, and for each such pair, check for desired conditions.

p = 1;
for a=1:9
    for b=1:9
        for c=1:9
            
            pairs = zeros(4,2);
            
            pairs(1,1) = a*10+b;   pairs(1,2) = a*10+c;
            pairs(2,1) = a*10+b;   pairs(2,2) = c*10+a;
            pairs(3,1) = b*10+a;   pairs(3,2) = a*10+c;          
            pairs(4,1) = b*10+a;   pairs(4,2) = c*10+a;
            
            for k=1:4
                num = pairs(k,1);
                den = pairs(k,2);
                if (num<den && num/den==b/c)
                    p = p * b/c;
                end
            end
            
        end
    end
end

%% Print result
time = toc; s = rats(p);
formatSpec = 'Project Euler no.33 = %s.\nIt took %f seconds.\n';
fprintf(formatSpec,s,time)


