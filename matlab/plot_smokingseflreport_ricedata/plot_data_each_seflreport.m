clear all;
% G.DIR = 'C:\Users\nsleheen\DATA\RICE_TESTING\';
% G.OUTDIR = 'C:\Users\nsleheen\DATA\RICE_TESTING\plotselfreport';
% G.pids = '2006';
% G.sessions = {'s2017-02-27', 's2017-02-28'};
G = config_rice();

INDIR = G.DIR;
OUTDIR = G.OUTDIR;
pid = G.pids;
sessions = G.sessions;

for s=1:length(sessions)
    sid = sessions{s};
    dir = [INDIR pid '\' sid '\'];

    a_y_l = importdata([dir 'left-wrist-accely.csv']);
    a_y_r = importdata([dir 'right-wrist-accely.csv']);
    rip = importdata([dir 'rip.csv']);
    valleys = importdata([dir 'org.md2k.puffmarker.data.rip.valleys.filtered.csv']);
    peaks= importdata([dir 'org.md2k.puffmarker.data.rip.peaks.filtered.csv']);

    pLabel=importdata([dir 'org.md2k.puffMarker.pufflabel.minute.csv']);
    puff = pLabel(find(pLabel(:, 2)==1), 1);
    epi=importdata([dir 'org.md2k.puffMarker.smoking.episode.csv']);

%     pLabelNew=importdata([dir 'new\org.md2k.puffMarker.pufflabel.minute.csv']);
%     puffNew = pLabelNew(find(pLabelNew(:, 2)==1), 1);
%     epiNew=importdata([dir 'new\org.md2k.puffMarker.smoking.episode.csv']);

    figure;
    selfReport=importdata([dir 'SMOKING_SELFREPORT_CLOUD.csv']);
    if length(selfReport)>0
        for j=1:length(selfReport(:, 1)) 
            
            if length(epi)>0
                for i=1:length(epi(:, 1)) 
                   rectangle('Position',[epi(i,1),6.5,300000,1],'FaceColor',[.9 .5 0]);
                   hold on;
                end
            end
            if length(pLabel)>0
                plot(pLabel(:, 1), 7, 'og');
                plot(puff, 7, '*r');    
            end
            epiPuPMCloud=importdata([dir 'SMOKING_PUFFMARKER_CLOUD.csv']);
            if length(epiPuPMCloud)>0
                for k=1:length(epiPuPMCloud(:, 1))                    
                   rectangle('Position',[epiPuPMCloud(k,1),7.5,300000,1],'FaceColor',[1 .2 0.2]);
                    text(epiPuPMCloud(k,1), 8, 'PuffMarker');

                end
            end

%             if length(epiNew)>0
%                 for i=1:length(epiNew(:, 1)) 
%                    rectangle('Position',[epiNew(i,1),6.5,300000,1],'FaceColor',[.9 .5 0]);
%                    hold on;
%                 end
%             end
%             if length(pLabelNew)>0
%                 plot(pLabelNew(:, 1), 7, 'og');
%                 plot(puffNew, 7, '*r');    
%             end

            xminLim = selfReport(j,1)-15*60000;
            xmaxLim = selfReport(j,1)+10*60000;
            
            plot(rip(:,1),-2+rip(:, 2)/2000, 'g');
            plot(valleys(:,1),-2+valleys(:, 2)/2000, '.r');
            plot(peaks(:,1),-2+peaks(:, 2)/2000, '.b');
            text(xminLim, 0, 'Respiration');
            

            plot(a_y_l(:,1),3+a_y_l(:, 2), 'b'); hold on;
            plot(a_y_r(:,1),5+a_y_r(:, 2), 'r');
            plot([a_y_r(1,1) a_y_r(end,1)],[3 3],'k--');
            plot([a_y_r(1,1) a_y_r(end,1)],[5 5],'k--');
            text(xminLim, 3, 'A_Y (left)');
            text(xminLim, 5, 'A_Y (right)');

            plot([selfReport(j,1) selfReport(j,1)], [0 9], 'k');
            text(selfReport(j,1), 9, 'Self-report');           
            
            xlim([xminLim, xmaxLim])
            title(['PID: ' pid ' SID: ' sid 'self report: ' num2str(j)]);

            set(findall(gcf,'type','text'),'FontSize',16,'fontWeight','bold');
            set(gca,'FontSize',16,'fontWeight','bold');

            %             saveas(gcf,[OUTDIR '\' pid '_' sid 'selfreport_' j '.fig']);
            saveas(gcf,[OUTDIR '\' pid '_' sid 'selfreport_' num2str(j) '.png']);
            close(gcf);
            
        end
    end

end

