function [results] = analysisGroups (data1, data2)

indLow = find(data1 <= 3);
indMed = find(data1 > 3 & data1 < 5);
indHig = find(data1 >= 5);

results.numIndividuals = [numel(indLow), numel(indMed), numel(indHig)];

if (numel(indLow) ~= 0)
    pval_low = signrank (data1(indLow), data2(indLow));
else
    pval_low = -1;
end

if (numel(indMed) ~= 0)
    pval_med = signrank (data1(indMed), data2(indMed));
else
    pval_med = -1;
end

if (numel(indHig) ~= 0)
    pval_hig = signrank (data1(indHig), data2(indHig));
else
    pval_hig = -1;
end

results.pval = [pval_low, pval_med, pval_hig];

end

