function TF_plot(freq_data,params)

%To do - specify which channels to plot

% baseline correction
for ieve = 1:length(freq_data)
cfg = [];
cfg.baseline = [-.5 -.2];
cfg.baselinetype = 'db';
cfg.parameter = 'powspctrm';

freq_data{ieve} = ft_freqbaseline(cfg,freq_data{ieve}); 
end

%Gets each channel label and sets dimension scales (what is maskstyle?)
%We need to fix this to use fields from params for e.g. frequency bands
clear cfg
for ichan = 1:length(freq_data{1}.label)
cfg{ichan} = [];
cfg{ichan}.channel = freq_data{1}.label{ichan};
cfg{ichan}.xlim = [-0.5 .8];
cfg{ichan}.ylim = [1 190];
cfg{ichan}.zlim = 'maxabs';
cfg{ichan}.maskstyle= 'saturation';
end

%For length of event_plot (one loop for each event code)
for ievep = 1:length(params.event_plot)
    
    %Separate fdir for each event_name
    event_plot_indx = find(params.events==params.event_plot(ievep)); % number corresponds to event data structure
    event_name = params.event_names{event_plot_indx};

    plotdir = sprintf('%s/TF_plots/%s',params.analysis_dir,event_name);
    if ~exist(plotdir,'dir')==1 
        mkdir(plotdir) 
    end

    chan_length = length(freq_data{1}.label);
    plot_length = floor(chan_length/25);
    
    %Plot a figure for 25 (or less) sensors for that event type
    for iplot = 1:plot_length
        close all;
        h=custom_figure(50,50,1);

        if iplot == plot_length
            panel_num = rem(chan_length,25);
        else
            panel_num = 25;
        end
        
        for k = 1:panel_num
            h(k) = subplot(5,5,k);
            subplot(h(k));
            ichan = k+(iplot-1)*25;
            
            %To do - potentially organize aggregate plottf into an output variable
            plottf = ft_singleplotTFR(cfg{ichan}, freq_data{event_plot_indx} );
            
            title(sprintf('%s / %d',freq_data{1}.label{ichan},ichan));
            
            %First panel, provide label axes
            if k ==1
                xlabel('Time (sec)');
                ylabel('Frequency (hz)');
            end
        end
        
        export_fig(sprintf('%s/%s_%s_TFplot%d.png',plotdir,params.subject,event_name,iplot),'-a1');
     end


end

end




