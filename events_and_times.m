function [events] = events_and_times(params)
%% Triggers - multiple files

%Fields that need to be defined:
%runs
%filenames
%subject
%
clear cfg;

%For each run, trigger data is preprocessed
for r = 1:params.runs
    cfg{r} = [];
    cfg{r}.dataset = params.filenames{r};
    cfg{r}.continuous = 'yes';
    cfg{r}.channel  = params.trigchan; % Changed by XJ
    trig_data{r} = ft_preprocessing(cfg{r});
end

% set all the non-existing my_trl_dcX to [0 0] --- changed by XJ
for r = 1:params.runs
    if ismember('my_trl_dc1{r}',who) == 0;
        my_trl_dc1{r} = [0 0];
    end
    if ismember('my_trl_dc2{r}',who) == 0;
        my_trl_dc2{r} = [0 0];
    end
    if ismember('my_trl_dc3{r}',who) == 0;
        my_trl_dc3{r} = [0 0];
    end
    if ismember('my_trl_dc4{r}',who) == 0;
        my_trl_dc4{r} = [0 0];
    end
    if ismember('my_trl_dc5{r}',who) == 0;
        my_trl_dc5{r} = [0 0];
    end
    if ismember('my_trl_dc6{r}',who) == 0;
        my_trl_dc6{r} = [0 0];
    end
    if ismember('my_trl_dc7{r}',who) == 0;
        my_trl_dc7{r} = [0 0];
    end
    if ismember('my_trl_dc8{r}',who) == 0;
        my_trl_dc8{r} = [0 0];
    end
    
    
    %Goes by each trigger channel one by one
    for itrig = 1:8
        %THRESHOLD!!!!*
        dc{r} = find(trig_data{r}.trial{1}(itrig,:) > params.threshold); % Changed by XJ
        % samples above threshold; will later refer back to this matrix
        
        %In order to find contiguous samples, we subtract one-back)
        dc_sub{r} = dc{r}(2:end) - dc{r}(1:end-1); % subtract sample with preceding sample (e.g., 1 1 1 1 368 1 1 1 1 600 1 1 1 1)
        
        %If there are contiguous samples (meaning sample(n) - sample(n-1) = 1)
        if length(dc_sub{r}) >2
            dc_sub_shift{r} = cat(2, dc_sub{r}(1:end), 1); % add one to end
            dc_sub_first{r} = cat(2,600,dc_sub{r}(1:end)); % adds first value of 600 to dc5_sub, so it is recognized as trigger (e.g., 600 1 1 1 1 368 1 1 1 1 600 1 1 1 1)
            
            %Find where that big number begins (this is the first sample... i.e. the
            %beginning of the epoch) This becomes the event
            dc_event{r} = find(dc_sub_first{r} > 10 & dc_sub_shift{r} == 1); % indxs correspond to dc5 variable, which contains samples ##############set threshold low (30) for MSS %greater than 30
            
            %The samples for the beginning of the events for this trigger value
            trigz_dc{r} = dc{r}(1,dc_event{r})';
            %dc4_trl = [trigz_dc4 - 250, trigz_dc4 + 250, repmat(-250,length(trigz_dc4),1)];
            
            switch itrig
                case 1
                    my_trl_dc1{r} = cat(2, trigz_dc{r}, repmat(itrig,length(trigz_dc{r}),1));
                case 2
                    my_trl_dc2{r} = cat(2, trigz_dc{r}, repmat(itrig,length(trigz_dc{r}),1));
                case 3
                    my_trl_dc3{r} = cat(2, trigz_dc{r}, repmat(itrig,length(trigz_dc{r}),1));
                case 4
                    my_trl_dc4{r} = cat(2, trigz_dc{r}, repmat(itrig,length(trigz_dc{r}),1));
                case 5
                    my_trl_dc5{r} = cat(2, trigz_dc{r}, repmat(itrig,length(trigz_dc{r}),1));
                case 6
                    my_trl_dc6{r} = cat(2, trigz_dc{r}, repmat(itrig,length(trigz_dc{r}),1));
                case 7
                    my_trl_dc7{r} = cat(2, trigz_dc{r}, repmat(itrig,length(trigz_dc{r}),1));
                case 8
                    my_trl_dc8{r} = cat(2, trigz_dc{r}, repmat(itrig,length(trigz_dc{r}),1));
            end
        end
        
    end
end
%Now for output

varargout{1} = [];
%For each run, sort all of the samples in ascending order (time,
%essentially)
for r = 1:params.runs
    varargout{r} = sortrows(cat(1,my_trl_dc1{r}, my_trl_dc2{r}, my_trl_dc3{r},my_trl_dc4{r}, my_trl_dc5{r}, my_trl_dc6{r},my_trl_dc7{r}, my_trl_dc8{r}),1);
    
    % Remove all the all-zero rows, i.e. all unused triggerlines --- changed by
    % XJ
    varargout{r}(~all(varargout{r},2),:) = [];
end

for r = 1:params.runs
    varargout{r}(1,4) = [0]; %in case there isn't two triggers at the same time, this creates a 4th col because that's what we are going to still have at the end
    %This is getting the trigger code (2 ^ trigger line - 1)
    varargout{r}(:,3) = pow2(varargout{r}(:,2)-1);
    
    ieve = 1;
    %Continuing through all events found
    while ieve < size(varargout{r},1);
        %if they are combinations of triggers, sum the components and put into
        %the forth column. Remove the second event in the list because it is not separate.
        if abs(varargout{r}(ieve+1,1)-varargout{r}(ieve,1)) < 10;
            varargout{r}(ieve,4) = varargout{r}(ieve,3) + varargout{r}(ieve+1,3);
            varargout{r}(ieve+1,:) = [];
        end
        %If they are not combinations, just take the third column
        if  varargout{r}(ieve,4) == 0;
            varargout{r}(ieve,4) = varargout{r}(ieve,3);
        end
        %Go to the next event
        ieve = ieve + 1;
    end
    
    %If the last events 4th column is empty, set it equal to the last trigger
    if  varargout{r}(end,4) == 0;
        varargout{r}(end,4) = varargout{r}(end,3);
    end
    %Remove the second and third columns... they were temporary for this script
    varargout{r}(:,2:3) = [];
end

events = varargout;
%We end with each row being an event... column 1 as the first sample
%(beginning of epoch) column two as the trigger code value