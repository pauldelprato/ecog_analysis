function [lfp_event_data] = LFP_single(epoch_data,parms)
%%

%Define:
%
%parms.runs
%parms.filename
%parms.channels
%parms.my_trl
%parms.events
%parms.rootout

%%
%% low filter
%bandpass between .5 - 40 Hz ... standard for evoked response analysis

cfg = [];
cfg.continuous = 'no';
cfg.channel = 'all';%parms.channels;
cfg.lpfilter = 'yes';
cfg.lpfreq = 40;
cfg.hpfilter = 'yes';
cfg.hpfreq = 0.5;
cfg.dftfilter = 'yes';
cfg.dftfreq = [60, 120, 180, 240];
cfg.demean = 'yes';
cfg.baselinewindow = [-.4 -.04];
cfg.detrend = 'yes';

td_data = ft_preprocessing(cfg,epoch_data);



%% separate events

td_event_data = [];

ieve = 1;
for ieve = 1:length(parms.events)
td_event_data{ieve} = td_data;
td_event_data{ieve}.trial= td_data.trial(find(td_data.trialinfo ==parms.events(ieve))');
td_event_data{ieve}.time = td_data.time(find(td_data.trialinfo ==parms.events(ieve))');
td_event_data{ieve}.sampleinfo = td_data.sampleinfo(td_data.trialinfo==parms.events(ieve),:);
td_event_data{ieve}.trialinfo= td_data.trialinfo(td_data.trialinfo==parms.events(ieve));
end


%% avg event data

lfp_event_data = do_evoked(td_event_data);


% save(sprintf('%s/%s_lfp_event_data.mat', parms.analysis_dir, parms.subject), 'lfp_event_data');
end
