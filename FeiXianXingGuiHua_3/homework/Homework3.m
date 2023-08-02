% Monte Carlo simulation
n = 3800; 
lb = 39*ones(1,3);
ub = 99*ones(1, 3); 
sol = []; 
fval = 11300;
for i = 1:n
    x = floor(lb + (ub - lb + 1).*rand(1, 3)); % generate random possible roots
    if Confun33(x) == 1 % constain security
        z = Objfun33(x); % cauculate the func
        if z < fval % update the max z
            fval = z;
            sol = x;
        end
    end
end
sol
fval