function [alpha,flag]=Armijo(fun,gfun,x,d)
% abs:使用Armijo准则回溯进行非精确线搜索
% input:待搜索函数fun，梯度gfun,初始点x,方向d
% output:搜索结果alpha

%设置初始参数
rho=10e-3;
alpha=1;beta=0.5;
m=0;m_max=20;flag=0;
while (m < m_max )
    flag=(feval(fun,x+alpha*d) <= feval(fun,x)+ rho*alpha*feval(gfun,x)'*d);
    if flag == 1
        break;
    end
    m=m+1;
    alpha=alpha*beta;
end