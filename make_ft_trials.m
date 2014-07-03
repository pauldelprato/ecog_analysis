function [trl_file,app_data] = make_ft_trials(parms)
%% Define
%varargin as my_trl{r}
%parms.runs
%parms.filename{r}
%parms.subject
%parms.analysis_dir


%%


%Puts trial information into the four column organization that fieldtrip
%needs
for r = 1:parms.runs
    %column1 = beginning sample of trial
    %column2 = end sample of trial
    %column3 = offset of epoch (here - 1s before and 2s after beginning sample)
    %column4 = trigcode
    %each cell of trig code is a run
trl_file{r} = [parms.my_trl{r}(:,1) - 512, parms.my_trl{r}(:,1) + 1024, repmat(-512,size(parms.my_trl{r},1),1), parms.my_trl{r}(:,2)];
end


%If you want...
% if parms.save ==1
% save(sprintf('%s/%s_my_trl.mat', parms.rootout, parms.subj), 'trl_file');
% end

%% Appends data if there is more than one run and puts into a struct

%Not used often... TODO - make this more efficient, instead of calling
%preprocessing each time. 
% <-- here, calling preprocessing is necessary because the continuous data
% is now loaded in the structure of the trials --- Added by XJ


% if parms.runs > 1 % Commented out by XJ
%To make sure that the fieldtrip cfg knows we append.    
clear cfg;


for r = 1:parms.runs
    cfg{r} = [];
    cfg{r}.dataset = parms.filenames{r};
    cfg{r}.channel = 'all';
    cfg{r}.continuous = 'yes';
    cfg{r}.trl = trl_file{r};
    raw_data{r} = ft_preprocessing(cfg{r});
end

% end % Commented out by XJ

[app_data] = append_data(raw_data, parms); 

%If you want... saved epoch data into a mat file
%save(sprintf('%s/%s_epoch_data.mat', parms.analysis_dir, parms.subject), 'app_data');
end
