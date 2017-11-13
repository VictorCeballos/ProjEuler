N = 50;
k = 20;
q = N;
while (1)

    a = nchoosek(1:N, k);
    a = 1-a/q;
    b = nchoosek(N:-1:1, k);
    b = b/q;
    p = sum(prod(a,2).*prod(b,2),1);
    if (p==2/100)
        break;
    end
    q = q + 1;
    
end


