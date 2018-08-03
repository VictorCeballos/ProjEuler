%% Clear windows and start timing
clc; clear; close all; addpath(genpath('./helpers/')); tic;

%% Constants for the problem
r = 25;

%%
s = 0;
for c=1:r
    
    % n is number at (r,c)
    n = r*(r-1)/2 + c;
    % if n is prime 
    if isprime(n)
       
       % get number of primes among its immediate neighbours
       ns = odd_neighbours(r,c);
       ps = ns(isprime(ns));
       C = length(ps);
       
       % if 2 or more immediate prime neighbours, n belongs to a triplet
       if (C>=2)
           s = s + n;
           
       % if 1 immediate prime neighbours
       elseif (C==1)
           m = ps(1);
           if (m>n)
               r1 = r+1;
           else
               r1 = r-1;
           end
           c1 = m - r1*(r1-1)/2;
           ms = odd_neighbours(r1,c1);
           D = sum(isprime(ms));
           if (D>=2)
               s = s + n;
           end
       end
       
       
    end
end

%% Print result
time = toc; 
formatSpec = 'Project Euler no.196 = %d.\nIt took %f seconds.\n';
fprintf(formatSpec,s,time)

%% This helper function returns the odd neighbours of the ODD number at (r,c)
function ns = odd_neighbours( r, c )

    if c==1
        ns = zeros(1,2);
        if mod(r,2)==0
            ns(1) = number_at( r-1, c+1 );
            ns(2) = number_at( r+1,   c );
        else
            ns(1) = number_at( r-1,   c );
            ns(2) = number_at( r+1, c+1 );
        end   
        
    elseif c==r
        ns = zeros(1,2);
        if mod(r,2)==0
            ns(1) = number_at( r-1, c-1 );
            ns(2) = number_at( r+1,   c );
        else
            ns(1) = number_at( r+1, c-1 );
            ns(2) = number_at( r+1, c+1 );
        end
        
    else
        ns = zeros(1,3);
        if mod(r,2)==0
            ns(1) = number_at( r-1, c-1 );
            ns(2) = number_at( r-1, c+1 );
            ns(3) = number_at( r+1, c   );
        else
            ns(1) = number_at( r-1,   c );
            ns(2) = number_at( r+1, c-1 );
            ns(3) = number_at( r+1, c+1 );
        end
        
    end

end

%% This helper function returns the number at (r,c)
function n = number_at(r,c)  
    n = r*(r-1)/2 + c;
end

