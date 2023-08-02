%This is example.m
options=optimset('largescale','off'); 
[x,y]=fmincon('fun1',rand(3,1),[],[],[],[],zeros(3,1),[], ... 
'fun2', options) 