function event_data = do_evoked(data)

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

if isfield(data{1}.cfg.previous{1},'hilbert')
    cfg.hilbert = data{1}.cfg.previous{1}.hilbert;
end

%for each trigger code, run timelock analysis
for ieve = 1:length(data)
    data{ieve} = ft_timelockanalysis(cfg,data{ieve});
end

%for each trigger code, baseline correct
for ieve = 1:length(data)
    data{ieve} = ft_timelockbaseline(cfg,data{ieve});
end

event_data = data;

%Needed to get into final struct?
% evoked_data{ieve}.avg
% evoked_data{ieve}.time
% evoked_data{ieve}.var



