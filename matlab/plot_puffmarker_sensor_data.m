clear all;
dir = 'C:\Users\nsleheen\DATA\csvdataSI_new\p01\s03\';
dir = 'C:\Users\nsleheen\DATA\RICE_TESTING\2008\s01\';

rip = importdata([dir 'rip.csv']);
% left_accelx = importdata([dir 'left-wrist-accelx.csv']);
left_accely = importdata([dir 'left-wrist-accely.csv']);
% left_accelz = importdata([dir 'left-wrist-accelz.csv']);

% left_gyrox = importdata([dir 'left-wrist-gyrox.csv']);
left_gyroy = importdata([dir 'left-wrist-gyroy.csv']);
% left_gyroz = importdata([dir 'left-wrist-gyroz.csv']);

% right_accelx = importdata([dir 'right-wrist-accelx.csv']);
right_accely = importdata([dir 'right-wrist-accely.csv']);
% right_accelz = importdata([dir 'right-wrist-accelz.csv']);

% right_gyrox = importdata([dir 'right-wrist-gyrox.csv']);
right_gyroy = importdata([dir 'right-wrist-gyroy.csv']);
% right_gyroz = importdata([dir 'right-wrist-gyroz.csv']);

plot_signal(rip(:,1), rip(:,2)/2000, '-'); hold on;
% plot_signal(rip(:,1), rip(:,2)/2000, '-'); hold on;

% plot_signal(left_accelx(:,1), left_accelx(:,2)+3, '-');hold on;
plot_signal(left_accely(:,1), left_accely(:,2)+4, '.');hold on;
plot_signal(left_accely(:,1), 4, '--');hold on;
% plot_signal(left_accelz(:,1), left_accelz(:,2)+3, '-');hold on;
% plot_signal(left_gyrox(:,1), left_gyrox(:,2)/250+6, '-');hold on;
plot_signal(left_gyroy(:,1), left_gyroy(:,2)/250+9, '-');hold on;
% plot_signal(left_gyroz(:,1), left_gyroz(:,2)/250+6, '-');hold on;


% plot_signal(right_accelx(:,1), right_accelx(:,2)+9, '-');hold on;
plot_signal(right_accely(:,1), right_accely(:,2)+6, '.');hold on;
plot_signal(right_accely(:,1), 6, '--');hold on;
% plot_signal(right_accelz(:,1), right_accelz(:,2)+9, '-');hold on;

% plot_signal(right_gyrox(:,1), right_gyrox(:,2)/250+12, '-');hold on;
plot_signal(right_gyroy(:,1), right_gyroy(:,2)/250+12, '-');hold on;
% plot_signal(right_gyroz(:,1), right_gyroz(:,2)/250+12, '-');hold on;


