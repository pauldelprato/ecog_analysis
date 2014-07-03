function pairwise_plots_by_channel(avg_data,params,visible)

%% single channel plots
%create x axis line
%params.prestim = -0.3;
%params.poststim = 0.7;
%params.proc = 'LFP';
%plots auto scale single channel
%params.channels to specify which channels to plot;
%


%If otherwise unspecified, allow graphics output of plots
if nargin<3
    visible = 1;
end

%identifies if lfp or hgp data
if isfield(avg_data{1}.cfg,'hilbert')==1 && strcmp(avg_data{1}.cfg.hilbert,'abs')
proc = 1; proc_name = 'HGP';
else proc = 0; proc_name = 'LFP';
end

%Directory to place the plots
plotdir = sprintf('%s/%s_plots',params.analysis_dir,proc_name);
if ~exist(plotdir,'dir')==1, mkdir(plotdir), end

%Determine which channels to plot
if isfield(params,'channels')==1
    if strcmp(params.channels,'all')
        channels = 1:length(avg_data{1}.label);
    else
        disp('Looking for specific channels to plot...');
        channels = find(ismember(avg_data{1}.label,params.channels)==1);
    end
    
elseif isfield(params,'channel')==1,
    disp('Looking for specific channels to plot...');
    channels = find(ismember(avg_data{1}.label,params.channel)==1);
    
%Otherwise just plot them all
else channels = 1:length(avg_data{1}.label); 
end    

%sets up time x-axis
fs = abs(1/(abs(avg_data{1}.timeavg(1,1))- abs(avg_data{1}.timeavg(1,2))));  %td_data_cl{2}.fsample;
a = params.prestim;
b = params.poststim;
xhor = a:.1:b;
yhor = zeros(1,length(xhor));
st_diff = abs(avg_data{1}.timeavg(1))-abs(a);
end_amt =st_diff+abs(b)+abs(a);
xlim_indx1 = ceil(st_diff*fs);
xlim_indx2 = ceil(end_amt*fs);

%%
%For each combination
for combos = 1:length(params.combs)
if length(params.combs{combos})==2
    yevent1 = find(params.events==params.combs{combos}(1));%number corresponds to event data structure
    yevent2 = find(params.events==params.combs{combos}(2));
    event1_name = params.event_names(yevent1); %number corresponds to event data structure
    event2_name = params.event_names(yevent2); 
    leg_names = cat(1,event1_name,event2_name); %defines legend

%The number of channels (plots)
%25 channels per plot?
chan_length = length(channels);
plot_length = floor(chan_length/25);

%For plots filled with 25 channels...
for iplot = 1:plot_length
close all;
h=custom_figure(50,50,visible);

%K is the subplot per page
for k = 1:25
h(k) = subplot(5,5,k);
subplot(h(k));
ichan = k+(iplot-1)*25;

    cfg.channel = avg_data{2}.label{ichan};
    chan = cfg.channel;
    strrep(chan,'_','-');
    ymax1 = ceil(max(abs(avg_data{yevent1}.avg(ichan,:)))*1.2*100)/100;
    ymax2 = ceil(max(abs(avg_data{yevent2}.avg(ichan,:)))*1.2*100)/100;
    ymax_val = max(ymax1,ymax2); %largest y-axis value
  %Dynamically generates the appropriate axes ranges for the plots
    if proc ==1 && ymax_val <0.3 %sets y-max as 0.3 for hgp data and 30 for lfp data
        ymax_val = 0.3;
    elseif proc==0 && ymax_val<40
        ymax_val = 40;
    end
  
    %yvert = -ymax_val*1.5:ymax_val*1.5;
    yvert = -1000:1000;
    xvert = zeros(1,length(yvert)); 
   
    %create axes
    xft1 = avg_data{yevent1}.timeavg(1,xlim_indx1:xlim_indx2);
    yft1 = avg_data{yevent1}.avg(ichan,xlim_indx1:xlim_indx2);
    xft2 = avg_data{yevent2}.timeavg(1,xlim_indx1:xlim_indx2);
    yft2 = avg_data{yevent2}.avg(ichan,xlim_indx1:xlim_indx2);

        % plot axes
    h2= plot(xhor,yhor,xvert,yvert);
    set(h2(1),'LineWidth',0.5,'Color',[.5 .5 .5]);
    set(h2(2),'LineWidth',0.5,'Color',[.5 .5 .5]); hold on;
        %plot two lines
                            confplot_3andC(xft1,yft1,...
                            sqrt(avg_data{yevent1}.var(ichan,xlim_indx1:xlim_indx2)) ./ sqrt(length(avg_data{yevent1}.trialinfo)), ...
                            [0 0 1]); hold on;

                            confplot_3andC(xft2,yft2,...
                            sqrt(avg_data{yevent2}.var(ichan,xlim_indx1:xlim_indx2)) ./ sqrt(length(avg_data{yevent2}.trialinfo)), ...
                            [1 0 0]); 
    
    axis([params.prestim params.poststim -ymax_val ymax_val]);
   % axis([params.prestim params.poststim -.05 .05]);
   % set background color and line handles
    set(gcf, 'Color', 'w');
    title(sprintf('%s %s',proc_name,chan),'FontSize',16);
end
%creates legend   
newPosition = [0.05 0.88 0.05 0.05];
newUnits = 'normalized';
hleg = legend(leg_names);
set(hleg, 'Box', 'off'); hold on; 
set(hleg,'Position', newPosition,'Units', newUnits);

leg_line=findobj(hleg,'type','Line');
set(leg_line(4), 'Color', [0 0 1]);
set(leg_line(2), 'Color', [1 0 0]);

%TO DO - put channel information into fig name
export_fig(sprintf('%s/%s_%s_%s_%s_multiplot%d.png',plotdir,params.subject,proc_name,event1_name{1},event2_name{1},iplot),'-a1','-nocrop');
end

    
%The number of channels left    
rem_chan = chan_length - plot_length*25;


%For the final plot with <25 channels...
if rem_chan >0
close all;
h=custom_figure(50,50,visible);
for k = 1:rem_chan
h(k) = subplot(5,5,k);
subplot(h(k));
ichan = k+plot_length*25;
    cfg.channel = avg_data{2}.label{ichan};
    chan = cfg.channel;
    ymax1 = ceil(max(abs(avg_data{yevent1}.avg(ichan,:)))*1.2*100)/100;
    ymax2 = ceil(max(abs(avg_data{yevent2}.avg(ichan,:)))*1.2*100)/100;
    ymax_val = max(ymax1,ymax2); %largest y-axis value
    
    if proc ==1 && ymax_val <0.3 %sets y-max as 0.3 for hgp data and 30 for lfp data
        ymax_val = 0.3;
    elseif proc==0 && ymax_val<40
        ymax_val = 40;
    end
    
    %yvert = -ymax_val*1.5:ymax_val*1.5;
    yvert = -1000:1000;
    xvert = zeros(1,length(yvert)); 
   
    %create axes
    xft1 = avg_data{yevent1}.timeavg(1,xlim_indx1:xlim_indx2);
    yft1 = avg_data{yevent1}.avg(ichan,xlim_indx1:xlim_indx2);
    xft2 = avg_data{yevent2}.timeavg(1,xlim_indx1:xlim_indx2);
    yft2 = avg_data{yevent2}.avg(ichan,xlim_indx1:xlim_indx2);

        % plot axes
    h2= plot(xhor,yhor,xvert,yvert);
    set(h2(1),'LineWidth',0.5,'Color',[.5 .5 .5]);
    set(h2(2),'LineWidth',0.5,'Color',[.5 .5 .5]); hold on;
        %plot two lines
                            confplot_3andC(xft1,yft1,...
                            sqrt(avg_data{yevent1}.var(ichan,xlim_indx1:xlim_indx2)) ./ sqrt(length(avg_data{yevent1}.trialinfo)), ...
                            [0 0 1]); hold on;

                            confplot_3andC(xft2,yft2,...
                            sqrt(avg_data{yevent2}.var(ichan,xlim_indx1:xlim_indx2)) ./ sqrt(length(avg_data{yevent2}.trialinfo)), ...
                            [1 0 0]); 
    
    axis([params.prestim params.poststim -ymax_val ymax_val]);
   % axis([params.prestim params.poststim -.05 .05]);
   % set background color and line handles
    set(gcf, 'Color', 'w');
    title(sprintf('%s %s',proc_name,chan),'FontSize',16);
end
%creates legend   
newPosition = [0.05 0.88 0.05 0.05];
newUnits = 'normalized';
hleg = legend(leg_names);
set(hleg, 'Box', 'off'); hold on; 
set(hleg,'Position', newPosition,'Units', newUnits);

leg_line=findobj(hleg,'type','Line');
set(leg_line(4), 'Color', [0 0 1]);
set(leg_line(2), 'Color', [1 0 0]);

%TO DO - put channel information in plot name
export_fig(sprintf('%s/%s_%s_%s_%s_multiplot%d.png',plotdir,params.subject,proc_name,event1_name{1},event2_name{1},plot_length+1),'-a1','-nocrop');
    
end
else
    disp('Trigger code combinations must be of length 2. Please edit your combs field and try again.');

end   
end
