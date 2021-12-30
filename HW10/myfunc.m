function [image] = myfunc(image,channel)
    if channel == 'R'
        chan_code = 1;
    elseif channel == 'G'
        chan_code = 2;
    elseif channel == 'B'
        chan_code = 3;
    else 
        error('your channel is incorrect!');
    end 
    
    [row, col] = size( image(:,:,chan_code) );
    rand_matrix = rand(row, col);
    image(:,:,chan_code) = rand_matrix;
end

