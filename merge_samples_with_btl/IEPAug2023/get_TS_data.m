% sample indices from the run


%%
SID = [197
774
249
264
161
140
278
225
152
168
148
163
187
202
214
244
159
241
];
%%
run_data = table(SID); % create a table
%%
load IEP_SID_TS.mat

% now find the row in IEP_SID_TS that matches the SID of each sample in the
% run

% note: some of the sample IDs around 766 seem to be matching with multiple
% niskin bottles - need to check how the data was sorted
IEP_SID_TS_index = nan.*run_data.SID;
for i = 1:length(run_data.SID)
    IEP_SID_TS_index_i = find(IEP_SID_TS.SID == run_data.SID(i));
    if numel(IEP_SID_TS_index_i) ~= 1
       disp(['for index ', num2str(i), ' zero or multiple values matching SID'])
    else
       IEP_SID_TS_index(i) = IEP_SID_TS_index_i;
    end;
end
%%
run_data.T = IEP_SID_TS.T(IEP_SID_TS_index);
run_data.S = IEP_SID_TS.S(IEP_SID_TS_index);
run_data.dens = IEP_SID_TS.dens(IEP_SID_TS_index);
run_data.O = IEP_SID_TS.O(IEP_SID_TS_index);
run_data.D = IEP_SID_TS.D(IEP_SID_TS_index);
run_data.Station = IEP_SID_TS.Station(IEP_SID_TS_index);
run_data.Niskin = IEP_SID_TS.Niskin(IEP_SID_TS_index);

%%
writetable(run_data,'run_data.csv')

%% now calculate the exact density for the air-eq samples

T_eq = [22.39
22.39
5
5
];

S = 0.*T_eq;

P = 0.*T_eq;

dens = sw_dens(S,T_eq,P);
