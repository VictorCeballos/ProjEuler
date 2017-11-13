function T = tribonacci(n)

% This function returns the nth fibonnaci number. Note that here we are
% asuming that T(1) = T(2) = T(3) = 1.
% For a different initialization, change the values of r,s,t.
% http://mathforum.org/library/drmath/view/51576.html

    % Check for right input
    if nargin ~= 1
        error('tribonacci:argChk', 'Wrong number of inputs.')
    elseif ~( isscalar(n) && n>0 && ~mod(n,1) )
       error('tribonacci:argChk', 'Input should be a positive integer.')
    end
    
    % Compute Tribonacci
    a = 1/3*(1+(19-3*sqrt(33))^(1/3)+(19+3*sqrt(33))^(1/3));
    b = 1/3-1/6*(1-i*sqrt(3))*(19-3*sqrt(33))^(1/3)-1/6*(1+i*sqrt(3))*(19+3*sqrt(33))^(1/3);
    c = 1/3-1/6*(1+i*sqrt(3))*(19-3*sqrt(33))^(1/3)-1/6*(1-i*sqrt(3))*(19+3*sqrt(33))^(1/3);
    r = 1/33*(-11+(847-33*sqrt(33))^(1/3)+(11*(77+3*sqrt(33)))^(1/3));
    s = -1/3-1/66*(1-i*sqrt(3))*(847-33*sqrt(33))^(1/3)-((1+i*sqrt(3))*(77+3*sqrt(33))^(1/3))/(6*11^(2/3));
    t = -1/3-1/66*(1+i*sqrt(3))*(847-33*sqrt(33))^(1/3)-((1-i*sqrt(3))*(77+3*sqrt(33))^(1/3))/(6*11^(2/3));
    T = r * a^n + s * b^n + t * c^n;
    T = round(T); 
    
end


