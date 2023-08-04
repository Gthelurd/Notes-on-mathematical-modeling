A = [15, 18, 21, 24;
     19, 23, 22, 18;
     26, 17, 16, 19;
     19, 21, 23, 17];
x = [0, 0, 0, 0];
min_val = inf;

for i = 1:4
    for j = 1:4
        if i ~= j
            for k = 1:4
                if k ~= i && k ~= j
                    for l = 1:4
                        if l ~= i && l ~= j && l ~= k
                            sum_val = A(1, i) + A(2, j) + A(3, k) + A(4, l);
                            if min_val >= sum_val
                                x = [i, j, k, l];
                                min_val = sum_val;
                            end
                        end
                    end
                end
            end
        end
    end
end

disp(x);
disp(min_val);
        