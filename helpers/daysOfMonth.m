function days = daysOfMonth(month, year)

    if (month == 9 || month == 4 || month == 6 || month == 11)
        days = 30;
    elseif (month == 2)
        if ~isLeapYear(year)
            days = 28;
        else
            days = 29;
        end
    else
        days = 31;
    end
        
end