clear all;
PIDS = {'p6000', 'p6001', 'p6002', 'p6003'};

% PIDS = {'p6000', 'p6001', 'p6002', 'p6003', 'p6006', 'p6007', 'p6008', 'p6010', 'p6011', 'p6012', 'p6013', 'p6014', 'p6015', 'p6016', 'p6017', 'p6020', 'p6021'};
SIDS = {'s01', 's02', 's11', 's12', 's13'}
pid = 'p6000';
sid = 's02';

R=[];
Dir = 'C:\Users\nsleheen\DATA\MinnesotaSmokingData\csvdata_si_all\';
for i=1:length(PIDS)
    pid = PIDS{i};
    for j=1:length(SIDS)
        sid = SIDS{j}; 
        FileDir = [Dir pid '\' sid '\'];
%         Convert_10sec_window_to_stationary_st_et_window(FileDir, 'Activity_windows1min_st_et.csv');
%         left_right_wrist_mean_magnitude_during_stationary(FileDir, 'Activity_windows1min_st_et.csv', [Dir 'plot_dmVSndm_statn_ge2min\dmVSndm_' pid '_' sid 'all']);
        entropy = left_right_wrist_entropy_SD_mag_wholeday(FileDir, 'Activity_windows1min_st_et.csv');
        if length(entropy) > 0
            R = [R; entropy];
        end
    end
end

plot(R(:, 1), '*r'); hold on;
plot(R(:, 2), 'ob');

    legend('Entropy (Left wrist)', 'Entropy (Right wrist)');
    
    ylabel('Entropy','FontSize',10,'FontWeight','bold','Color','b');
%     saveas(gcf,plot_filename,'jpg');
%     close(gcf);
