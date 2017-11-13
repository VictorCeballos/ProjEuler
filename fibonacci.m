function F = fibonacci(n)

% This function returns the nth fibonnaci number

    % Check for right input
    if nargin ~= 1
        error('fibonacci:argChk', 'Wrong number of inputs.')
    elseif ~( isscalar(n) && n>0 && ~mod(n,1) )
       error('fibonacci:argChk', 'Input should be a positive integer.')
    end
    
    % Compute Fibonacci
    F = ( 1/sqrt(5) ) .* ( ((1+sqrt(5))/2).^n - ((1-sqrt(5))/2).^n );
    F = round(F); 
    
end