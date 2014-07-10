function evoked_data = do_evoked(event_data)

%To do - implement trial rejection (so trials != 'all')
%To do - preallocate arrays

%establishes the covariance matrix as the prestimulus activity, and sets
%the baseline
%Q: Which channels are used in copmuting the covariance matrix? the good ones
%or 'all'?

cfg = [];
cfg.trials = 'all';
cfg.keeptrials = 'no';
cfg.covariance = 'yes';
cfg.covariancewindow = 'prestim';
cfg.baseline = [-.5 -0.2]; 

evoked_data = event_data;

%for each trigger code, run timelock analysis
for ieve = 1:length(event_data)
    tl_event_data{ieve} = ft_timelockanalysis(cfg,event_data{ieve});
    bc_tl_event_data{ieve} = ft_timelockbaseline(cfg,tl_event_data{ieve});
    
    evoked_data{ieve}.avg = bc_tl_event_data{ieve}.avg;
    evoked_data{ieve}.timeavg = bc_tl_event_data{ieve}.time;
    
    %bc_* data does not have var, so we use tl data
    evoked_data{ieve}.var = tl_event_data{ieve}.var;
end


