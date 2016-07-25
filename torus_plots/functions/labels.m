function [] = labels(species, property, day, n)

%Adds labels for azimuth, species, property, units, and day. Consider
%redoing for effiency. 

    TeXString_90 = texlabel('90');
    a90 = text((5*cos(pi/2))-0.5,(11*sin(pi/2)),TeXString_90,'FontSize',20);
    
    TeXString_180 = texlabel('180');
    a180 = text((11.7*cos(pi)),(5*sin(pi)),TeXString_180,'FontSize',20);
    
    TeXString_270 = texlabel('270');
    y = text((5*cos((3*pi)/2))-0.7,(11*sin((3*pi)/2)),TeXString_270,'FontSize',20);
    
    speciesarr = cellstr(['sp  ';'op  '; 's2p '; 'o2p '; 's3p '; 'elec']);
    speclabelarr = cellstr(['S^{+}   '; 'O^{+}   '; 'S^{2+}  '; 'O^{2+}  '; 'S^{3+}  '; 'Electron']);
    
    for i = 1:length(speciesarr)
        if strcmp(species, speciesarr(i)) == 1
            specieslabel = speclabelarr(i);
        else
            i = i+1;
        end
    end
    
    if strcmp(species, 'elec') == 1
        TeXString_species = texlabel(specieslabel);
        h=text(-9,-9.5,TeXString_species,'FontSize',20);
        
    else
        TeXString_species = texlabel(specieslabel);
        h=text(-10,-9.5,TeXString_species,'FontSize',20);

    end
  
    proparr = cellstr(['DENS'; 'INTS'; 'MIXR'; 'NL2_'; 'PUV_'; 'TEMP']);
    proplabelarr = [cellstr('Density'); cellstr('Intensity'); cellstr('Mixing Ratio'); cellstr('Flux-Tube'); cellstr('Power Output'); cellstr('Temperature')];
    unitsarr = [cellstr('(cm^{-3})'); cellstr('cm^{-3}/eV)'); cellstr(''); cellstr('Content'); cellstr('(eV/s)'); cellstr('(eV)')];
    
    for i = 1:length(proparr)
        if strcmp(property, proparr(i)) == 1
            proplabel = proplabelarr(i);
            units = unitsarr(i);
        else
            i = i+1;
        end
    end
    
    if strcmp(n(1:3), 'bef') == 1
        lastday = n(7:9);
        units = strcat(property(1), '/<', property(1), '_{', lastday, '}>');
    end
    
    % ADD TEXT FOR UNITS
    TeXString_units = texlabel(units);
    p=text(6.5,-8.5,TeXString_units,'FontSize',20);
   
    TeXString_day = texlabel(strcat('Day_',num2str(day)));
    p=text(-10,10,TeXString_day,'FontSize',20);
    
    TeXString_property = texlabel(proplabel);
    p=text(5,-9.5,TeXString_property,'FontSize',20);
    
   
end
