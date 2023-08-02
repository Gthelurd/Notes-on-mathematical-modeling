function [alpha,flag]=Armijo(fun,gfun,x,d)
% abs:ʹ��Armijo׼����ݽ��зǾ�ȷ������
% input:����������fun���ݶ�gfun,��ʼ��x,����d
% output:�������alpha

%���ó�ʼ����
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