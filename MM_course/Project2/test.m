data=xlsread('hubei.xlsx');

%2.8data
E=70438;
I=23638;
R=1439;
dead=780;
D=24881;
S=(57237727-E-I-R-D-dead)*0.05;
Q=(57237727-E-I-R-D-dead)*0.95;
SandQ=(57237727-E-I-R-D-dead);
N=57237727-dead;

b1=0.000155637728223*1.0e+03;
b2=0.000134638477735*1.0e+03;
delta=0.000195844267935*1.0e+03;
sigma=0.000022249328513*1.0e+03;
epe=0.000121436541080*1.0e+03;
epi=-0.000215801832382*1.0e+03;
gamai=0.000049610349472*1.0e+03;
gamad= 0.000067480571006*1.0e+03;
dd=   0.000066733554517*1.0e+03; 



s=[];
e=[];
i=[];
d=[];
r=[];
de=[];
n=[];
s=[s,S];
e=[e,E];
i=[i,I];
d=[d,D];
r=[r,R];
de=[de,dead];

for j=1:12
%SandQn=SandQ-b1*S*E/N-b2*S*I/N+delta*E;
Sn=S-b1*S*E/(N)-b2*S*I/(N)+delta*E;
En=E+b1*S*E/N+b2*S*I/N-sigma*E-delta*E-epe*E;
In=I+sigma*E-gamai*I-epi*I;
Dn=D+epe*E+epi*I-dd*D-gamad*D;
Rn=R+gamai*I+gamad*D;
Nn=S/0.05+E+I+R+D;
dead=dead+dd*D;
%S=SandQ*0.05;

%SandQ=SandQn;
S=Sn;
E=En;
I=In;
D=Dn;
R=Rn;
N=Nn;

s=[s,S];
e=[e,E];
i=[i,I];
d=[d,D];
r=[r,R];
de=[de,dead];
n=[n,N];
end


 b1= 0.152922731983936;
 b2=0.156528517721749;
 delta=0.008046320002109;
 sigma=-0.000016637768456;
 epe=-0.000320650747752;
 epi= 0.001133808425709;
 gamaei=-0.008322169246329;
 gamad=0.001058660862592;
 dd=0.000140002107512;

% for t=1:31
%     Sn=S-b1*S*E/N-b2*S*I/N+delta*E;
% En=E+b1*S*E/N+b2*S*I/N-sigma*E-delta*E-epe*E;
% In=I+sigma*E-gamai*I-epi*I;
% Dn=D+epe*E+epi*I-dd*D-gamad*D;
% Rn=R+gamai*I+gamad*D;
% Nn=0.05*S+E+I+R+D;
% dead=dead+dd*D;
% 
% S=Sn;
% E=En;
% I=In;
% D=Dn;
% R=Rn;
% N=Nn;
% 
% s=[s,S];
% e=[e,E];
% i=[i,I];
% d=[d,D];
% r=[r,R];
% de=[de,dead];
% end
ri=data(1:13,5);%real data
rr=data(1:13,2);
rde=data(1:13,3);
re=data(1:13,8);
rd=data(1:13,11);

x=1:13;
B={'7/2012','1/2013','7/2013','1/2014','7/2014','1/2015','7/2015','1/2016'};
plot(x,d,'-*',x,rd,'-');
 legend('d','reald'); 
 xlabel('time/day')  
ylabel('number')
%set(gca,'XTickLabel',B)
