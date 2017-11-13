%% Clear windows and start timing
clc; close all; clear all; tic;

%% Does not work. Finds a different solution, which I believe is right?

N = 1070379110497;
%N = 10.^12;
b = N;

while (1)
    d = 2*b*b-2*b+1;
    if (d>0)
        d = sqrt(d);
        a1 = (1+d)/2;
        a2 = (1-d)/2;
        if 0<a1 && a1<N && mod(a1,1)==0
            break;
        elseif 0<a2 && a2<N && mod(a2,1)==0 
            break;
        end
    end
    b = b+1;
end


%% Print result
time = toc; s = a1;
formatSpec = 'Project Euler no.100 = %s.\nIt took %f seconds.\n';
fprintf(formatSpec,s,time)

