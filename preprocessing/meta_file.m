function [params] = meta_file(dataset_idx)

%%%%%%%%%%%% This is meta file for all datasets %%%%%%%%%%%%%%%%

%Get rid of this
if nargin < 1
dataset_idx = 2;
end

%Useful inits
params.trigchan = {'Pulse DC1-REF' 'Pulse DC2-REF' 'Pulse DC3-REF' 'Pulse DC4-REF' 'Pulse DC5-REF' 'Pulse DC6-REF' 'Pulse DC7-REF' 'Pulse DC8-REF'};
params.prestim = -.3; % in sec, for plotting
params.poststim = 1; % in sec, for plotting

if ismac
    params.main_dir = '/Users/pauldelprato/memory_replay/';
else
    params.main_dir = '/home/pdelprato/Results'; % Main directory for saving analysis results
end

%Determine dataest to analyze
switch dataset_idx
    
    case 1 % NY442 MS Runs 1-4 clin1
        params.experiment = 'MS';
        params.subject = 'NY442';
        params.filenames = {...
            '/space/mdeh5/1/halgdev/incoming/iEEG_NYU/NY442/Memory/NY442_MS/NY442_MSL_RUN1_CLIN1/NY442_MSL_RUN1_CLIN1.edf',...
            '/space/mdeh5/1/halgdev/incoming/iEEG_NYU/NY442/Memory/NY442_MS/NY442_MSL_RUN2_CLIN1/NY442_MSL_RUN2_CLIN1.edf',...
            '/space/mdeh5/1/halgdev/incoming/iEEG_NYU/NY442/Memory/NY442_MS/NY442_MSL_RUN3_CLIN1/NY442_MSL_RUN3_CLIN1.edf',...
            '/space/mdeh5/1/halgdev/incoming/iEEG_NYU/NY442/Memory/NY442_MS/NY442_MSL_RUN4_CLIN1/NY442_MSL_RUN4_CLIN1.edf'};
        params.RunOrRest = 1; % 1 - run, 0 - rest
        params.clinsys = 1; % Clinical system #1
        params.event_names = {'Sound','Face','Building'};
        params.events = [1 4 5]; % These are the trigger codes in binary (2^n - 1)
        %params.main_dir = '/space/mdeh5/1/halgdev/projects/pdelprato/Results'; % Main directory for saving analysis results
        params.threshold = 190000; % For trigger detection
        params.bad_chs = {'GA_23','GA_27','GA_32','GB_63','RAF_07','LMT_01','DH_08'};
        
    case 2 % NY442 MS Runs 1-4 clin2
        params.experiment = 'MS';
        params.subject = 'NY442';
        params.filenames = {...
            '/space/mdeh5/1/halgdev/incoming/iEEG_NYU/NY442/Memory/NY442_MS/NY442_MSL_RUN1_CLIN2/NY442_MSL_RUN1_CLIN2.edf',...
            '/space/mdeh5/1/halgdev/incoming/iEEG_NYU/NY442/Memory/NY442_MS/NY442_MSL_RUN2_CLIN2/NY442_MSL_RUN2_CLIN2.edf',...
            '/space/mdeh5/1/halgdev/incoming/iEEG_NYU/NY442/Memory/NY442_MS/NY442_MSL_RUN3_CLIN2/NY442_MSL_RUN3_CLIN2.edf',...
            '/space/mdeh5/1/halgdev/incoming/iEEG_NYU/NY442/Memory/NY442_MS/NY442_MSL_RUN4_CLIN2/NY442_MSL_RUN4_CLIN2.edf'};
        params.RunOrRest = 1; % 1 - run, 0 - rest
        params.clinsys = 2; % Clinical system #2
        params.event_names = {'Sound','Face','Building'};
        params.events = [1 4 5]; % These are the trigger codes in binary (2^n - 1)
        
       
        
        params.threshold = 190000; % For trigger detection
        %params.bad_chs = {'GA_23','GA_27','GA_32','GB_63','RAF_07','LMT_01','DH_08'};
        
        params.bad_chs_r1 = {'GA_63','GB_13','GB_17','LP_8'};
        params.bad_chs_r2= {'GA_63','GB_13','GB_17', 'LP_8'};
        params.bad_chs_r3=  {'GA_63', 'GB_13', 'GB_17','LP_8'};
        params.bad_chs_r4 = {'GA_63', 'GB_13', 'RAF_2', 'LP_8'};
        params.bad_chs = unique([params.bad_chs_r1 params.bad_chs_r2 params.bad_chs_r3 params.bad_chs_r4]);
        
    case 3 % NY442 MS post-run rest clin1
        params.experiment = 'MS';
        params.subject = 'NY442';
        params.filenames = {...
            '/space/mdeh5/1/halgdev/incoming/iEEG_NYU/NY442/Memory/NY442_MS/NY442_MSRR_CLIN1/NY442_MSRR_CLIN1.edf'};
        params.RunOrRest = 0; % 1 - run, 0 - rest
        params.clinsys = 1; % Clinical system #1
        params.main_dir = '/space/mdeh5/1/halgdev/projects/pdelprato/Results'; % Main directory for saving analysis results
        params.bad_chs = {'GA_23','GA_27','GA_32','GB_63','RAF_07','LMT_01','DH_08'};
end

params.runs = length(params.filenames);