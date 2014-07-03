function plots_by_channel(avg_data,params,visible)

%% single channel plots
%create x axis line
%params.prestim = -0.3;
%params.poststim = 0.7;
%params.proc = 'LFP';
%plots auto scale single channel
%params.channels to specify which channels to plot;
%
%test

%If otherwise unspecified, allow graphics output of plots
if nargin<3
    visible = 1;
end

% %identifies if lfp or hgp data (working on a solution below)
% if isfield(avg_data{1}.cfg.previous{1},'hilbert')==1 && strcmp(avg_data{1}.cfg.previous{1}.hilbert,'abs') || strcmpi(avg_data{1}.cfg.hilbert,'abs')
%     proc = 1; proc_name = 'HGP';
% else proc = 0; proc_name = 'LFP';
% end

%identifies if lfp or hgp data
if isfield(avg_data{1}.cfg,'hilbert') && strcmpi(avg_data{1}.cfg.hilbert,'abs')
    proc = 1; proc_name = 'HGP';
else proc = 0; proc_name = 'LFP';
end


%Directory to place the plots
plotdir = sprintf('%s/%s_plots',params.analysis_dir,proc_name);
if ~exist(plotdir,'dir')==1, mkdir(plotdir), end

%Determine which channels to plot
if isfield(params,'plotchan')==1
    if strcmp(params.plotchan,'all')
        channels = 1:length(avg_data{1}.label);
    else
        disp('Looking for specific channels to plot...');
        channels = find(ismember(avg_data{1}.label,params.plotchan)==1);
    end
        
    %Otherwise just plot them all
else channels = 1:length(avg_data{1}.label);
end

line_colors = [[0 1 0];[0 0 1];[1 0 0]];

%%
clear yevent event_name legend_names
for i = 1:length(params.plotevt)
    yevent(i) = find(params.events==params.plotevt(i));
    event_name{i} = params.event_names{yevent(i)};
    legend_names{i} = [event_name{i} ' N=' num2str(length(avg_data{yevent(i)}.trialinfo))];
end

% leg_names = cat(1,event1_name,event2_name); %defines legend

%The number of channels (plots)
%25 channels per plot
chan_length = length(channels);
plot_length = floor(chan_length/25);
if chan_length > plot_length*25
    plot_length = plot_length+1;
end

%For plots filled with 25 channels...
for iplot = 1:plot_length
    close all;
    h=custom_figure(50,50,visible);
    
    if iplot == plot_length
        panel_num = rem(chan_length,25);
    else
        panel_num = 25;
    end
    
    %K is the subplot per page
    for k = 1:panel_num
        h(k) = subplot(5,5,k);
        subplot(h(k));
        ichan = k+(iplot-1)*25;
        
        chan = avg_data{1}.label{ichan};
        chan = strrep(chan,'_','-');
        
        for ieve = 1:length(yevent)
            ymax(ieve) = max(abs(avg_data{yevent(ieve)}.avg(ichan,20:end-20)))*1.2; % because of edge effect
            yft(ieve,:) = avg_data{yevent(ieve)}.avg(ichan,:);
        end
        ymax_val = max(ymax); %largest y-axis value
        %Dynamically generates the appropriate axes ranges for the plots
%         if proc ==1 && ymax_val <0.3 %sets y-max as 0.3 for hgp data and 30 for lfp data
%             ymax_val = 0.3;
%         elseif proc==0 && ymax_val<40
%             ymax_val = 40;
%         end
        
        xft = avg_data{1}.timeavg;
        
        %plot responses
        for ieve = 1:length(yevent)
            confplot_3andC(xft,yft(ieve,:),...
                sqrt(avg_data{yevent(ieve)}.var(ichan,:)) ./ sqrt(length(avg_data{yevent(ieve)}.trialinfo)), ...
                line_colors(ieve,:)); hold on;
        end
        hold on, plot([0 0],[-ymax_val ymax_val],'color',[0.6 0.6 0.6]);
        
        axis([params.prestim params.poststim -ymax_val ymax_val]);
        % axis([params.prestim params.poststim -.05 .05]);
        % set background color and line handles
        set(gcf, 'Color', 'w');
        title(sprintf('%s %s',proc_name,chan),'FontSize',16);
        if k == 1
            xlabel('Time (sec)');
            %TO DO - enter appropriate ylabel ylabel('xxx');
        end
    end
    %creates legend
    newPosition = [0.04 0.88 0.05 0.05];
    newUnits = 'normalized';
    hleg = legend(legend_names);
    set(hleg, 'Box', 'off'); hold on;
    set(hleg,'Position', newPosition,'Units', newUnits);
    
%     leg_line=findobj(hleg,'type','Line');
%     set(leg_line(4), 'Color', [0 0 1]);
%     set(leg_line(2), 'Color', [1 0 0]);
    
    %TO DO - put channel information into fig name
    export_fig(sprintf('%s/%s_%s_%s_CLIN%d_%druns_multiplot%d.png',...
        plotdir,params.subject,params.experiment,proc_name,params.clinsys,length(avg_data{1}.cfg.previous),iplot),'-a1','-nocrop');
end




