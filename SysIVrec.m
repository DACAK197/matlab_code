function[] = SysIVrec(species1, species2, param, day_range,lng)


%clear all
%close all
%format long

folder1 = dir(strcat('/home/dcoffin/2D_Model-master/plots/data/',species1,'/',param,'/*_3D.dat'));
folder2 = dir(strcat('/home/dcoffin/2D_Model-master/plots/data/',species2,'/',param,'/*_3D.dat')); 

%Read in R = 6 Rj data
len=length(folder1);

for day = day_range 
    days(day) = day-1;
    data1=load(folder1(day).name);
    data2=load(folder2(day).name);
    torusStart=417;
    torusEnd=417+lng-1;
    spmax(day)=max(data1(torusStart:torusEnd,2));
    s3pmax(day)=max(data2(torusStart:torusEnd,2));
    spmaxlong(day) = 360/lng*(find(data1(torusStart:torusEnd,2) == spmax(day))-1);
    s3pmaxlong(day) = 360/lng*(find(data2(torusStart:torusEnd,2) == s3pmax(day))-1);
    slope = 360*0.212/(2*pi); %Slope of System IV tracking line; 0.212 rads per day
    tracksp(day) = mod(slope*(day-88), 360);
    if tracksp(day) - tracksp(day-1) < 0
        tracksp(day) = nan; %remove vertical jumps
    end
    tracks3p(day) = mod(slope*(day-104), 360);
    if tracks3p(day) - tracks3p(day-1) < 0
        tracks3p(day) = nan; %remove vertical jumps
    end
end

figure
scatter(days,spmaxlong,'+')
hold on
scatter(days,s3pmaxlong, '+')
hold on
plot(tracksp, 'k')
hold on
plot(tracks3p, 'k')
title(strcat('Peak mixing ratio longitude at 7.5 Rj'))
xlabel('Days')
xlim([day_range(1) day_range(end)])
ylabel('Sys III longitude')
legend('S+', 'S+++')
print(strcat('/home/dcoffin/2D_Model-master/SysIV',param,'sim75.jpg'), '-djpeg');
end
