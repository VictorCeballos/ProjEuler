%% Clear windows and start timing
clc; close all; clear all; tic;

%% Constants for the problem
N = 5;

%% Brute force. Didn't want to spend time in involving the limit.

limit = N * 9.^N;
s=0;
for a=0:9
    for b=0:9
        for c=0:9
            for d=0:9
                for e=0:9
                    for f=0:9
                        x = a+10*b+100*c+1000*d+10000*e+100000*f;
                        y = a^N+b^N+c^N+d^N+e^N+f^N;
                        if (x==y)
                            s = s + x;
                        end
                    end
                end
            end
        end
    end
end
s = s-1;

%% Print result
time = toc; 
formatSpec = 'Project Euler no.30 = %d.\nIt took %f seconds.\n';
fprintf(formatSpec,s,time)

