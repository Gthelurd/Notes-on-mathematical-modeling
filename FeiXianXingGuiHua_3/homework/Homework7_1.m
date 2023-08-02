hold on

 h=1.8;d=4.5;D=19;c=1.1;H=5;n=18;

 x0=tan(2*10*pi/360);

 k=h+d*tan(2*10*pi/360)-c;

   x1=(H-c+d*x0)/(x0+tan(2*30*pi/360));

   for i=x1:0.1:D

y0=h*i/(i^2-k^2-i^2*(tan(2*i*pi/360))^2+2*k*i*x0+k*h-k*h*(tan(2*i*pi/360))^2);

y=atand(y0);

     plot(i,y,'+r');

   end
 xlabel('i'),ylabel('¦Á')

 