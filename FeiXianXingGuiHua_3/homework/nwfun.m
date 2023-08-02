function [x,val,iter,flag] = nwfun(fun,gfun,Hess,x0)
%abs:ʹ��Newton�������Լ���Ż�����
%input:Ŀ�꺯��fun,�ݶȺ���gfun,��������Hess����ʼ��x0
%output:���Ž�x,����ֵval,��������iter

%���ó�ʼ����
k_max=5000; %����������
k=0; epsilon=1e-5;
xk=x0;
while(k < k_max)
    gk=gfun(xk); %�����ݶ�
    Gk=Hess(xk);
    dk=-Gk\gk; %������������
    if(norm(dk) < epsilon) flag=1; break; end
    xk=xk+dk;
    k=k+1;
end
x=xk;
val=fun(xk);
iter=k;
end
