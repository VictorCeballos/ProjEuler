function b = is_abundant(n)

% This function checks whether the given positive integer n is an abundant 
% number.

    % Check for right input
    if nargin ~= 1
        error('is_abundant:argChk', 'Wrong number of inputs.')
    elseif (n<=0)
       error('is_abundant:argChk', 'Input should be positive integer.')
    end

    % Check for abundance
    b = n < sum(divisors(n));

end
