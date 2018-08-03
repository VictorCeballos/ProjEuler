%% Clear windows and start timing
clc; clear; close all; addpath(genpath('./helpers/')); tic;

%% Constants for the problem
limit = 10000;

%% For each number, count it if it is irrational and it has an odd period
s = 0;
for N = 2:limit
    
    % Build the period
    a0 = floor(sqrt(N));
    if (a0*a0 == N)
        continue;
    end
    m0 = 1;
    d0 = 1;
    k0 = a0;
    r0 = sqrt(N) - a0;
    
    % Accumulate
    i = 2;
    as = [a0];
    ms = [m0];
    ds = [d0];
    ks = [k0];
    rs = [r0];
        
    while true
                
        % Build the period
        ai = floor( ds(i-1) ./ (ms(i-1) * sqrt(N) - ks(i-1)) );
        mi = ms(i-1) * ds(i-1);
        di = ms(i-1) * ms(i-1) * N - ks(i-1) * ks(i-1);
        ki = - ks(i-1) * ds(i-1) + ai * di;
        d = double(gcd(sym([mi, ki, di])));
        mi = mi / d;
        di = di / d;
        ki = ki / d;
        ri = (mi * sqrt(N) - ki) / di;
        
        % Accumulate
        i = i + 1;
        as = [as, ai];
        ms = [ms, mi];
        ds = [ds, di];
        ks = [ks, ki];
        rs = [rs, ri];
                        
        % Look for periodicity
        if (any(rs(1:end-1) == ri))
            break;
        end
            
    end

    % Check if odd period
    if mod(size(as,2)-1, 2) == 1
        s = s + 1;
    end

end

%% Print result
time = toc;
formatSpec = 'Project Euler no.64 = %d.\nIt took %f seconds.\n';
fprintf(formatSpec,s,time)
