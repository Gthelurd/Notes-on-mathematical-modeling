function [x,val,LOOS_t] = c_gradientDescent(func,gfunc,x0,iterate)
%c_gradientDescent - a way to apply Newton's method (variable step size) or so called the gradient descent algorithm 
% func is to define the function  func
% Syntax: [R,LOOS_t] = c_gradientDescent(func,gfunc,x0)
% gfunc is to func's gradient  function gfunc
% x0 is the initial point  
% iterate is the maximum iteration  
% The output  x  will contain the optimal point,  
% val  will contain the optimal value,   
% LOOS_t  will contain the history of function values during the iteration process. 
    maxk=iterate;
    LOOS_t=zeros(1,maxk);
    rho=0.5;Sigma=0.3;
    k=0;epsilon=1e-5;

    while k<maxk
        g=gfunc(x0);
        d=-g;

        if norm(d)<epsilon
            break;
        end
        m=0;mk=0;
        while m<20
            if func(x0+rho^m*d)<func(x0)+Sigma*rho^m*g'*d
                mk=m;
                break;
            end
            m=m+1;
        end     
        x0=x0+rho^mk*d;
        k=k+1;
        LOOS_t(1,k)=func(x0);
%         disp(x0);
    end
    x=x0;
    val=func(x0);
end


%% Define the objective function
%func = @(x) x^2;

%% Define the gradient of the objective function
%gfunc = @(x) 2*x;

%% Set the initial guess for the optimization
%x0 = 1;

%% Set the maximum number of iterations
%iterate = 100;

%% Call the c_gradientDescent function
%[x, val, LOOS_t] = c_gradientDescent(func, gfunc, x0, iterate);

%% Display the results
%disp(['Optimal point: x = ', num2str(x)]);
%disp(['Optimal value: f(x) = ', num2str(val)]);
%disp('Iteration process:');
%disp(LOOS_t);

%% An example
%func = @(x) -1/(x(1)^2 + x(2)^2 + 2);
%gfunc = @(x) [2*x(1)/(x(1)^2 + x(2)^2 + 2)^2; 2*x(2)/(x(1)^2 + x(2)^2 + 2)^2];
%x0 = [4; 0];
%iterate = 50;
%[x, val, LOOS_t] = c_gradientDescent(func, gfunc, x0, iterate);
