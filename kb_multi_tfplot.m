function kb_multi_tfplot(freq_data,parms)

%% baseline correction
for ieve = 1:length(freq_data)
cfg = [];
cfg.baseline = [-.5 -.2];
cfg.baselinetype = 'db';
cfg.parameter = 'powspctrm';

freq_data{ieve} = ft_freqbaseline(cfg,freq_data{ieve}); 
end

%%

clear cfg
for ichan = 1:length(freq_data{1}.label)
cfg{ichan} = [];
cfg{ichan}.channel = freq_data{1}.label{ichan};
cfg{ichan}.xlim = [-0.5 .8];
cfg{ichan}.ylim = [1 190];
cfg{ichan}.zlim = 'maxabs';
cfg{ichan}.maskstyle= 'saturation';
end


for ievep = 1:length(parms.event_plot)
    event_plot_indx = find(parms.events==parms.event_plot(ievep)); % number corresponds to event data structure
    event_name = parms.event_names{event_plot_indx};

    plotdir = sprintf('%s/TF_plots/%s',parms.analysis_dir,event_name);
    if ~exist(plotdir,'dir')==1, mkdir(plotdir), end
  %{
for ichan = 1:length(freq_data{1}.label)
    zmax_val = ceil(max(max(freq_data{event_plot_indx}.powspctrm(ichan,:,:)))*1.2*10)/10;
    zmin_val = floor(min(min(freq_data{event_plot_indx}.powspctrm(ichan,:,:)))*1.1*100)/100;
    if zmax_val < 5, zmax_val = 5; end
    cfg{ichan}.zlim = [zmin_val zmax_val];
end
%}
chan_length = length(freq_data{1}.label);
plot_length = floor(chan_length/25);

for iplot = 1:plot_length
close all;
h=custom_figure(50,50,1);
for k = 1:25
h(k) = subplot(5,5,k);
subplot(h(k));
ichan = k+(iplot-1)*25;
plottf = ft_singleplotTFR(cfg{ichan}, freq_data{event_plot_indx} );
title(sprintf('%s / %d',freq_data{1}.label{ichan},ichan));
end
export_fig(sprintf('%s/%s_%s_TFplot%d.png',plotdir,parms.subject,event_name,iplot),'-a1');
end

rem_chan = chan_length - plot_length*25;
if rem_chan >0
close all;
h=custom_figure(50,50,1);
for k = 1:rem_chan
h(k) = subplot(5,5,k);
subplot(h(k));
ichan = k+plot_length*25;
plottf = ft_singleplotTFR(cfg{ichan}, freq_data{event_plot_indx} );
title(sprintf('%s / %d',freq_data{1}.label{ichan},ichan));
end
export_fig(sprintf('%s/%s_%s_TFplot%d.png',plotdir,parms.subject,event_name,plot_length+1),'-a1');
end

end

end




