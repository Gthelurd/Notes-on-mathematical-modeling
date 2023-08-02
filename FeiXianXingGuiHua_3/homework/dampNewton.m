function [x,val,iter,flag] = dampNewton(fun,gfun,Hess,x0)
%Need Armijo.m to function
%abs:使用阻尼Newton法求解无约束优化问题
%input:目标函数fun,梯度函数gfun,黑塞矩阵Hess，初始点x0
%output:最优解x,最优值val,迭代次数iter，flag表示是否在最大迭代次数内终止

%设置初始参数
k_max=5000; %最大迭代次数
k=0; epsilon=1e-5;
xk=x0;
while(k < k_max)
    gk=gfun(xk); %计算梯度
    Gk=Hess(xk);
    dk=-Gk\gk; %计算搜索方向
    if(norm(dk) < epsilon) flag=1; break; end
    [alpha,] = Armijo(fun,gfun,xk,dk)
    xk=xk+alpha*dk;
    k=k+1;
end
x=xk;
val=fun(xk);
iter=k;
end
