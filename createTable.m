function createTable(n,m)

% This function creates a n-by-m cell of 0s into a global variable T.
% Useful for functions that recompute the same value many times,
% and storing/looking up in a table reduces time of computation.

    global T

    T = cell(n,m);
    for i=1:n
        for j=1:m
            T{i,i} = 0;
        end
    end

end
