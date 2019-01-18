function make_boxplot( data, x_tick_labels, x_label, y_label )
%MAKE_BOXPLOT makes a formatted boxplot.
% Syntax : 
%   make_boxplot( data, x_tick_labels, x_label, y_label )

% Author: Justin Wong
% Created 19 March 2018

figure, hold on
boxplot(data);

ax = gca;
set(ax, 'XTickLabel', x_tick_labels);
ax.XTickLabelRotation=90;

xlabel(x_label, 'FontSize', 14, 'FontName', 'Helvetica');
ylabel(y_label, 'FontSize', 14, 'FontName', 'Helvetica');

hold off
end

