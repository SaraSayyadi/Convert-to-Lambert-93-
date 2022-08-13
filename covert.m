clc,clear all; 
format long e
data=xlsread('tephra.xlsx');

phi=data(:,1);
landa=data(:,2);
Ef=500000;
Nf=500000;
phif=65;
landaf=-19;
phi1=64.2500;
phi2=65.7500;
a=6378137.0;
f=1./(298.257222101);

for i=1:length(phi)
    %for j=1:length(landa)
        [E(i),N(i)]=lambert2(phi(i),landa(i),Ef,Nf,phif,landaf,phi1,phi2,f,a);
        
    %end 
end
E=E';
N=N';
 data(:,1)=E;
 data(:,2)=N;




