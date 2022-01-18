clc
clear
clear all

train_dir = dir('train\*.jpg');
test_dir = dir('test\*.jpg');
resultFile = fopen('results.txt','w');      % for saving results in txt file

acc_counter = 0;   
N_IMAGES = 100;
points_train_cell =     cell(1,N_IMAGES);   % valid points of train images
desc_train_cell   =     cell(1,N_IMAGES);   % descriptors of train images 
imgsname_train_cell =   cell(1,N_IMAGES);   % name of train images

for i=1:length(train_dir)
        tr_name = strcat('train\',train_dir(i).name);
        tr_img = rgb2gray ( imread(tr_name) );        
        train_features = detectSURFFeatures(tr_img);
        [tr_descriptor, tr_points] = extractFeatures(tr_img, train_features);
        
        points_train_cell{1,i} = tr_points;
        desc_train_cell{1,i} = tr_descriptor;
        imgsname_train_cell{1,i} = tr_name;
end


for i=1:length(test_dir)
    test_name = strcat('test\',test_dir(i).name);
    tst_img = rgb2gray ( imread(test_name) );
    test_features = detectSURFFeatures(tst_img);
    [tst_descriptor, tst_points] = extractFeatures(tst_img, test_features);  
    
    max_name = 0;
    max_count = 0;
    max_index = -1;
    
    for j=1:length(points_train_cell)
        % match points
        match_pairs = matchFeatures(desc_train_cell{j}, tst_descriptor);
        matched_points_object = points_train_cell{j}(match_pairs(:,1));
        matched_points_target = tst_points(match_pairs(:,2));

        % apply RANSAC
        try
        [tform, inlier_object, inlier_target] = ...
            estimateGeometricTransform(matched_points_target, matched_points_object, 'affine');        
        catch Me
        end
        
        inl_count = inlier_object.Count;
        if inl_count > max_count
            max_count = inl_count;
            max_name = imgsname_train_cell{j};
            max_index = j;
        end           
    end
    
    if max_index == i
        acc_counter = acc_counter + 1;
    end
    
    fprintf(resultFile,'[%s] matched with --> [%s], by %i points.\n', ...
        test_name, max_name, max_count);
end

% calculate acc
acc = (acc_counter / N_IMAGES) * 100;
fprintf(resultFile, '\n---------------------------------------------------------\n');
fprintf(resultFile, 'Accuracy of object localization: %i percent', acc);
