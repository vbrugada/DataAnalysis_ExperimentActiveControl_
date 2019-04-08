function [] = plotCorrelationDifference (data1, data2, rho, pval)

cla; hold on;

line([0 0], [7 -7], 'LineStyle', ':', 'Color', [200/255, 200/255, 200/255]); 
line([7 -7], [0 0], 'LineStyle', ':', 'Color', [200/255, 200/255, 200/255]); 

plot(data1, data2,  '.', 'MarkerSize', 20, 'color', 'k');

text(-6, 6, strcat('rho= ', num2str(rho)), 'fontname', 'arial');
text(-6, 5, strcat('p= ', num2str(pval)), 'fontname', 'arial');
xlabel('Diff Sense of ownership', 'fontname', 'arial');
ylabel('Diff sense of agency', 'fontname', 'arial');


xlim([-7 7]); ylim([-7 7]); 
set(gca, 'YTick', -7:1:7, 'XTick', -7:1:7);

hold off; box on;
end