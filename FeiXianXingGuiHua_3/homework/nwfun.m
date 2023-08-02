function [x,val,iter,flag] = nwfun(fun,gfun,Hess,x0)
%abs:使用Newton法求解无约束优化问题
%input:目标函数fun,梯度函数gfun,黑塞矩阵Hess，初始点x0
%output:最优解x,最优值val,迭代次数iter

%设置初始参数
k_max=5000; %最大迭代次数
k=0; epsilon=1e-5;
xk=x0;
while(k < k_max)
    gk=gfun(xk); %计算梯度
    Gk=Hess(xk);
    dk=-Gk\gk; %计算搜索方向
    if(norm(dk) < epsilon) flag=1; break; end
    xk=xk+dk;
    k=k+1;
end
x=xk;
val=fun(xk);
iter=k;
end
