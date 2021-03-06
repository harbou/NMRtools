function acqs = readpv_acqs(dirname,acqspars)

%% Initialise
dirname = checkdir(dirname,'Open Bruker experiment number');
if nargin < 2
    acqspars = struct([]);
end

%% Get parameters
acqs.pars = readpv_acqs_pars(dirname,acqspars);
acqs.axes = readpv_acqs_axes(dirname,acqs.pars);
%% Read processed data
acqsfile = {fullfile(dirname,'fid'),fullfile(dirname,'ser')};
if (exist(acqsfile{1},'file') == 2)||(exist(acqsfile{2},'file') == 2)
    acqs.data = readpv_acqs_data(dirname,acqs.pars.data);
else
    warning('NMRread:FileNotFound','No acquisition data: %s or ser is missing.',acqsfile{1})
end

%% Terminate
end