function [outliers, high_outliers, low_outliers] = scatter_plot_mark_outliers(data, alpha, plot_title, ylbl, datalbl)
% Makes scatter plot of data, plots horizontal line at the upper and lower
% outlier boundries defined as :
% 25th/75th percentile +/- alpha x IQR. 
% Marks outliers and returns logical vectors with outlier cols as 'true'
%
% Syntax:
%   [outliers, high_outliers, low_outliers] = scatter_plot_mark_low(data, plot_title, ylbl, datalbl)
% Inputs:
%   data: 1xN numerical matrix
%   alpha: float
%   plot_title: string
%   ylbl: string
%   datalbl: cell arr
%   force_iqr_disp: if true, will expand y axis to include quartile + 1.5
%       iqr border. Optional. Defaults to false.
% output:
%   [outliers, high_outliers, low_outliers]: all logical arrays indicating
%       outliers

% Author: Kathrin Tyryshkin
% Last edited: 17 January 2017 by Justin Wong


qupper = quantile(data, 0.75) + alpha * iqr(data);
qlower = quantile(data, 0.25) - alpha * iqr(data);

high_outliers = data > qupper;
low_outliers = data < qlower;
outliers = logical(high_outliers + low_outliers); 


x = 1:length(data);
figure, hold on


plot(x, data, 'b.', 'markersize', 15);
plot([0 length(data)+1], [qupper qupper], '-r', 'linewidth', 2);
plot([0 length(data)+1], [qlower qlower], '-r', 'linewidth', 2);
plot(x(high_outliers), data(high_outliers), '*m', 'markersize', 15); 
plot(x(low_outliers), data(low_outliers), '*m', 'markersize', 15);
text(x(high_outliers)+0.7, data(high_outliers), datalbl(high_outliers));
text(x(low_outliers)+0.7, data(low_outliers), datalbl(low_outliers));



% axis([0 length(data)+1 nanmin(data)-nanstd(data) nanmax(data)+nanstd(data)]);


title(plot_title, 'FontSize',16, 'FontName', 'Helvetica');
set(gca, 'XTick', 1:length(datalbl));
set(gca, 'XTickLabel', datalbl);
ax = gca;
ax.XTickLabelRotation=90;
ylabel(ylbl, 'FontSize',14, 'FontName', 'Helvetica');
hold off;
end 
