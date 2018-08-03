function divs = divisors(n)

% This function returns the list of proper divisors of a given positive
% integer n.

    % Check for right input
    if nargin ~= 1
        error('divisors:argChk', 'Wrong number of inputs.')
    elseif ~( isscalar(n) && n>0 && ~mod(n,1) )
        error('divisors:argChk', 'Input should be a positive integer.')
    end

    % Compute the proper divisors of n.
    divs = [1];    
    k = sqrt(n);
    
    for i=2:floor(k)
        if mod(n,i)==0
            if i == k
                divs = [divs,i];
            else
                divs = [divs,i,n/i];
            end
        end
    end

    % Sort the obtain divisors.
    divs = sort(divs);

end

