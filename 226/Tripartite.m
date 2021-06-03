
%********************************************************************
% https://www.brainkart.com/article/Earthquake-response-spectra_5003/
% Program 17.2: MATLAB program to draw tripartite plot 
%********************************************************************

pga = 0.373464;
% pga = 0.319;
% pgd = 8.40 * 2;
pgd = 105.911328;
% pgd = 1;

% g = 9.80665;
g = 386.08858;
g = g / pga;

for k=.00001:.00001:.0001

     x=0.01:1:100;
     t=log(2*pi*k/pgd)-log(x);
     y=exp(t);

     loglog(x,y,'k'), grid on;
     hold on;

     t=log(k*g/(2*pi))+log(x);
     y=exp(t);

     loglog(x,y,'k')
     hold on;

end

for k=.0001:.0001:.001

     x=0.01:1:100;
     t=log(2*pi*k/pgd)-log(x);
     y=exp(t);

     loglog(x,y,'k'), grid on;
     hold on;

     t=log(k*g/(2*pi))+log(x);
     y=exp(t);

     loglog(x,y,'k');
     hold on;

end

for k=.001:.001:.01

     x=0.01:1:100; 
     t=log(2*pi*k/pgd)-log(x);
     y=exp(t);

     loglog(x,y,'k'),grid on; 
     hold on;

     t=log(k*g/(2*pi))+log(x);
     y=exp(t);

     loglog(x,y,'k');
     hold on;

end

xlabel(' period in secs')

ylabel(' spectral velocity sv in cm/sec') 

for k=.01:.01:.1

     x=0.01:1:100;
     t=log(2*pi*k/pgd)-log(x);
     y=exp(t);

     loglog(x,y,'k'), grid on;
     hold on;

     t=log(k*g/(2*pi))+log(x);
     y=exp(t);

     loglog(x,y,'k');
     hold on;

end

for k=.1:.1:1 

     x=0.01:1:100;
     t=log(2*pi*k/pgd)-log(x);
     y=exp(t);

     loglog(x,y,'k'), grid on;
     hold on;

     t=log(k*g/(2*pi))+log(x);
     y=exp(t);
     loglog(x,y,'k');
     hold on;

end

for k=1:1:10 

     x=0.01:1:100;
     t=log(2*pi*k/pgd)-log(x);
     y=exp(t);

     loglog(x,y,'k'), grid on;
     hold on;

     t=log(k*g/(2*pi))+log(x);
     y=exp(t);

     loglog(x,y,'k');
     hold on;

end

for k=10:10:100 

     x=0.01:1:100;
     t=log(2*pi*k/pgd)-log(x);
     y=exp(t);

     loglog(x,y,'k'), grid on;
     hold on;

     t=log(k*g/(2*pi))+log(x);
     y=exp(t);

     loglog(x,y,'k');
     hold on;

end

for k=100:100:1000 

     x=0.01:1:100;
     t=log(2*pi*k/pgd)-log(x);
     y=exp(t);

     loglog(x,y,'k'), grid on;
     hold on;

     t=log(k*g/(2*pi))+log(x);
     y=exp(t);

     loglog(x,y,'k');
     hold on;

end

for k=1000:1000:10000 
     x=0.01:1:100;
     t=log(2*pi*k/pgd)-log(x);
     y=exp(t);
     loglog(x,y,'k'), grid on;
     hold on;

     t=log(k*g/(2*pi))+log(x);
     y=exp(t);

     loglog(x,y,'k') 
end

% axis([0.01 100 0.02 500]) % d=xlsread(‘svdata’); sv=‘sv.out’

% d=load(sv)

% plot(d(:,1),100*d(:,2),'k')

% plot(d(:,1),100*d(:,3),'k')

% plot(d(:,1),100*d(:,4),'k')

% plot(d(:,1),100*d(:,5),'k')

% plot(d(:,1),100*d(:,6),'k')

% text(0.2,0.02,'0.001');
% text(0.6,0.1,'0.01');
% text(2,0.3,'0.1');
% text(7,1,'1');
% text(20,3,'10');
% text(80,10,'100');
% text(20,1,'sd in cm');

% xlabel(" period in sec");
% ylabel(" sv in cm/sec");

% text(0.01,200,'100');
% text(0.01,20,'10');
% text(0.01,2,'1');
% text(0.02,0.4,'0.1');
% text(0.07,0.1,'0.01');
% text(.02,0.8,"sa/g");

% gtext(" no damping");
% gtext(" damping=2%");
% gtext(" damping=5%");
% gtext(" damping=10%");
% gtext(" damping=20%");