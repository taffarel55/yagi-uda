clc;
close all;
addpath('./RFWave/');

d=[0.20,0.18,0.24,0.20];
ld=[0.50,0.42,0.40,0.38,0.41];
a=0.005;

[ue,uh,ga,zin,fbr] = yagi(d,ld,a);
radpat(ue,21);
figure; radpat(uh,22);

ga
fbr
gama=abs((zin(2)-50)/(zin(2)+50))