%%Analysis steps - Paul Del Prato, created 4/15/14; last modified 4/22/14%%

%Here are the steps for analysis, split up into separate cells
%For now, it works when your files are in the current directory

% 1. Initializing parameters of the experiment and of the desired analysis.
% 2. Linking the parameters from step 1 to the fieldtrip 'cfg'
% (configuration) structure.
% (Optional) 2.5. View the continuous raw data
% 3. Get the information from the trigger channels (time of trigger onset,
% trigger code)
% 4. Using output from Step 3, timelock samples from the continuous data
% for epoch information, and get into fieldtrip format.
% 5. Visually inspect trial data, and remove bad channels/trials.
% 6. Use average reference
% 7. Compute LFPs, local field potentials (currently .5 Hz - 40Hz)
% 8. Compute HGPs, high gamma power (currently 70Hz - 190Hz)
% 9. Plot LFPs, pairwise test (two conditions) per channel
% 10. Plot HGPs, pairwise test (two conditions) per channel
% The rest is not yet implemented
%%
%Step 1:Experiment and analysis parameters

params.experiment = 'MS';
params.subject = 'NY442';
params.filenames = {'NY442_MSL_RUN1_CLIN1.edf'};
params.runs = length(params.filenames);

params.event_names = {'sound','face','building'};

%These are the trigger codes... in binary (2^n - 1)
params.events = [1 4 5];

analysis_dir = [params.experiment '_' date];
mkdir(analysis_dir);
params.analysis_dir = [pwd filesep analysis_dir];

% In microvolts (I think) - this is the threshold for determining the
% trigger amplitudes that extend beyond the range of brain data.
%Also in the events_and_times script... this is for reference only
%currently
params.threshold = 190000;

%%
% Step 2: Initializing cfg for fieldtrip preprocessing

cfg = [];
cfg.dataset = params.filenames;
cfg.continuous = 'yes';
cfg.channel = 'all';

%%
%OPTIONAL: Step 2.5 - Continuous data for inspection
cont_data = {};
for i = 1 : params.runs
    cfg.dataset = params.filenames{i};
    cont_data{i} = ft_preprocessing(cfg);
end

%Change cont_data arg for different runs
ft_databrowser(cfg,cont_data{1});

%%
%Step 3 - Getting trigger channel data

cfg.channel = {'Pulse DC1-REF' 'Pulse DC2-REF' 'Pulse DC3-REF' 'Pulse DC4-REF' 'Pulse DC5-REF' 'Pulse DC6-REF' 'Pulse DC7-REF' 'Pulse DC8-REF'};

trig_data = {};
%For each run of the experiment, make a separate struct with trigger
%information
for i = 1 : params.runs
    cfg.dataset = params.filenames{i};
    trig_data{i} = ft_preprocessing(cfg);
end

%revert channels back to default
cfg.channel = 'all';


%%
% Step 4 - Use trigger information to epoch data

%DOWNSAMPLE TO 500Hz in future?


%Evts is a list of the beginning sample for each trigger, and it's code
%We can loop this by run
evts = events_and_times(params);
params.my_trl{1} = evts;

%Output1 is trl files, Output2 is the data from all runs appended together
%Basically... fieldtrip wants it's trial information differently
[trl, epoch_data] = make_ft_trials(params);

%%
% Step 5 - view for rejections 

%(only the channels on the head)
head_channels = epoch_data.label(1:128);
cfg.channel = head_channels;

cfg.method = 'summary';
cfg.viewmode = 'vertical';

%Calls fieldtrip's GUI for rejecting trials
[epoch_data] = ft_rejectvisual(cfg,epoch_data);

%% 
% Step 6 - average ref
%We define head_channels as those not DC, EKG, SG
head_channels = epoch_data.label;
cfg = [];
cfg.reref = 'yes';

%Yup... they are the same
cfg.refchannel = head_channels;
cfg.channel = head_channels;

%Apply to epoch data
epoch_dataref = ft_preprocessing(cfg,epoch_data);

%% 
% Step 7 - LFP

params.baseline = [-.15 0];
%gets LFP data - .5Hz to 40Hz
LFP_event_data = LFP_single(epoch_dataref,params);


%% 
% Step 8 - HGP

%%Hilbert = high gamma power from 70 to 190 Hz ... (technique other than
%%hilbert is wavelet... look into this)
HGP_event_data = HGP_hilbert(epoch_dataref,params);

%% 
% Plot LFP - without stats

%Sets the channels to use
params.channels = LFP_event_data{1}.label(1:11)';

%Time window for plots
params.prestim = -.3;
params.poststim = 1;

%Pairing of trigger values to view on each pot
params.combs = {[4 5]};

%Want to display figures? Helps with memory/crashing to suppress (==0)
visible = 1;

%added 'visible' argument
pairwise_plots_by_channel(LFP_event_data,params,visible); %only two events per plot

%%
%Plot HGP - without stats

params.channels = 'all';

params.prestim = -.3;
params.poststim = 1;

%Pairing of trigger values to view on each pot
%currently face vs. building
params.combs = {[4 5]};

%Want to display figures? Helps with memory/crashing to suppress (==0)
%Still saves them either way
visible = 1;

%Makes the plots... ask Paul for more info about script
pairwise_plots_by_channel(HGP_event_data,params,visible);



%% stats for lfp and hgp data
%have not done yet... (out of memory)
stats = kb_avg_stats(LFP_event_data,MS);


%% TF
%gets time frequency data - currently not tested (out of memory)
freq_data = avg_freq_data(epoch_dataref,params);


