num=input('please input the number of vehicles:');
a1=0;b2=0;c3=0;
max=0;
for i=0:4
   for j=0:4
       for k=0:4
      x1=i;x2=j;x3=k;
      if(x1+x2+x3==num)
          switch x1 
              case 0 
                  a1=0;
              case 1
                  a1=3;
              case 2
                  a1=5;
              case 3
                  a1=6;
              case 4
                  a1=6;
              case 5
                  a1=6;
              case 6
                  a1=5;
              otherwise
          end
          switch x2 
              case 0 
                  b2=0;
              case 1
                  b2=4;
              case 2
                  b2=6;
              case 3
                  b2=7;
              case 4
                  b2=8;
              case 5
                  b2=9;
              case 6
                  b2=10;
              otherwise
          end
              switch x3 
              case 0 
                  c3=0;
              case 1
                  c3=2;
              case 2
                  c3=5;
              case 3
                  c3=9;
              case 4
                  c3=8;
              case 5
                  c3=8;
              case 6
                  c3=7;
              otherwise
              end
              if max<=a1+b2+c3
                  max=a1+b2+c3;
                  disp(x1);
                  disp(x2);
                  disp(x3);
                  disp(max);
                  disp('Over');
              end
      end
       end
   end
end
%��1�����ɷ����豸��Ϊ4ʱ�����յõ����ž���Ϊ��0,1,3����1�ֳ��������豸��2�ֳ�����1���豸��3�ֳ�����3���豸���õ����Ž�Ϊ13��Ԫ
%��2�����ɷ����豸��Ϊ5ʱ�����յõ����ž���Ϊ��1,1,3����1�ֳ�����1̨�豸��2�ֳ�����1̨�豸��3�ֳ�����3���豸���õ����Ž�Ϊ16��Ԫ
%��3�����ɷ����豸��Ϊ6ʱ�����յõ����ž���Ϊ��1,2,3�����ߣ�2,1,3����1�ֳ�����1̨�豸��2�ֳ�����2̨�豸��3�ֳ�����3���豸����1�ֳ�����2̨�豸��2�ֳ�����1̨�豸��3�ֳ�����3���豸���õ����Ž�Ϊ18��Ԫ
