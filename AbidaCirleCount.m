%================================================================================
% ABIDA SHOUKAT
% 2022-a-8024
% BS(SE)A 6 Semester
%================================================================================
% AbidaCircleCount.m

% Step 1: Read the image
img = imread('circles.jpg');

% Step 2: Convert RGB to HSV
hsvImg = rgb2hsv(img);

% Step 3: Create masks based on Saturation and Value to highlight colorful regions
saturationMask = hsvImg(:,:,2) > 0.4;   % Ignore desaturated (gray/white) areas
valueMask = hsvImg(:,:,3) > 0.5;        % Ignore dark areas
mask = saturationMask & valueMask;      % Combine both conditions

% Step 4: Clean the binary mask using morphological operations
mask = imopen(mask, strel('disk', 5));   % Remove small noise
mask = imclose(mask, strel('disk', 10)); % Close small gaps in circles
mask = imfill(mask, 'holes');            % Fill circle interiors

% Step 5: Label connected components (each object/circle)
[labeled, numCircles] = bwlabel(mask);

% Step 6: Get centroids of each detected circle
stats = regionprops(labeled, 'Centroid');

% Step 7: Show steps in subplot for comparison
figure;

subplot(2,6,1);
imshow(img);
title('Original');

subplot(2,6,3);
imshow(hsvImg(:,:,2));
title('Saturation Channel');

subplot(2,6,6);
imshow(hsvImg(:,:,3));
title('Value Channel');

subplot(2,6,7);
imshow(saturationMask);
title('Saturation Mask');

subplot(2,6,9);
imshow(valueMask);
title('Value Mask');

subplot(2,6,7);
imshow(mask);
title('Mask');

% Step 8: Show detected result on original image in subplot
subplot(2,6,12);
imshow(img);
title(['Total Circles:', num2str(numCircles)]);
hold on;
for i = 1:numCircles
    plot(stats(i).Centroid(1), stats(i).Centroid(2), 'r*', 'MarkerSize', 10);
end
hold off;

% Step 9: Final result in a separate figure (with count)
figure;
imshow(img);
title(['Final Result - Total Circles Detected: ', num2str(numCircles)]);
hold on;
for i = 1:numCircles
    plot(stats(i).Centroid(1), stats(i).Centroid(2), 'r*', 'MarkerSize', 10);
end
hold off;
