function [E,N]=lambert2(phi,landa,Ef,Nf,phif,landaf,phi1,phi2,f,a)

phi=degtorad(phi);
landa=degtorad(landa);

 phi1=degtorad(phi1);
 phi2=degtorad(phi2);
 
 phif=degtorad(phif);
 landaf=degtorad(landaf);


%a=6378137.0;
%f=1./(298.257222101);
e2=(2.*f)-(f^2);
e=sqrt(e2);

%m=cos(phi)./(sqrt(1-(e2*sin(phi))));
m1=cos(phi1)./(sqrt(1-(e2*(sin(phi1).^2))));

m2=cos(phi2)./(sqrt(1-(e2*sin(phi2).^2)));


tup=(tan((pi./4)-(phi/2)));
tup1=(tan((pi./4)-(phi1/2)));
tup2=(tan((pi./4)-(phi2/2)));
tupf=(tan((pi./4)-(phif/2)));

tdown=(1-(e*sin(phi)))./(1+(e*sin(phi)));
tdown1=(1-(e*sin(phi1)))./(1+(e*sin(phi1)));
tdown2=(1-(e*sin(phi2)))./(1+(e*sin(phi2)));
tdownf=(1-(e*sin(phif)))./(1+(e*sin(phif)));

t=tup./(tdown.^(e/2.));


t1=tup1./(tdown1.^(e/2.));
t2=tup2./(tdown2.^(e/2.));
tf=tupf./(tdownf.^(e/2.));

n=(log(m1)-log(m2))/(log(t1)-log(t2));

F=m1./(n*(t1^n));

r=a.*F.*(t.^n);

rf=a.*F.*(tf.^n);


teta=n.*(landa-landaf);

E=Ef+(r.*(sin(teta)));
N=Nf+rf-(r.*cos(teta));


end