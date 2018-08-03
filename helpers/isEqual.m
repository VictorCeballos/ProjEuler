function out = isEqual(A, B, tol)

    out = all(abs(A - B) <= tol);

end