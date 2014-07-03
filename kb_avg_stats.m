function stats = kb_avg_stats(event_data,parms)

% calculating statistics cell
event_length = length(event_data);
for ev = 2:event_length-1
add_value(ev) = event_length-1;
event_length = event_length-1;
end

for isum = 2:length(add_value)
sum_value(isum) = sum(add_value(1:isum));
end


for ev1 = 1:length(event_data);
for ev2 = ev1+1:9

stat_indx = sum_value(ev1) + ev2-ev1; 

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

stats{stat_indx} = ft_timelockstatistics(cfg, event_data{ev1}, event_data{ev2});

outFileName = sprintf('%s/%s_stats.mat',parms.analysis_dir,parms.subject);
disp(['Saving to ' outFileName]);
save(outFileName,'stats')

end
end

end