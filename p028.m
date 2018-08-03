%% Clear windows and start timing
clc; clear; close all; addpath(genpath('./helpers/')); tic;

%% Constants for the problem
N = 1001;

%% Create the spiral matrix
M = zeros(N,N); 
mid = ceil(N/2); i=mid; j=mid;
M(i,j)=1;
n=2; k=0; m=1; 
while n<N*N
    
    if mod(k,4)==0
        for l=1:m
            j=j+1;
            M(i,j)=n;
            n=n+1;
        end
        k = k+1;
        
    elseif mod(k,4)==1
        for l=1:m
            i=i+1;
            M(i,j)=n;
            n=n+1;
        end
        k = k+1;
        m = m+1;
        
    elseif mod(k,4)==2
        for l=1:m
            j=j-1;
            M(i,j)=n;
            n=n+1;
        end
        k = k+1;
        
    elseif mod(k,4)==3
        for l=1:m
            i=i-1;
            M(i,j)=n;
            n=n+1;
        end
        k = k+1;
        m = m+1;

    end  
end

M=M(1:N,1:N);

%% Compute the sum of the main diagonals
s = sum(diag(M))+sum(diag(rot90(M)))-1;

%% Print result
time = toc; 
formatSpec = 'Project Euler no.28 = %d.\nIt took %f seconds.\n';
fprintf(formatSpec,s,time)
   
