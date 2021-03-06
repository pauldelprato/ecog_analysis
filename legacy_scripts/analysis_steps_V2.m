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

ft_defaults;


%Step 1:Experiment and analysis parameters
dataset_idx = 2;
params = meta_file(dataset_idx); 
analysis_dir = [params.main_dir filesep params.experiment filesep params.subject]; % XJ: changed directory
if exist(analysis_dir,'dir')==0
    mkdir(analysis_dir);
end
params.analysis_dir = analysis_dir;


%%
% Step 2: Continuous data for inspection; write down noisy channels

cfg = [];
% cfg.dataset = params.filenames; % commented out by XJ
cfg.continuous = 'yes';
cfg.channel = 'all';

cont_data = {};
for i = 1 : params.runs
    cfg.dataset = params.filenames{i};
    cont_data{i} = ft_preprocessing(cfg);
end
%%

run_num = 1;
cfg.viewmode = 'vertical'; % added by XJ
%Change cont_data arg for different runs!!
ft_databrowser(cfg,cont_data{run_num});


%%
% Step 4 - Use trigger information to epoch data

%Evts is a list of the beginning sample for each trigger, and it's code
evts = events_and_times(params);
params.my_trl = evts;

%Output1 is trl files, Output2 is the data from all runs appended together
%Basically... fieldtrip wants it's trial information differently
[trl, epoch_data] = make_ft_trials(params);

%%
% Step 5 - view for rejections 

% only EEG channels --- XJ 5/5/14
if(params.RunOrRest)
    all_channels = epoch_data.label;
else
    all_channels = cont_data{1}.label;
end
head_channels = {};
for ch = 1:length(all_channels)
    if(strcmp(all_channels{ch}(1:3), 'EEG'))
        head_channels = [head_channels; all_channels(ch)];
    end
end

% Bad channels identified in ft_databrowser
bad_chs = params.bad_chs;

bad_ch_idx = []; %changed by PD 5/1
for ch=1:length(bad_chs)
    bad_ch_name = ['EEG ' bad_chs{ch} '-REF'];
    for ach=1:length(head_channels)
        if(strcmp(head_channels{ach},bad_ch_name))
            bad_ch_idx(ch) = ach;
        end
    end
end
head_channels(bad_ch_idx)=[];

if(~params.RunOrRest)
    head_channels_good = head_channels;
    % rest-period recordings do not have trials - skip ft_rejectvisual
end


cfg.channel = head_channels;
cfg.method = 'summary';
cfg.viewmode = 'vertical';

%Calls fieldtrip's GUI for rejecting trials
[epoch_data] = ft_rejectvisual(cfg,epoch_data);
head_channels_good = epoch_data.label;


%% 
% This step is commented out b/c reref is now combined with Step 8 -> b/c
% epoching can only be done when data is read from original data file
% Step 6 - average ref
%We define head_channels as those not DC, EKG, SG
% cfg = [];
% cfg.reref = 'yes';

%Yup... they are the same
% cfg.refchannel = head_channels_good;
% cfg.channel = head_channels_good;

%Apply to epoch data
% cont_dataref = ft_preprocessing(cfg,cont_data{1});


%% 
% Step 8 - HGP

%%Hilbert = high gamma power from 70 to 190 Hz ... (technique other than
%%hilbert is wavelet... look into this)
clear cfg HGP_epoch_data
%cfg = cell(1,params.runs);
for i = 1 : params.runs

    cfg{i}.continuous = 'yes';
    cfg{i}.channel  = head_channels_good;
    cfg{i}.hilbert = 'abs';   
    cfg{i}.bpfilter = 'yes';
    cfg{i}.bpfreq = [70 190];
    

    cfg{i}.dftfilter = 'yes';
    cfg{i}.dftfreq = [60 120 180];
    
    cfg{i}.reref = 'yes';
    cfg{i}.refchannel = head_channels_good;   
    cfg{i}.dataset = params.filenames{i};    
    if(params.RunOrRest)
        cfg{i}.detrend = 'yes';
        cfg{i}.demean = 'yes';
        cfg{i}.baselinewindow = [-.4 0];
        cfg{i}.trl = trl{i};
    end
    
    HGP_epoch_data{i} = ft_preprocessing(cfg{i});
end

HGP_epoch_data = append_data(HGP_epoch_data, params); % combine different runs

% Separate trials by trial type, calculate mean and var across trials of
% the same type
g_event_data = [];
for ieve = 1:length(params.events)
    
    ieve_idx = find(HGP_epoch_data.trialinfo == params.events(ieve));
    
    g_event_data{ieve} = HGP_epoch_data;
    g_event_data{ieve}.trial= HGP_epoch_data.trial(ieve_idx');
    g_event_data{ieve}.time = HGP_epoch_data.time(ieve_idx');
    g_event_data{ieve}.sampleinfo = HGP_epoch_data.sampleinfo(ieve_idx,:);
    g_event_data{ieve}.trialinfo= HGP_epoch_data.trialinfo(ieve_idx);
end

HGP_event_data = do_evoked(g_event_data);


% HGP_event_data = HGP_hilbert(epoch_dataref,params); % This is kb's original code


%%
%Plot HGP - without stats

% channels to plot
params.plotchan =head_channels_good;

% trial types to plot
params.plotevt = [1 4 5];

%Want to display figures? Helps with memory/crashing to suppress (==0)
%Still saves them either way
visible = 1; % =1 necessary for printing figures with the correct dimensions

%Makes & prints the plots
plots_by_channel(HGP_event_data,params,visible);


%% 
% Skip for now
% Step 9 - LFP

%No hilbert applied
clear cfg LFP_epoch_data
%cfg = cell(1,params.runs);
for i = 1 : params.runs

    cfg{i}.continuous = 'yes';
    cfg{i}.channel  = head_channels_good;
    %cfg{i}.hilbert = 'abs'; %No hilbert applied on LFP  
    cfg{i}.bpfilter = 'yes';
    cfg{i}.bpfreq = [.5 40]; %This is the LFP band, change if you wish
    
    
    cfg{i}.reref = 'yes';
    cfg{i}.refchannel = head_channels_good;   
    cfg{i}.dataset = params.filenames{i};    
    if(params.RunOrRest)
        cfg{i}.detrend = 'yes';
        cfg{i}.demean = 'yes';
        cfg{i}.baselinewindow = [-.4 0];
        cfg{i}.trl = trl{i};
    end
    
    LFP_epoch_data{i} = ft_preprocessing(cfg{i});
end

LFP_epoch_data = append_data(LFP_epoch_data, params); % combine different runs

% Separate trials by trial type, calculate mean and var across trials of
% the same type
%TO DO: what is the "g_"/"l_"?
l_event_data = [];
for ieve = 1:length(params.events)
    
    ieve_idx = find(LFP_epoch_data.trialinfo == params.events(ieve));
    
    l_event_data{ieve} = LFP_epoch_data;
    l_event_data{ieve}.trial= LFP_epoch_data.trial(ieve_idx');
    l_event_data{ieve}.time = LFP_epoch_data.time(ieve_idx');
    l_event_data{ieve}.sampleinfo = LFP_epoch_data.sampleinfo(ieve_idx,:);
    l_event_data{ieve}.trialinfo= LFP_epoch_data.trialinfo(ieve_idx);
end

LFP_event_data = do_evoked(l_event_data);


% LFP_event_data = LFP_single(epoch_dataref,params); % This is kb's original code
%%
%Plot LFP - without stats

% channels to plot (do we really want all)
params.plotchan = head_channels_good;

% trial types to plot
params.plotevt = [1 4 5];

%Want to display figures? Helps with memory/crashing to suppress (==0)
%Still saves them either way
visible = 1; % =1 necessary for printing figures with the correct dimensions

%Makes & prints the plots
plots_by_channel(LFP_event_data,params,visible);



%% stats for lfp and hgp data
stats = kb_avg_stats(LFP_event_data,params);


%% TF
%gets time frequency data - currently not tested (out of memory)

% bandpass 1 - 190 hz (lines 275-318 are getting event data for a broad
% frequency band, same idea as 
clear cfg epoch_data;
        for i = 1 : params.runs

        cfg{i}.continuous = 'yes';
        cfg{i}.channel = head_channels_good;
        cfg{i}.reref = 'yes';
        cfg{i}.refchannel = head_channels_good;
        cfg{i}.dataset = params.filenames{i};
        cfg{i}.bpfilter = 'yes';
        cfg{i}.bpfreq = [1 190];

        if(params.RunOrRest)
                cfg{i}.detrend = 'yes';
                cfg{i}.demean = 'yes';
                cfg{i}.baselinewindow = [-.4 0];
                cfg{i}.trl = trl{i};
        end

        epoch_data{i} = ft_preprocessing(cfg{i});


        end
       

epoch_data = append_data(epoch_data, params); % combine different runs
        
%
% Separate trials by trial type, calculate mean and var across trials of
% the same type
%TO DO: what is the "g_"/"l_"?
event_data = [];
for ieve = 1:length(params.events)
    
    ieve_idx = find(epoch_data.trialinfo == params.events(ieve));
    
    event_data{ieve} = epoch_data;
    event_data{ieve}.trial= epoch_data.trial(ieve_idx');
    event_data{ieve}.time = epoch_data.time(ieve_idx');
    event_data{ieve}.sampleinfo = epoch_data.sampleinfo(ieve_idx,:);
    event_data{ieve}.trialinfo= epoch_data.trialinfo(ieve_idx);
end

event_data = do_evoked(event_data);

% avg freq analysis
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

TF_data = freq_data;

%%
%Plot TF data

params.event_plot = 1;

TF_plot(TF_data,params)

%%
stats = clusterTest(HGP_event_data,params,1);

