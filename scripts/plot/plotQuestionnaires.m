function [] = plotQuestionnaires (data1, data2, plot_title, cond1, cond2, statValues)

% Variables
edge = 1:7;


%% Calculate the individual scores
data1 = nanmean(data1);
data2 = nanmean(data2);


%% Figure 1

fig1 = figure(1); clf
set(fig1, 'units', 'centimeters', 'position', [5 5 7.0 15.0]);
hold on;

boxplot([data1' data2'], 'colors', 'k');

title(plot_title, 'fontname', 'arial');
ylabel('Responses to questionnaires', 'fontname', 'arial');

if (statValues.SignedRank < 0.05)
    ylim([0.5 8])
    line([1 2], [7.5 7.5], 'color', 'k');
    text(1.5, 7.65, '*', 'fontname', 'arial');
else
    ylim([0.5 7.5]); 
end

set(gca, 'YTick', 1:1:7);
hold off; box on;


%% Figure 2

fig2 = figure(2); clf, hold on,
set(fig2, 'units', 'centimeters', 'position', [5 5 15.0 15.0]);

ind_low = find(data1 <= 3);
ind_med = find(data1 > 3 & nanmean(data1) < 5);
ind_hig = find(data1 >= 5);

% Lines
line([1 7], [1 7], 'LineStyle', ':', 'Color', [200/255, 200/255, 200/255]);
line([1 1], [0 1], 'LineStyle', ':', 'Color', [200/255, 200/255, 200/255]); 
line([0 1], [1 1], 'LineStyle', ':', 'Color', [200/255, 200/255, 200/255]);
line([3 3], [0 3], 'LineStyle', ':', 'Color', [200/255, 200/255, 200/255]); 
line([0 3], [3 3], 'LineStyle', ':', 'Color', [200/255, 200/255, 200/255]);
line([5 5], [0 5], 'LineStyle', ':', 'Color', [200/255, 200/255, 200/255]); 
line([0 5], [5 5], 'LineStyle', ':', 'Color', [200/255, 200/255, 200/255]);
line([7 7], [0 7], 'LineStyle', ':', 'Color', [200/255, 200/255, 200/255]); 
line([0 7], [7 7], 'LineStyle', ':', 'Color', [200/255, 200/255, 200/255]);


% Plot
plot(data1(:, ind_low),data2(:, ind_low), '.', ...
    'MarkerSize', 20, 'color', 'k'); % [220/255, 220/255, 220/255]); hold on
plot(data1(:, ind_med), data2(:, ind_med), '.', ...
    'MarkerSize', 20, 'color', 'k'); % [150/255, 150/255, 150/255]); 
plot(data1(:, ind_hig), data2(:, ind_hig), '.', ...
    'MarkerSize', 20, 'color', 'k'); % [80/255, 80/255, 80/255]); 


if (statValues.RhocorrPval < 0.001)
    text(1,6, 'p<0.001', 'fontname', 'arial');
elseif (statValues.RhocorrPval < 0.05)
    pval = round(statValues.RhocorrPval*1000)/1000;
    text(1, 6, strcat('p= ', num2str(pval)), 'fontname', 'arial');
else 
    pval = round(statValues.RhocorrPval * 100)/100;
    text(1, 6, strcat('p= ', num2str(pval)), 'fontname', 'arial');
end


spearmanrho = round(statValues.spearmanRho*1000)/1000; 
text(1, 6.5, strcat('rho= ', num2str(spearmanrho)), 'fontname', 'arial');
% pearsonr = round(statValues.pearsonR*1000)/1000;
% text(1, 6.5, strcat('r= ', num2str(pearsonr)), 'fontname', 'arial');


xlim([0.5 7.5]); ylim([0.5 7.5]);
title(plot_title, 'fontname', 'arial');
xlabel(cond1, 'fontname', 'arial');
ylabel(cond2, 'fontname', 'arial');
hold off, box on;


