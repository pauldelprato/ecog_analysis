function avg_freq_data = avg_freq_data(epoch_data,parms)



%This script analyzes data while correcting for the inverse/power frequncy
%law... ???
plotdir = sprintf('%s/TF_plots',parms.analysis_dir);
if ~exist(plotdir,'dir')==1, mkdir(plotdir), end

freqdir = sprintf('%s/TFR',parms.analysis_dir);
if ~exist(freqdir,'dir')==1, mkdir(freqdir), end

%% bandpass 1 - 190 hz
cfg = [];
cfg.continuous = 'yes';
cfg.channel = 'all';
cfg.lpfilter = 'yes';
cfg.lpfreq = 190;
cfg.hpfilter = 'yes';
cfg.hpfreq = 1;
cfg.bsfilter = 'yes';
cfg.bsfreq = [58 62; 118 122; 178 182];
cfg.demean = 'no';
cfg.detrend = 'yes';

app_data = ft_preprocessing(cfg,epoch_data);
%% separate events

event_data = [];

ieve = 1;
for ieve = 1:length(parms.events)
event_data{ieve} = app_data;
event_data{ieve}.trial= app_data.trial(find(app_data.trialinfo ==parms.events(ieve))');
event_data{ieve}.time = app_data.time(find(app_data.trialinfo ==parms.events(ieve))');
event_data{ieve}.sampleinfo = app_data.sampleinfo(app_data.trialinfo==parms.events(ieve),:);
event_data{ieve}.trialinfo= app_data.trialinfo(app_data.trialinfo==parms.events(ieve));
ieve = ieve + 1;
end


%% avg freq analysis
for ieve = 1:length(event_data)
cfg              = [];
cfg.output       = 'pow';
cfg.channel      = 'all';
cfg.method       = 'mtmconvol';
cfg.taper        = 'hanning';
cfg.keeptrials   = 'no';
cfg.foi          = 1:1:190;
cfg.t_ftimwin    = .1*ones(1,length(cfg.foi)); %%time window in seconds; ex/ for 2 hz the time window can be 1s and have 2 cycles per time window
cfg.toi          = -1:0.01:1;
freq_data{ieve} = ft_freqanalysis(cfg, event_data{ieve});
end

avg_freq_data = freq_data;

save(sprintf('%s/%s_avgfreqdata.mat',parms.analysis_dir,parms.subject),'freq_data');


%{
%% trial freq analysis
clear freq_data;
for ieve = 1:length(event_data)
cfg              = [];
cfg.output       = 'pow';
cfg.channel      = 'all';
cfg.method       = 'mtmconvol';
cfg.taper        = 'hanning';
cfg.keeptrials   = 'yes';
cfg.foi          = 1:1:190;
cfg.t_ftimwin    = .1*ones(1,length(cfg.foi)); %%time window in seconds; ex/ for 2 hz the time window can be 1s and have 2 cycles per time window
cfg.toi          = -1:0.01:1;
freq_data = ft_freqanalysis(cfg, event_data{ieve});

event = parms.events(ieve);
outFileName = sprintf('%s/freq_data_%02i.mat',freqdir,event);
disp(['Saving to ' outFileName]);
save(outFileName,'freq_data','-v7.3')
clear freq_data;
end
%}
end
