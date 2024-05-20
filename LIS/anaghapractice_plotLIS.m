load LISAug23_CH4N2O_CTD.mat
LIS = LISAug23_CH4N2O_CTD;

stn= 'EXCR-cast01';
A=find(LIS.Station==stn)

figure(1)
clf; hold on;

subplot(1,2,1)
hold on;
stn="EXCR-cast01";
A=find(LIS.Station==stn & isnumeric(LIS.Lon));

errorbar(LIS.mean_CH4_nM(A),LIS.Depth(A),LIS.std_CH4_nM(A),'horizontal','o-b','linewidth',2,'markerfacecolor','b');
xlabel('CH_4 (nM)');
ylabel('Depth (m)');
title(stn);
axis ij;

%%
dl = [0:0.5:20]'; % depths for interpolation every 0.5 m from 0 to 20 m (prime for making it colum)
x = [1 3 5 7 9 11 13 14]; % fake x values for interpolation of stations (normally this is time)
n_stn = numel(x);

%%
CH4i = nan(numel(dl),n_stn); %(building a grid to store CH4 values)

dl_grid = repmat(dl,1,n_stn); %d1-matrix to repeat 1 time (depth)

x_grid = repmat(x,length(dl),1); %created the grid

stn="MID4-cast01";
A=find(LIS.Station==stn & isnumeric(LIS.Lon));
CH4i(:,1) = interp1(LIS.Depth(A),LIS.mean_CH4_nM(A),dl);%repeat the code

stn="MID4-cast03";
A=find(LIS.Station==stn & isnumeric(LIS.Lon));
CH4i(:,2) = interp1(LIS.Depth(A),LIS.mean_CH4_nM(A),dl);

stn="MID4-cast05";
A=find(LIS.Station==stn & isnumeric(LIS.Lon));
CH4i(:,3) = interp1(LIS.Depth(A),LIS.mean_CH4_nM(A),dl);

stn="MID4-cast07";
A=find(LIS.Station==stn & isnumeric(LIS.Lon));
CH4i(:,4) = interp1(LIS.Depth(A),LIS.mean_CH4_nM(A),dl);

stn="MID4-cast09";
A=find(LIS.Station==stn & isnumeric(LIS.Lon));
CH4i(:,5) = interp1(LIS.Depth(A),LIS.mean_CH4_nM(A),dl);

stn="MID4-cast11";
A=find(LIS.Station==stn & isnumeric(LIS.Lon));
CH4i(:,6) = interp1(LIS.Depth(A),LIS.mean_CH4_nM(A),dl);

stn="MID4-cast13";
A=find(LIS.Station==stn & isnumeric(LIS.Lon));
CH4i(:,7) = interp1(LIS.Depth(A),LIS.mean_CH4_nM(A),dl);

stn="MID4-cast14";
A=find(LIS.Station==stn & isnumeric(LIS.Lon));
CH4i(:,8) = interp1(LIS.Depth(A),LIS.mean_CH4_nM(A),dl);



Clevel = [40:80];
figure(2)
clf; hold on;
contourf(x_grid,dl_grid,CH4i, Clevel,'edgecolor','none') %contour fill with no lines in between
axis ij; %to make depth increasing order
c = colorbar;
c.Label.String = 'CH_4(nM)';
c.Label.Fontsize = 16;


