function [results] =  statisticsQuestionnaires(data1, data2)

% results is a struc containing the values of the statistics

% Obtain the individual scores (one data point per participant and
% condition).
data1_indscore = nanmean(data1);
data2_indscore = nanmean(data2);

% Test the individual scores for normality using the Shapiro-Wilk test
[~, results.stats.normData1, ~] = swtest(data1_indscore, 0.05);
[~, results.stats.normData2, ~] = swtest(data2_indscore, 0.05);

% Test the differences between two condtions
results.stats.SignedRank = signrank (data1_indscore, data2_indscore);

[results.stats.spearmanRho, results.stats.RhocorrPval] = ...
    corr(data1_indscore', data2_indscore', 'Type', 'Spearman');

[results.stats.groups] = analysisGroups (data1_indscore, data2_indscore);


% Median and standart deviaton of the population (Table 2)
% results.means = [nanmean(data1_indscore(:)), nanmean(data2(:))];
results.medians = [nanmedian(data1_indscore(:)), nanmedian(data2_indscore(:))];
results.std = [nanstd(data1_indscore(:)), nanstd(data2_indscore(:))];

end