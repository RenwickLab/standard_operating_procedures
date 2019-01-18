function [ outputdata ] = SampleNormalizationRF( inputdata )
% Expresses each value as a fraction of the total per column

% Author: Kathrin Tyryshkin
% Last edited: 13 March 2018 by Justin Wong

if ~isnumeric(inputdata)
    disp('the input must be a numeric matrix');
    return
end

total = sum(inputdata, 1);
outputdata = zeros(size(inputdata));

%go through each column
for k=1:size(inputdata, 2)
    outputdata(:, k) = inputdata(:, k)./total(k);
end


end

