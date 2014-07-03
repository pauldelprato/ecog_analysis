function [hgp_event_data] = HGP_hilbert(epoch_data,parms)
%% fieldtrip hilbert
% frequencies from 70hz to 190hz
% absolute value hilberts
%bsfreq = bandstop frequencies (we don't include 60hz and it's multiples)
    cfg = [];
    cfg.continuous = 'no';
    cfg.channel  = 'all';%parms.channels;
    cfg.hilbert = 'abs';
    cfg.detrend = 'yes';
    cfg.demean = 'yes';
    cfg.baselinewindow = [-.4 0];
    cfg.bpfilter = 'yes';
    cfg.bpfreq = [70 190];
    cfg.bsfilter = 'yes';
    cfg.bsfreq = [58 62, 118 122, 178 182, 238 242];

g_data = ft_preprocessing(cfg,epoch_data); 


%% separate events
g_event_data = [];


for ieve = 1:length(parms.events)
g_event_data{ieve} = g_data;
g_event_data{ieve}.trial= g_data.trial(find(g_data.trialinfo ==parms.events(ieve))');
g_event_data{ieve}.time = g_data.time(find(g_data.trialinfo ==parms.events(ieve))');
g_event_data{ieve}.sampleinfo = g_data.sampleinfo(g_data.trialinfo==parms.events(ieve),:);
g_event_data{ieve}.trialinfo= g_data.trialinfo(g_data.trialinfo==parms.events(ieve));

end

hgp_event_data = do_evoked(g_event_data);

% save(sprintf('%s/%s_hgp_event_data.mat', parms.analysis_dir, parms.subject), 'hgp_event_data');


end
