function plots_by_trial(avg_data,params,sensor_name,visible)
%Not completed

%% single channel plots
%create x axis line
%params.prestim = -0.3;
%params.poststim = 0.7;
%params.proc = 'LFP';
%plots auto scale single channel
%params.channels to specify which channels to plot;
%


%If otherwise unspecified, allow graphics output of plots
if nargin<4
    visible = 1;
end

if nargin<3
    error('Please provide specific sensor name. If you want to plot all, please use plots_by_channel');
end

%identifies if lfp or hgp data (To do - better way?()
if isfield(avg_data{1}.cfg.previous{1},'hilbert')==1 && strcmp(avg_data{1}.cfg.previous{1}.hilbert,'abs')
    proc = 1; proc_name = 'HGP';
else proc = 0; proc_name = 'LFP';
end

%Directory to place the plots
plotdir = sprintf('%s/%s_plots',params.analysis_dir,proc_name);
if ~exist(plotdir,'dir')==1, mkdir(plotdir), end

%Determine which channels to plot
channels = sensor_name;

line_colors = [[0 1 0];[0 0 1];[1 0 0]];

%%
clear yevent event_name legend_names
for i = 1:length(params.plotevt)
    yevent(i) = find(params.events==params.plotevt(i));
    event_name{i} = params.event_names{yevent(i)};
    legend_names{i} = [event_name{i} ' N=1'];
end

% leg_names = cat(1,event1_name,event2_name); %defines legend

%The number of channels (plots)
%25 trials per plotnum_trials
num_trials = length(params.my_trl{1});
plot_length = floor(num_trials/25);
if num_trials > plot_length*25
    plot_length = plot_length+1;
end

%For plots filled with 25 trials...
for iplot = 1:plot_length
    close all;
    h=custom_figure(50,50,visible);
    
    if iplot == plot_length
        panel_num = rem(num_trials,25);
    else
        panel_num = 25;
    end
    
    %K is the subplot per page
    for k = 1:panel_num
        h(k) = subplot(5,5,k);
        subplot(h(k));
        itrl = k+(iplot-1)*25;
        
        
        trl = avg_data{1}.trial{itrl};
        trl = strrep(trl,'_','-');
        
        %Figure out what this does
        for ieve = 1:length(yevent)
            ymax(ieve) = max(abs(avg_data{yevent(ieve)}.avg(itrl,20:end-20)))*1.2; % because of edge effect
            yft(ieve,:) = avg_data{yevent(ieve)}.avg(itrl,:);
        end
        
        ymax_val = max(ymax); %largest y-axis value
        
        xft = avg_data{1}.timeavg;
        
        %plot responses, using no confidence judgment value (arg 3)
        for ieve = 1:length(yevent)
            confplot_3andC(xft,yft(itrl,:),0,line_colors(ieve,:)); hold on;
        end
        hold on, plot([0 0],[-ymax_val ymax_val],'color',[0.6 0.6 0.6]);
        
        axis([params.prestim params.poststim -ymax_val ymax_val]);
        % axis([params.prestim params.poststim -.05 .05]);
        % set background color and line handles
        set(gcf, 'Color', 'w');
        title(sprintf('%s %s',proc_name,trl),'FontSize',16);
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
    export_fig(sprintf('%s/%s_%s_%s_CLIN%d_%druns_multiplot%s%d.png',...
        plotdir,params.subject,params.experiment,proc_name,params.clinsys,length(avg_data{1}.cfg.previous),sensor_name,iplot),'-a1','-nocrop');
end




