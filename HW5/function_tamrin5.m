function [output] = function_tamrin5(matrix)
min_value =  min(matrix(:));
max_value =  max(matrix(:));
rescale_min = 0;
rescale_max = 255;
output = rescale_min + [(matrix-min_value)./(max_value-min_value)].*(rescale_max-rescale_min);
end

