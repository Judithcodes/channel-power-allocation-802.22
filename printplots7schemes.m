
% power, QuasiSINR
% pdf of sinr on end uers

% plot 4 distributd schmes and 1 centrilized schmes
function printplots7schemes(plotTag, n, utilityHistory, powerHistory, averageSinrHistory, SINR_ETs_random_container, SINR_ETs_whitecat_container, SINR_ETs_whitecase_container, sinr_ETs_lindo_container, SINR_ETs_noregret_container,SINR_ETs_PotentialGame_container_pa, SINR_ETs_LindoCAPA_container_pa)          

% % plot 4 distributd schmes and 2 centrilized schmes
% function printplots5schemes(n, powerHistory, averageSinrHistory, lindo_averagePower, lindo_averageSINR, lindo2_averagePower, lindo2_averageSINR, SINR_ETs_random_container, SINR_ETs_whitecat_container, SINR_ETs_whitecase_container, sinr_ETs_lindo_container, sinr_ETs_lindo2_container, SINR_ETs_noregret_container)          
        
% -----elimimate the zeros in the matrix

utilityHistory(:,find(not(utilityHistory(1,:))))=[];
powerHistory(:,find(not(powerHistory(1,:))))=[];
averageSinrHistory(:,find(not(averageSinrHistory(1,:))))=[];

            
figure(10+plotTag*4);     % power, QuasiSINR   
%             subplot(1,2,1)
%             labels = {'rand' 'WhiteCat' 'WhiteCase'  'noreg'  'lindo'};
%             bar((1:5), mean(powerHistory,2)');
%             set(gca, 'XTick', 1:5, 'XTickLabel', labels);
% %             set(gca,'YLim',[80 110],'Layer','top')
%             h = gca;
%             H = rotateticklabel(h, 90); 
%             grid on
%             title(['average power consumption of ',sprintf('\n'),'all WBs over different simulations'])
%             ylabel(['Average value of the averaged power of all SBs',sprintf('\n'),'over all scenarios (w)']);

% % plot 4 distributd schmes and 2 centrilized schmes
% barweb([mean(powerHistory,2)', lindo_averagePower, lindo2_averagePower], [1.96*std(powerHistory,1,2)'/sqrt(n),0,0], [], [], [], [], 'Average transmission power of each WBS (W)', bone, 'y', {'Rand'; 'WhiteCat'; 'WhiteCase'; 'NoregretLearning';'lindo'; 'variable power with lindo'}, 2, 'axis')

% plot 4 distributd schmes and 1 centrilized schmes
% barweb([mean(powerHistory,2)', 17.314], [1.96*std(powerHistory,1,2)'/sqrt(n),0], [], [], [], [], 'Average transmission power of each WBS (W)', bone, 'y', {'Rand'; 'WhiteCat'; 'WhiteCase'; 'NoregretLearning';'lindo'}, 2, 'axis')

handle1=barweb([mean(powerHistory,2)'], [1.96*std(powerHistory,1,2)'/sqrt(n)], [], [], [], [], 'Transmission power of each WBS (W)', bone, 'y', {'random+dpa'; 'CA-optimization+dpa'; 'whiteCat+dpa'; 'whiteCase+dpa'; 'noregretLearning+dpa';'PotentialGame' ; 'jontCAPA-optimization'}, 2, 'plot')
set(handle1.legend,'Location','east', 'FontSize', 10, 'Color', 'R');
axis([0.4 2.2 0 40]);


figure(11+plotTag*4);
% subplot(1,2,2)
%             labels = {'rand'  'WhiteCat' 'WhiteCase'  'noreg' 'lindo'};
%             bar((1:5), mean(averageSinrHistory,2)'); 
%             set(gca, 'XTick', 1:5, 'XTickLabel', labels);            
% %             set(gca,'YLim',[40 60],'Layer','top') 
%             h = gca;
%             H = rotateticklabel(h, 90); 
%             grid on
%             title(['average qusai SINR on reference position',sprintf('\n'),' of all WBs over different simulations'])
%             ylabel(['Average value of the averaged qusai SINR (db) of all',sprintf('\n'),' SBs over all scenarios']);

% % plot 4 distributd schmes and 2 centrilized schmes
% barweb([mean(averageSinrHistory,2)', lindo_averageSINR, lindo2_averageSINR], [1.96*std(averageSinrHistory,1,2)'/sqrt(n),0,0], [], [], [], [], 'Average Quasi SINR of each WBS (dB)', bone, 'y', {'Rand'; 'WhiteCat'; 'WhiteCase'; 'NoregretLearning';'lindo'; 'variable power with lindo'}, 2, 'axis')

% plot 4 distributd schmes and 1 centrilized schmes
%barweb([mean(averageSinrHistory,2)', 6.34], [1.96*std(averageSinrHistory,1,2)'/sqrt(n),0], [], [], [], [], 'Average Quasi SINR of each WBS (dB)', bone, 'y', {'Rand'; 'WhiteCat'; 'WhiteCase'; 'NoregretLearning';'lindo'}, 2, 'axis')
handle2=barweb([mean(averageSinrHistory,2)'], [1.96*std(averageSinrHistory,1,2)'/sqrt(n)], [], [], [], [], 'Average Quasi SINR of each WBS (dB)', bone, 'y', {'random+dpa'; 'CA-optimization+dpa'; 'whiteCat+dpa'; 'whiteCase+dpa'; 'noregretLearning+dpa';'PotentialGame' ; 'jontCAPA-optimization'}, 3, 'plot')
set(handle2.legend,'Location','south', 'FontSize', 10, 'Color', 'R');

figure(12+plotTag*4);
handle3=barweb([mean(utilityHistory,2)'], [1.96*std(utilityHistory,1,2)'/sqrt(n)], [], [], [], [], 'Summed utility of all WBSes', bone, 'y', {'random+dpa'; 'CA-optimization+dpa'; 'whiteCat+dpa'; 'whiteCase+dpa'; 'noregretLearning+dpa';'PotentialGame' ; 'jontCAPA-optimization'}, 3, 'plot')
set(handle3.legend,'Location','north', 'FontSize', 10, 'Color', 'R');


% pdf of sinr on end uers
figure(20+plotTag*4); 
        h1cvx = cdfplot(SINR_ETs_random_container);
        set(h1cvx, 'color','k', 'linestyle', ':');
        hold on
        
        h2cvx = cdfplot(SINR_ETs_whitecat_container);
        set(h2cvx, 'color','g', 'linestyle', '-.');
        hold on
        
        h3cvx = cdfplot(SINR_ETs_whitecase_container);
        set(h3cvx, 'color', 'k', 'linestyle', '-' ); % 'marker', '.'
        hold on
        
        h4cvx = cdfplot(sinr_ETs_lindo_container);
        set(h4cvx,'color','r',  'linestyle', '-');
       hold on
       
        h5cvx = cdfplot(SINR_ETs_noregret_container);
        set(h5cvx,'color','b',  'linestyle', '--');    
        hold on
        
        h6cvx = cdfplot(SINR_ETs_PotentialGame_container_pa);
        set(h6cvx,'color','g',  'linestyle', '--');            
        hold on

        h7cvx = cdfplot(SINR_ETs_LindoCAPA_container_pa);
        set(h7cvx,'color','k',  'linestyle', '--');    

        axis([1 100 0 1]);

        
        set(gca, 'XScale', 'log');
        
        
        % multiplication
        a=[cellstr(num2str(get(gca, 'ytick')'*100))];
        % create a vector of '%' signs
        pct = char(ones(size(a,1),1)*'%');
        % append the '%' signs after the percentage values
        new_yticks =[char(a), pct];
        % reflect the changes on the plot
        set(gca, 'yticklabel', new_yticks);
        
        legend('Random', 'WhiteCat','WhiteCase', 'Lindo', 'Noregret learning', 'PotentialGame', 'lindo\_jontCAPA');
%         title('Cumulative distribution of SINR on end terminals for different distributed schemes');
   set (legend, 'Location', 'southeast');
        xlabel('SINR (dB)');
        ylabel('CDF')

% figure (5)
% % h = cdfplot(sinr_ets_random; sinr_ets_whitecat; sinr_ets_whitecase; sinr_ets_noregret);
% 
%     h1 = cdfplot(sinr_ets_random);
%     set(h1, 'color','k', 'linestyle', '-');
%     hold on
%     h2 = cdfplot(sinr_ets_whitecat);
%     set(h2, 'color','g', 'linestyle', '-');
%     hold on
%     h3 = cdfplot(sinr_ets_whitecase);
%     set(h3, 'color', 'r', 'linestyle', '-');
%     hold on
% %     h4 = cdfplot(sinr_ets_lindo);420
% %     set(h4,'color','m');
% %     hold on
%     h5 = cdfplot(sinr_ets_noregret);
%     set(h5,'color','b',  'linestyle', '-');
%     
%     
%     % the other group:
%     h1cvx = cdfplot(sinr_ets_random2);
%     set(h1cvx, 'color','k', 'linestyle', '-.');
%     hold on
%     h2cvx = cdfplot(sinr_ets_whitecat2);
%     set(h2cvx, 'color','g', 'linestyle', '-.');
%     hold on
%     h3cvx = cdfplot(sinr_ets_whitecase2);
%     set(h3cvx, 'color', 'r', 'linestyle', '-.');
%     hold on
% %     h4 = cdfplot(sinr_ets_lindo);420
% %     set(h4,'color','m');
% %     hold on
%     h5cvx = cdfplot(sinr_ets_noregret2);
%     set(h5cvx,'color','b',  'linestyle', '-.');    
% % 	axis([15 30 0.4 1]);% lower sinr part figure
%     %axis([1 100 0 1]);
%     axis([1 100 0 1]);
% 
% %       a nice way to have specific y scale    
% %     % convert y-axis values to percentage values by multiplication
% %     a=[cellstr(num2str(get(gca,'ytick')'*100))]; 
% %     % create a vector of '%' signs
% %     pct = char(ones(size(a,1),1)*'%'); 
% %     % append the '%' signs after the percentage values
% %     new_yticks = [char(a),pct];
% %     'reflect the changes on the plot
% %     set(gca,'yticklabel',new_yticks);
% 
%     
% %    set (gcf,'position',[232 246 560 300]); % size of plot
% %    set(gca, 'position', [.13 .17 .80 .74]); % the percentage of x, y axis in the plot
%     set(gca, 'xscale', 'log');
%     legend('random-lp', 'whitecat-lp','whitecase-lp', 'noregret-lp', 'random-cvx', 'whitecat-cvx','whitecase-cvx', 'noregret-cvx', 'location', 'southeast');
%     title('cumulative distribution of sinr on end terminals for different distributed schemes');
%    
%     xlabel('sinr (db)');
%     ylabel('percetage (100%)')
%     magnify;