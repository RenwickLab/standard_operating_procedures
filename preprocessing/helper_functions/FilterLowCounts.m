function mark2remove = FilterLowCounts( data, q_threshold )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%initialize
%filt_data = zeros(size(data));


%compute the threshold
%reshape the matrix into a vector
MatrixAsVector = reshape(data, [1 size(data,1)*size(data,2)]);
%compute the quantile based on the q_threshold
Threshold = quantile(MatrixAsVector, q_threshold);
disp(['the threshold is ' num2str(Threshold)]);

mark2remove = false(length(data(:, 1)), 1);

for i = 1:length(data(:, 1))
    curr = data(i, :); %get i-th feature 
    %mark samples for the current feature that are above the threshold
    %if none of the samples are marked - this feature is marked for removal
    if sum(curr >= Threshold) == 0
        mark2remove(i) = true;
    end
end

%use logical indexing to get only miRNAs that are not marked
%filt_data = data(~mark2remove, :);

end

