%This is Objective3.m
function result = Objective3(x)
    result = 100*(x(2) - x(1)^2)^2 + (1 - x(1))^2;
end