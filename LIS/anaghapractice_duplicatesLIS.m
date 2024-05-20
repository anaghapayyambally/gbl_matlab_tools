load LISAug23GC.mat

u_SID = unique(LISAug23GC.SID); % find unique sample IDs
u_SID(isnan(u_SID)) = []; % remove non-numeric values

match_SID = nan(length(u_SID),2); %create variable to store matching SID

%%
%find the cast and niskin

for i = 1:length(u_SID)
 %for i = 158 %I think i is row
     i_u_SID=find(LISAug23GC.SID == u_SID(i)); % find row of SID in table and find the cast and niskin number matching with same duplicates
     match_Cast=find(LISAug23GC.Cast(i_u_SID) == LISAug23GC.Cast); % matching Cast
     match_Niskin = find(LISAug23GC.Niskin(i_u_SID) == LISAug23GC.Niskin); % matching Niskin
     match_CastNiskin = intersect(match_Cast,match_Niskin) %matching both Cast and Niskin
     match_CastNiskin = sort(match_CastNiskin); % sort values low to high (not important)

     % now save the values into a row (to match the castniskin to a
     % variable
        if numel(match_CastNiskin)==1 % if there is only one matching value
            match_SID(i,1) = LISAug23GC.SID(match_CastNiskin); % 
        elseif numel(match_CastNiskin)==2 % if there is two matching values
            match_SID(i,:) = LISAug23GC.SID(match_CastNiskin);
        elseif numel(match_CastNiskin)>2 % if there is two matching values
            disp(['more than 2 matching values for SID = ',num2str(u_SID(i))]);   % this will come out if there are NaN values      
        end

end;
%%
% c2 is the unique values in column 1
% i2 is the index of the first unique value of every pair of replicates
[c2, i2] = unique(match_SID(:,1));

u_SID = match_SID(i2,:);
u_SID(isnan(u_SID(:,1)),:) = []; % if it is a nan, remove nan rows (we dont need this)

%% calculate mean & std
a=LISAug23GC; %make easy even to do other month cruises
usn=u_SID; % unique sample numbers

% preallocate variables
%Cruise = nan(length(usn),1);
%Cast = nan(length(usn),1);
%Station = nan(length(usn),1);
%Niskin = nan(length(usn),1);
mean_CH4_nM = nan(length(usn),1);
std_CH4_nM = nan(length(usn),1);
mean_N2O_nM = nan(length(usn),1);
std_N2O_nM = nan(length(usn),1);

for i=1:length(usn)
    %i=76 (always check like this and confirm mean and std are right)
    A=find(a.SID==usn(i,1)); % get index for duplicate A
    B=find(a.SID==usn(i,2)); % get index for duplicate B
    Cruise(i) = a.Cruise(A);
    Cast(i) = a.Cast(A);
    Station(i) = a.Station(A);
    Niskin(i) = a.Niskin(A);
    mean_CH4_nM(i) = mean(a.CH4nM([A,B]));
    std_CH4_nM(i)=std(a.CH4nM([A,B]));

    mean_N2O_nM(i) = mean(a.N2OnM([A,B]));
    std_N2O_nM(i)=std(a.N2OnM([A,B]));
end;

%%
Cruise = Cruise'; %to flip the orientation inorder to get in a single column
a_m = table(Cruise); %convert to a table
a_m.Cast = Cast';
a_m.Niskin = Niskin';
a_m.mean_CH4_nM = mean_CH4_nM;
a_m.std_CH4_nM = std_CH4_nM;
a_m.mean_N2O_nM = mean_N2O_nM;
a_m.std_N2O_nM = std_N2O_nM;

%%
LISAug23_CH4N2O = a_m;
save LISAug23_CH4N2O.mat LISAug23_CH4N2O; %change this if this is october

%% to add depth

A= find (a_m.Cast=='Ca22');

a_m.mean_CH4_nM(A)
