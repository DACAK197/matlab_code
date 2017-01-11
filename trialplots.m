clear all
close all
clf;

strtpath = '/home/dcoffin/2D_Model-master/plots/data/';  %Your saved 2D_Model-master location

f_path = '/home/dcoffin/torus_plots-master/torus_plots/'; %plotting location

specset = {'op', 'sp', 's2p', 'o2p', 's3p'};
paramset = {'DENS', 'MIXR', 'NL2_', 'PUV_', 'TEMP'};

for i = 1:length(specset)
    for j = 1:length(paramset)
        torus_plots('map', specset{i}, paramset{j}, 1:100, 0, 'nork')
    end
end

elecparam = {'DENS', 'NL2_', 'PUV_', 'TEMP'};

for j = 1:length(elecparam)
    torus_plots('map', 'elec', elecparam{j}, 1:100, 0, 'nork')
end

weighted_amplitude