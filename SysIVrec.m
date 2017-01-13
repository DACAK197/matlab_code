clear all
close all
format long

species1='sp';
species2='s3p';
param='MIXR';
folder1 = dir(strcat('/home/dcoffin/2D_Model-master/plots/data/',species1,'/',param,'/*_3D.dat'));
folder2 = dir(strcat('/home/dcoffin/2D_Model-master/plots/data/',species2,'/',param,'/*_3D.dat')); 

%Read in R = 6 Rj data
lng=12;
rad=12;

len=length(folder1);

for day = 1:190 %len
    days(day)=day-1;
    data1=load(folder1(day).name);
    data2=load(folder2(day).name);
    torusStart=1;
    torusEnd=(lng);
    spmax(day)=max(data1(torusStart:torusEnd,2));
    s3pmax(day)=max(data2(torusStart:torusEnd,2));
    spmaxlong(day) = 360/lng*(find(data1(torusStart:torusEnd,2) == spmax(day))-1);
    s3pmaxlong(day) = 360/lng*(find(data2(torusStart:torusEnd,2) == s3pmax(day))-1);
end

%spmaxlong
%s3pmaxlong

figure
plot(days,spmaxlong,days,s3pmaxlong)
xlabel('Days')
ylabel('Sys III longitude')
legend('S+', 'S+++')