%% �������Թ滮����
x0 = [0 0 0 0 0 0];  % ��ʼֵ
lb = -pi/6*ones(6,1);
ub = pi/6*ones(6,1);
[x,fval] = fmincon(@Objfun41,x0,[],[],[],[],lb,ub,@Confun41)
x = x * 180 / pi    % ������ת��Ϊ����
