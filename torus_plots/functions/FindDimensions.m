function [lng,rad] = FindDimensions(strtpath)
 
do_script = importdata('2D_Model-master/do');

lng_line = char(do_script(3,1));
lng = str2num(lng_line(5:6));

rad_line = char(do_script(4,1));
rad = str2num(rad_line(5:6));

end

