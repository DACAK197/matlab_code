function [] = vectorfield(rad,lng,theta,radius,rad_velocity,vaz_vel, data)
box = textread('/home/dcoffin/2D_Model-master/onebox.f90', '%s','delimiter', '\n');
box_tf = strfind(box,'if( .not. vrad .and. .not. vmass)');
for k = 1:length(box_tf)
    if box_tf{k} == 1
        subco_line = k;
    end
end
break_line = regexp(box{subco_line}, '=', 'split');
cell_subco = break_line(1,2);
subco = str2num(cell_subco{1});
%subco = 1; %Sub-corotation velocity, vrad off
subco_arry = ones((lng+1)*rad,1)*subco; %Creates Sub-corotation velocity array, vrad off
%radius = reshape(radius, lng+1, rad);
v_theta = zeros((lng+1)*rad, 1);
v_mag = zeros((lng+1)*rad, 1);
rad_velocity = reshape(rad_velocity, (lng+1)*rad, 1);
vaz_vel = reshape(vaz_vel, (lng+1)*rad, 1);
for p = 1:((lng+1)*rad)
    if data(1) == '2'
        if vaz_vel(p) == 0
            v_theta(p,1) = pi/2;
        else
            v_theta(p,1)  = atan(rad_velocity(p)/vaz_vel(p));
        end
        v_mag(p,1) = sqrt(((rad_velocity(p))^2)+((vaz_vel(p))^2));
    else
        v_theta(p,1)  = atan(rad_velocity(p)/subco_arry(p));
        v_mag(p,1) = sqrt(((rad_velocity(p))^2)+((subco_arry(p))^2));
        
    end
end
[ theta, v_theta, v_mag, radius ] = vecplot_ind(theta, v_theta, v_mag, radius);
%v_theta = reshape(v_theta, lng+1, rad);
%v_mag = reshape(v_mag, lng+1, rad);
[xx, yy] = pol2cart(theta,radius);
%[XX, YY] = meshgrid(0:max(radius)/rad:maclx(radius),0:max(radius)/rad:max(radius));
[vx, vy] = pol2cart(v_theta+theta+(pi/2), v_mag);
L = sqrt((vx.^2)+(vy.^2));
%[meshx, meshy] = meshgrid(0:(2*radius((lng+1)*rad))/rad:2*radius((lng+1)*rad), 0:(2*radius((lng+1)*rad))/rad:2*radius((lng+1)*rad));
quiver(xx,yy, vx, vy);
hold on

end

