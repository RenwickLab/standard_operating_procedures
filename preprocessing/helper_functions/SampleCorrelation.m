function corr_result = SampleCorrelation(data, corrtype)
% Finds the mean correlation for each sample in relation to all the other
% samples in the matrix. Each column is a sample.
%
% Syntax: 
%       corr_result = SampleCorrelation(data, corrtype)
% Input:
%   data - numerical array
%   corrtype - string defining what type of correleation you want
%              accepts: 'Pearson', 'Kendall', or 'Spearman'
% Output:
%   1 x N numerical array of the mean correlation values per sample
%   (column)

%author: Kathrin Tyryshkin
%date: January 2018
%Last edited: March 2018 by Justin Wong

%initialize output
corr_result = zeros(length(data(1, :)), 1);

for i=1:length(data(1, :))
    current = data(:, i);
    temp = data; %original data matrix
    temp(:, i) = []; %removing column i
    %compute correlation between current sample and all other samples
    res = corr(current, temp, 'type', corrtype);
    %compute the average
    corr_result(i) = mean(res);
end
end

