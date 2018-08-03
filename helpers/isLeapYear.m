function out = isLeapYear(year)

    if (mod(year, 400) == 0)
        out = true;
    elseif (mod(year, 100) == 0)
        out = false;
    elseif (mod(year, 4) == 0)
        out = true;
    else
        out = false;
    end

end