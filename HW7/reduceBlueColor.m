function [output] = reduceBlueColor(image,percent)
    copy = image;
    blue = copy(:,:,3);
    [row, col] = size(blue);
    percent = percent / 100;

     for r = 1:row
         for c= 1:col
            blue(r,c) = blue(r,c) - (blue(r,c) * percent);
         end
     end

    copy(:,:,3) = blue;
    output = copy;
end

