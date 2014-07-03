function [app_data] = append_data(delta_data, parms)

%Wow... this is coded so strangely!
%Basically... if there is more than one run, we use ft_appenddata but also
%make sure sampleinfo is 
if parms.runs ==1
    app_data = delta_data{1};
elseif parms.runs == 2
cfg = [];
cfg.continuous = 'no';
app_data = ft_appenddata(cfg, delta_data{1},delta_data{2});
app_data.sampleinfo = cat(1,delta_data{1}.sampleinfo,delta_data{2}.sampleinfo);
elseif parms.runs == 3
cfg = [];
cfg.continuous = 'no';
app_data = ft_appenddata(cfg, delta_data{1},delta_data{2},delta_data{3});
app_data.sampleinfo = cat(1,delta_data{1}.sampleinfo,delta_data{2}.sampleinfo,delta_data{3}.sampleinfo);
elseif parms.runs == 4
cfg = [];
cfg.continuous = 'no';
app_data = ft_appenddata(cfg, delta_data{1},delta_data{2},delta_data{3},delta_data{4});
app_data.sampleinfo = cat(1,delta_data{1}.sampleinfo,delta_data{2}.sampleinfo,delta_data{3}.sampleinfo,delta_data{4}.sampleinfo);
elseif parms.runs == 5
cfg = [];
cfg.continuous = 'no';
app_data = ft_appenddata(cfg, delta_data{1},delta_data{2},delta_data{3},delta_data{4},delta_data{5});
app_data.sampleinfo = cat(1,delta_data{1}.sampleinfo,delta_data{2}.sampleinfo,delta_data{3}.sampleinfo,delta_data{4}.sampleinfo,...
    delta_data{5}.sampleinfo);
elseif parms.runs == 6
cfg = [];
cfg.continuous = 'no';
app_data = ft_appenddata(cfg, delta_data{1},delta_data{2},delta_data{3},delta_data{4},delta_data{5},delta_data{6});
app_data.sampleinfo = cat(1,delta_data{1}.sampleinfo,delta_data{2}.sampleinfo,delta_data{3}.sampleinfo,delta_data{4}.sampleinfo,...
    delta_data{5}.sampleinfo,delta_data{6}.sampleinfo);
elseif parms.runs == 7
cfg = [];
cfg.continuous = 'no';
app_data = ft_appenddata(cfg, delta_data{1},delta_data{2},delta_data{3},delta_data{4},delta_data{5},delta_data{6},delta_data{7});
app_data.sampleinfo = cat(1,delta_data{1}.sampleinfo,delta_data{2}.sampleinfo,delta_data{3}.sampleinfo,delta_data{4}.sampleinfo,...
    delta_data{5}.sampleinfo,delta_data{6}.sampleinfo,delta_data{7}.sampleinfo);
elseif parms.runs == 8
cfg = [];
cfg.continuous = 'no';
app_data = ft_appenddata(cfg, delta_data{1},delta_data{2},delta_data{3},delta_data{4},delta_data{5},delta_data{6},delta_data{7},delta_data{8});
app_data.sampleinfo = cat(1,delta_data{1}.sampleinfo,delta_data{2}.sampleinfo,delta_data{3}.sampleinfo,delta_data{4}.sampleinfo,...
    delta_data{5}.sampleinfo,delta_data{6}.sampleinfo,delta_data{7}.sampleinfo,delta_data{8}.sampleinfo);
elseif parms.runs == 9
cfg = [];
cfg.continuous = 'no';
app_data = ft_appenddata(cfg, delta_data{1},delta_data{2},delta_data{3},delta_data{4},delta_data{5},delta_data{6},delta_data{7},delta_data{8},delta_data{9});
app_data.sampleinfo = cat(1,delta_data{1}.sampleinfo,delta_data{2}.sampleinfo,delta_data{3}.sampleinfo,delta_data{4}.sampleinfo,...
    delta_data{5}.sampleinfo,delta_data{6}.sampleinfo,delta_data{7}.sampleinfo,delta_data{8}.sampleinfo,delta_data{9}.sampleinfo);
elseif parms.runs == 10
cfg = [];
cfg.continuous = 'no';
app_data = ft_appenddata(cfg, delta_data{1},delta_data{2},delta_data{3},delta_data{4},delta_data{5},delta_data{6},delta_data{7},delta_data{8},delta_data{9},delta_data{10});
app_data.sampleinfo = cat(1,delta_data{1}.sampleinfo,delta_data{2}.sampleinfo,delta_data{3}.sampleinfo,delta_data{4}.sampleinfo,...
    delta_data{5}.sampleinfo,delta_data{6}.sampleinfo,delta_data{7}.sampleinfo,delta_data{8}.sampleinfo,delta_data{9}.sampleinfo,delta_data{10}.sampleinfo);
elseif parms.runs == 11
cfg = [];
cfg.continuous = 'no';
app_data = ft_appenddata(cfg, delta_data{1},delta_data{2},delta_data{3},delta_data{4},delta_data{5},delta_data{6},delta_data{7},delta_data{8},delta_data{9},delta_data{10},delta_data{11});
app_data.sampleinfo = cat(1,delta_data{1}.sampleinfo,delta_data{2}.sampleinfo,delta_data{3}.sampleinfo,delta_data{4}.sampleinfo,...
    delta_data{5}.sampleinfo,delta_data{6}.sampleinfo,delta_data{7}.sampleinfo,delta_data{8}.sampleinfo,delta_data{9}.sampleinfo,delta_data{10}.sampleinfo,delta_data{11}.sampleinfo);
elseif parms.runs == 12
cfg = [];
cfg.continuous = 'yes';
app_data = ft_appenddata(cfg, delta_data{1},delta_data{2},delta_data{3},delta_data{4},delta_data{5},delta_data{6},delta_data{7},delta_data{8},delta_data{9},delta_data{10},delta_data{11},delta_data{12});
app_data.sampleinfo = cat(1,delta_data{1}.sampleinfo,delta_data{2}.sampleinfo,delta_data{3}.sampleinfo,delta_data{4}.sampleinfo,...
 delta_data{5}.sampleinfo,delta_data{6}.sampleinfo,delta_data{7}.sampleinfo,delta_data{8}.sampleinfo,delta_data{9}.sampleinfo,delta_data{10}.sampleinfo,delta_data{11}.sampleinfo,delta_data{12}.sampleinfo);
elseif parms.runs == 13
cfg = [];
cfg.continuous = 'no';
app_data = ft_appenddata(cfg, delta_data{1},delta_data{2},delta_data{3},delta_data{4},delta_data{5},delta_data{6},delta_data{7},delta_data{8},delta_data{9},delta_data{10},delta_data{11},delta_data{12},...
    delta_data{13});
app_data.sampleinfo = cat(1,delta_data{1}.sampleinfo,delta_data{2}.sampleinfo,delta_data{3}.sampleinfo,delta_data{4}.sampleinfo,...
    delta_data{5}.sampleinfo,delta_data{6}.sampleinfo,delta_data{7}.sampleinfo,delta_data{8}.sampleinfo,delta_data{9}.sampleinfo,delta_data{10}.sampleinfo,delta_data{11}.sampleinfo,delta_data{12}.sampleinfo,...
    delta_data{13}.sampleinfo);
elseif parms.runs == 14
cfg = [];
cfg.continuous = 'no';
app_data = ft_appenddata(cfg, delta_data{1},delta_data{2},delta_data{3},delta_data{4},delta_data{5},delta_data{6},delta_data{7},delta_data{8},delta_data{9},delta_data{10},delta_data{11},delta_data{12},...
    delta_data{13},delta_data{14});
app_data.sampleinfo = cat(1,delta_data{1}.sampleinfo,delta_data{2}.sampleinfo,delta_data{3}.sampleinfo,delta_data{4}.sampleinfo,...
    delta_data{5}.sampleinfo,delta_data{6}.sampleinfo,delta_data{7}.sampleinfo,delta_data{8}.sampleinfo,delta_data{9}.sampleinfo,delta_data{10}.sampleinfo,delta_data{11}.sampleinfo,delta_data{12}.sampleinfo,...
    delta_data{13}.sampleinfo,delta_data{14}.sampleinfo);
elseif parms.runs == 15
cfg = [];
cfg.continuous = 'no';
app_data = ft_appenddata(cfg, delta_data{1},delta_data{2},delta_data{3},delta_data{4},delta_data{5},delta_data{6},delta_data{7},delta_data{8},delta_data{9},delta_data{10},delta_data{11},delta_data{12},...
    delta_data{13},delta_data{14},delta_data{15});
app_data.sampleinfo = cat(1,delta_data{1}.sampleinfo,delta_data{2}.sampleinfo,delta_data{3}.sampleinfo,delta_data{4}.sampleinfo,...
    delta_data{5}.sampleinfo,delta_data{6}.sampleinfo,delta_data{7}.sampleinfo,delta_data{8}.sampleinfo,delta_data{9}.sampleinfo,delta_data{10}.sampleinfo,delta_data{11}.sampleinfo,delta_data{12}.sampleinfo,...
    delta_data{13}.sampleinfo,delta_data{14}.sampleinfo,delta_data{15}.sampleinfo);


elseif parms.runs == 16
cfg = [];
cfg.continuous = 'no';
app_data = ft_appenddata(cfg, delta_data{1},delta_data{2},delta_data{3},delta_data{4},delta_data{5},delta_data{6},delta_data{7},delta_data{8},delta_data{9},delta_data{10},delta_data{11},delta_data{12},...
    delta_data{13},delta_data{14},delta_data{15},delta_data{16});

app_data.sampleinfo = cat(1,delta_data{1}.sampleinfo,delta_data{2}.sampleinfo,delta_data{3}.sampleinfo,delta_data{4}.sampleinfo,...
    delta_data{5}.sampleinfo,delta_data{6}.sampleinfo,delta_data{7}.sampleinfo,delta_data{8}.sampleinfo,delta_data{9}.sampleinfo,delta_data{10}.sampleinfo,delta_data{11}.sampleinfo,delta_data{12}.sampleinfo,...
    delta_data{13}.sampleinfo,delta_data{14}.sampleinfo,delta_data{15}.sampleinfo,delta_data{16}.sampleinfo);


elseif parms.runs == 17
cfg = [];
cfg.continuous = 'no';
app_data = ft_appenddata(cfg, delta_data{1},delta_data{2},delta_data{3},delta_data{4},delta_data{5},delta_data{6},delta_data{7},delta_data{8},delta_data{9},delta_data{10},delta_data{11},delta_data{12},...
    delta_data{13},delta_data{14},delta_data{15},delta_data{16},delta_data{17});

app_data.sampleinfo = cat(1,delta_data{1}.sampleinfo,delta_data{2}.sampleinfo,delta_data{3}.sampleinfo,delta_data{4}.sampleinfo,...
    delta_data{5}.sampleinfo,delta_data{6}.sampleinfo,delta_data{7}.sampleinfo,delta_data{8}.sampleinfo,delta_data{9}.sampleinfo,delta_data{10}.sampleinfo,delta_data{11}.sampleinfo,delta_data{12}.sampleinfo,...
    delta_data{13}.sampleinfo,delta_data{14}.sampleinfo,delta_data{15}.sampleinfo,delta_data{16}.sampleinfo,delta_data{17}.sampleinfo);

elseif parms.runs == 18
cfg = [];
cfg.continuous = 'no';
app_data = ft_appenddata(cfg, delta_data{1},delta_data{2},delta_data{3},delta_data{4},delta_data{5},delta_data{6},delta_data{7},delta_data{8},delta_data{9},delta_data{10},delta_data{11},delta_data{12},...
    delta_data{13},delta_data{14},delta_data{15},delta_data{16},delta_data{17},delta_data{18});

app_data.sampleinfo = cat(1,delta_data{1}.sampleinfo,delta_data{2}.sampleinfo,delta_data{3}.sampleinfo,delta_data{4}.sampleinfo,...
    delta_data{5}.sampleinfo,delta_data{6}.sampleinfo,delta_data{7}.sampleinfo,delta_data{8}.sampleinfo,delta_data{9}.sampleinfo,delta_data{10}.sampleinfo,delta_data{11}.sampleinfo,delta_data{12}.sampleinfo,...
    delta_data{13}.sampleinfo,delta_data{14}.sampleinfo,delta_data{15}.sampleinfo,delta_data{16}.sampleinfo,delta_data{17}.sampleinfo,delta_data{18}.sampleinfo);

elseif parms.runs == 19
cfg = [];
cfg.continuous = 'no';
app_data = ft_appenddata(cfg, delta_data{1},delta_data{2},delta_data{3},delta_data{4},delta_data{5},delta_data{6},delta_data{7},delta_data{8},delta_data{9},delta_data{10},delta_data{11},delta_data{12},...
    delta_data{13},delta_data{14},delta_data{15},delta_data{16},delta_data{17},delta_data{18},delta_data{19});

app_data.sampleinfo = cat(1,delta_data{1}.sampleinfo,delta_data{2}.sampleinfo,delta_data{3}.sampleinfo,delta_data{4}.sampleinfo,...
    delta_data{5}.sampleinfo,delta_data{6}.sampleinfo,delta_data{7}.sampleinfo,delta_data{8}.sampleinfo,delta_data{9}.sampleinfo,delta_data{10}.sampleinfo,delta_data{11}.sampleinfo,delta_data{12}.sampleinfo,...
    delta_data{13}.sampleinfo,delta_data{14}.sampleinfo,delta_data{15}.sampleinfo,delta_data{16}.sampleinfo,delta_data{17}.sampleinfo,delta_data{18}.sampleinfo,...
    delta_data{19}.sampleinfo);


elseif parms.runs == 20
cfg = [];
cfg.continuous = 'no';
app_data = ft_appenddata(cfg, delta_data{1},delta_data{2},delta_data{3},delta_data{4},delta_data{5},delta_data{6},delta_data{7},delta_data{8},delta_data{9},delta_data{10},delta_data{11},delta_data{12},...
    delta_data{13},delta_data{14},delta_data{15},delta_data{16},delta_data{17},delta_data{18},delta_data{19},delta_data{20});

app_data.sampleinfo = cat(1,delta_data{1}.sampleinfo,delta_data{2}.sampleinfo,delta_data{3}.sampleinfo,delta_data{4}.sampleinfo,...
    delta_data{5}.sampleinfo,delta_data{6}.sampleinfo,delta_data{7}.sampleinfo,delta_data{8}.sampleinfo,delta_data{9}.sampleinfo,delta_data{10}.sampleinfo,delta_data{11}.sampleinfo,delta_data{12}.sampleinfo,...
    delta_data{13}.sampleinfo,delta_data{14}.sampleinfo,delta_data{15}.sampleinfo,delta_data{16}.sampleinfo,delta_data{17}.sampleinfo,delta_data{18}.sampleinfo,...
    delta_data{19}.sampleinfo,delta_data{20}.sampleinfo);

elseif parms.runs == 21
cfg = [];
cfg.continuous = 'no';
app_data = ft_appenddata(cfg, delta_data{1},delta_data{2},delta_data{3},delta_data{4},delta_data{5},delta_data{6},delta_data{7},delta_data{8},delta_data{9},delta_data{10},delta_data{11},delta_data{12},...
    delta_data{13},delta_data{14},delta_data{15},delta_data{16},delta_data{17},delta_data{18},delta_data{19},delta_data{20},delta_data{21});

app_data.sampleinfo = cat(1,delta_data{1}.sampleinfo,delta_data{2}.sampleinfo,delta_data{3}.sampleinfo,delta_data{4}.sampleinfo,...
    delta_data{5}.sampleinfo,delta_data{6}.sampleinfo,delta_data{7}.sampleinfo,delta_data{8}.sampleinfo,delta_data{9}.sampleinfo,delta_data{10}.sampleinfo,delta_data{11}.sampleinfo,delta_data{12}.sampleinfo,...
    delta_data{13}.sampleinfo,delta_data{14}.sampleinfo,delta_data{15}.sampleinfo,delta_data{16}.sampleinfo,delta_data{17}.sampleinfo,delta_data{18}.sampleinfo,...
    delta_data{19}.sampleinfo,delta_data{20}.sampleinfo,delta_data{21}.sampleinfo);

elseif parms.runs == 22
cfg = [];
cfg.continuous = 'no';
app_data = ft_appenddata(cfg, delta_data{1},delta_data{2},delta_data{3},delta_data{4},delta_data{5},delta_data{6},delta_data{7},delta_data{8},delta_data{9},delta_data{10},delta_data{11},delta_data{12},...
    delta_data{13},delta_data{14},delta_data{15},delta_data{16},delta_data{17},delta_data{18},delta_data{19},delta_data{20},delta_data{21},delta_data{22});

app_data.sampleinfo = cat(1,delta_data{1}.sampleinfo,delta_data{2}.sampleinfo,delta_data{3}.sampleinfo,delta_data{4}.sampleinfo,...
    delta_data{5}.sampleinfo,delta_data{6}.sampleinfo,delta_data{7}.sampleinfo,delta_data{8}.sampleinfo,delta_data{9}.sampleinfo,delta_data{10}.sampleinfo,delta_data{11}.sampleinfo,delta_data{12}.sampleinfo,...
    delta_data{13}.sampleinfo,delta_data{14}.sampleinfo,delta_data{15}.sampleinfo,delta_data{16}.sampleinfo,delta_data{17}.sampleinfo,delta_data{18}.sampleinfo,...
    delta_data{19}.sampleinfo,delta_data{20}.sampleinfo,delta_data{21}.sampleinfo,delta_data{22}.sampleinfo);


elseif parms.runs == 23
cfg = [];
cfg.continuous = 'no';
app_data = ft_appenddata(cfg, delta_data{1},delta_data{2},delta_data{3},delta_data{4},delta_data{5},delta_data{6},delta_data{7},delta_data{8},delta_data{9},delta_data{10},delta_data{11},delta_data{12},...
    delta_data{13},delta_data{14},delta_data{15},delta_data{16},delta_data{17},delta_data{18},delta_data{19},delta_data{20},delta_data{21},delta_data{22},delta_data{23});

app_data.sampleinfo = cat(1,delta_data{1}.sampleinfo,delta_data{2}.sampleinfo,delta_data{3}.sampleinfo,delta_data{4}.sampleinfo,...
    delta_data{5}.sampleinfo,delta_data{6}.sampleinfo,delta_data{7}.sampleinfo,delta_data{8}.sampleinfo,delta_data{9}.sampleinfo,delta_data{10}.sampleinfo,delta_data{11}.sampleinfo,delta_data{12}.sampleinfo,...
    delta_data{13}.sampleinfo,delta_data{14}.sampleinfo,delta_data{15}.sampleinfo,delta_data{16}.sampleinfo,delta_data{17}.sampleinfo,delta_data{18}.sampleinfo,...
    delta_data{19}.sampleinfo,delta_data{20}.sampleinfo,delta_data{21}.sampleinfo,delta_data{22}.sampleinfo,delta_data{23}.sampleinfo);


elseif parms.runs == 24
cfg = [];
cfg.continuous = 'no';
app_data = ft_appenddata(cfg, delta_data{1},delta_data{2},delta_data{3},delta_data{4},delta_data{5},delta_data{6},delta_data{7},delta_data{8},delta_data{9},delta_data{10},delta_data{11},delta_data{12},...
    delta_data{13},delta_data{14},delta_data{15},delta_data{16},delta_data{17},delta_data{18},delta_data{19},delta_data{20},delta_data{21},delta_data{22},delta_data{23},...
    delta_data{24});

app_data.sampleinfo = cat(1,delta_data{1}.sampleinfo,delta_data{2}.sampleinfo,delta_data{3}.sampleinfo,delta_data{4}.sampleinfo,...
    delta_data{5}.sampleinfo,delta_data{6}.sampleinfo,delta_data{7}.sampleinfo,delta_data{8}.sampleinfo,delta_data{9}.sampleinfo,delta_data{10}.sampleinfo,delta_data{11}.sampleinfo,delta_data{12}.sampleinfo,...
    delta_data{13}.sampleinfo,delta_data{14}.sampleinfo,delta_data{15}.sampleinfo,delta_data{16}.sampleinfo,delta_data{17}.sampleinfo,delta_data{18}.sampleinfo,...
    delta_data{19}.sampleinfo,delta_data{20}.sampleinfo,delta_data{21}.sampleinfo,delta_data{22}.sampleinfo,delta_data{23}.sampleinfo,delta_data{24}.sampleinfo);


elseif parms.runs == 25
cfg = [];
cfg.continuous = 'no';
app_data = ft_appenddata(cfg, delta_data{1},delta_data{2},delta_data{3},delta_data{4},delta_data{5},delta_data{6},delta_data{7},delta_data{8},delta_data{9},delta_data{10},delta_data{11},delta_data{12},...
    delta_data{13},delta_data{14},delta_data{15},delta_data{16},delta_data{17},delta_data{18},delta_data{19},delta_data{20},delta_data{21},delta_data{22},delta_data{23},...
    delta_data{24},delta_data{25});

app_data.sampleinfo = cat(1,delta_data{1}.sampleinfo,delta_data{2}.sampleinfo,delta_data{3}.sampleinfo,delta_data{4}.sampleinfo,...
    delta_data{5}.sampleinfo,delta_data{6}.sampleinfo,delta_data{7}.sampleinfo,delta_data{8}.sampleinfo,delta_data{9}.sampleinfo,delta_data{10}.sampleinfo,delta_data{11}.sampleinfo,delta_data{12}.sampleinfo,...
    delta_data{13}.sampleinfo,delta_data{14}.sampleinfo,delta_data{15}.sampleinfo,delta_data{16}.sampleinfo,delta_data{17}.sampleinfo,delta_data{18}.sampleinfo,...
    delta_data{19}.sampleinfo,delta_data{20}.sampleinfo,delta_data{21}.sampleinfo,delta_data{22}.sampleinfo,delta_data{23}.sampleinfo,delta_data{24}.sampleinfo,delta_data{25}.sampleinfo);


elseif parms.runs == 26
cfg = [];
cfg.continuous = 'no';
app_data = ft_appenddata(cfg, delta_data{1},delta_data{2},delta_data{3},delta_data{4},delta_data{5},delta_data{6},delta_data{7},delta_data{8},delta_data{9},delta_data{10},delta_data{11},delta_data{12},...
    delta_data{13},delta_data{14},delta_data{15},delta_data{16},delta_data{17},delta_data{18},delta_data{19},delta_data{20},delta_data{21},delta_data{22},delta_data{23},...
    delta_data{24},delta_data{25},delta_data{26});

app_data.sampleinfo = cat(1,delta_data{1}.sampleinfo,delta_data{2}.sampleinfo,delta_data{3}.sampleinfo,delta_data{4}.sampleinfo,...
    delta_data{5}.sampleinfo,delta_data{6}.sampleinfo,delta_data{7}.sampleinfo,delta_data{8}.sampleinfo,delta_data{9}.sampleinfo,delta_data{10}.sampleinfo,delta_data{11}.sampleinfo,delta_data{12}.sampleinfo,...
    delta_data{13}.sampleinfo,delta_data{14}.sampleinfo,delta_data{15}.sampleinfo,delta_data{16}.sampleinfo,delta_data{17}.sampleinfo,delta_data{18}.sampleinfo,...
    delta_data{19}.sampleinfo,delta_data{20}.sampleinfo,delta_data{21}.sampleinfo,delta_data{22}.sampleinfo,delta_data{23}.sampleinfo,delta_data{24}.sampleinfo,delta_data{25}.sampleinfo,delta_data{26}.sampleinfo);
elseif parms.runs == 27
cfg = [];
cfg.continuous = 'no';
app_data = ft_appenddata(cfg, delta_data{1},delta_data{2},delta_data{3},delta_data{4},delta_data{5},delta_data{6},delta_data{7},delta_data{8},delta_data{9},delta_data{10},delta_data{11},delta_data{12},...
    delta_data{13},delta_data{14},delta_data{15},delta_data{16},delta_data{17},delta_data{18},delta_data{19},delta_data{20},delta_data{21},delta_data{22},delta_data{23},...
    delta_data{24},delta_data{25},delta_data{26},delta_data{27});

app_data.sampleinfo = cat(1,delta_data{1}.sampleinfo,delta_data{2}.sampleinfo,delta_data{3}.sampleinfo,delta_data{4}.sampleinfo,...
    delta_data{5}.sampleinfo,delta_data{6}.sampleinfo,delta_data{7}.sampleinfo,delta_data{8}.sampleinfo,delta_data{9}.sampleinfo,delta_data{10}.sampleinfo,delta_data{11}.sampleinfo,delta_data{12}.sampleinfo,...
    delta_data{13}.sampleinfo,delta_data{14}.sampleinfo,delta_data{15}.sampleinfo,delta_data{16}.sampleinfo,delta_data{17}.sampleinfo,delta_data{18}.sampleinfo,...
    delta_data{19}.sampleinfo,delta_data{20}.sampleinfo,delta_data{21}.sampleinfo,delta_data{22}.sampleinfo,delta_data{23}.sampleinfo,delta_data{24}.sampleinfo,delta_data{25}.sampleinfo,delta_data{26}.sampleinfo,delta_data{27}.sampleinfo);

end
end