function cluster_statistics = clusterTest(event_data,params,save_to_file)

if nargin<3
    save_to_file = 0;
end

%Initialize cluster test parameters
cfg=[];
cfg.latency = [-.2 .8];
cfg.parameter = 'trial';
cfg.method = 'montecarlo';
cfg.correctm = 'cluster';
cfg.neighbours = [];
cfg.numrandomization = 1000;
cfg.statistic = 'indepsamplesT';
cfg.channel = 'all';
cfg.alpha = 0.05;

%Initialize output struct
cluster_stats = cfg;

%Get event type pairs
[pairs1, pairs2] = meshgrid(1:length(event_data),1:length(event_data));
pair_grid = [pairs1(:) pairs2(:)];
cluster_stats.pair_grid = pair_grid;

%Conduct permutation test on each event type pair
for i = 1 : length(pair_grid)
    cluster_stats.stats{i} = ft_timelockstatistics(cfg,event_data{pair_grid(i,1)},event_data{pair_grid(i,2)});
end

%Save to file if desired
if save_to_file
    file_name = sprintf('%s/%s_stats.mat',params.analysis_dir,params.subject);
    disp(['Saving to ' file_name]);
    save(file_name,'cluster_stats');
end

end

    