function [corrResults] = correlationDifference (data1, data2)

[results.stats.spearmanRho, results.stats.RhocorrPval] = ...
    corr(data1', data2', 'Type', 'Spearman');

corrResults = [results.stats.spearmanRho, results.stats.RhocorrPval];

plotCorrelationDifference(data1, data2, ...
    results.stats.spearmanRho, results.stats.RhocorrPval);

end 