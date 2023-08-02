function [x,val,iter,flag] = Newton(fun,gfun,Hess,x0)
%abs: Newton's method for unconstrained optimization problems
%input: objective function fun, gradient function gfun, Hessian matrix Hess, initial point x0
%output: optimal solution x, optimal value val, number of iterations iter
% Set initial parameters
k_max=5000; % maximum number of iterations
k=0; epsilon=1e-5;
xk=x0;
while(k < k_max)
    gk=gfun(xk); % compute gradient
    Gk=Hess(xk);
    dk=-Gk\gk; % compute search direction
    if(norm(dk) < epsilon) flag=1; break; end
    xk=xk+dk;
    k=k+1;
end
x=xk;
val=fun(xk);
iter=k;
end

%% Define the objective function
%fun = @(x) x(1)^2 + x(2)^2;

%% Define the gradient function
%gfun = @(x) [2*x(1); 2*x(2)];

%% Define the Hessian matrix
%Hess = @(x) [2, 0; 0, 2];

%% Set the initial point
%x0 = [1; 1];

%% Call the nwfun function
%[x, val, iter, flag] = nwfun(fun, gfun, Hess, x0);

%% Display the results
%disp(['Optimal point: x = ', num2str(x')]);
%disp(['Optimal value: f(x) = ', num2str(val)]);
%disp(['Number of iterations: ', num2str(iter)]);

%%An example
%f=-1/(x(1)^2+x(2)^2+2); 
%df=[2*x(1)/(x(1)^2+x(2)^2+2)^2;2*x(2)/(x(1)^2+x(2)^2+2)^2]; 
%d2f=[2/(x(1)^2+x(2)^2+2)^2-(8*x(1)^2)/(x(1)^2+x(2)^2+2)^3,-8*x(1)*x(2)/(x(1)^2+x(2)^2+2)^3; -8*x(1)*x(2)/(x(1)^2+x(2)^2+2)^3,2/(x(1)^2+x(2)^2+2)^2-(8*x(2)^2)/(x(1)^2+x(2)^2+2)^3];
%[x,fval,iter,exflag]=nwfun(f,df,d2f,[4;0]);