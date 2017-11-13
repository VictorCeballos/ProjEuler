function decompositions = coins(n)

% This function returns a D-by-8 matrix, corresponding to the D possible
% decompositions of n pence into the current coins. Each entry indicates
% the number of coins of the corresponding value.
% NOTE: run createTable(1,n) first!!

    global T

    coin_values = [1 2 5 10 20 50 100 200];
    number_diff_coins = length(coin_values);

    if (n==0)

        decompositions = zeros(1,number_diff_coins);
        return;

    elseif all(T{n}==0)

        decompositions = zeros(1,number_diff_coins);

        if (n==1)
            decompositions(1,:) = [1 0 0 0 0 0 0 0];

        elseif (n==2)
            decompositions(1,:) = [2 0 0 0 0 0 0 0];
            decompositions(2,:) = [0 1 0 0 0 0 0 0];

        else
            for k=1:number_diff_coins
                coin_k = coin_values(k);
                if coin_k <= n
                    m = n - coin_k;
                    sub_decompositions = coins(m);

                    for l=1:size(sub_decompositions,1)
                        coin_contribution = zeros(1,number_diff_coins);
                        coin_contribution(k) = 1;
                        decompositions = [ decompositions; ...
                            sub_decompositions(l,:)+coin_contribution ];
                    end

                end
            end
            decompositions = decompositions(2:end,:);
        end

        decompositions = unique(decompositions,'rows');
        T{n} = decompositions;

    else
        decompositions = T{n};

    end

end
                
                
                
                