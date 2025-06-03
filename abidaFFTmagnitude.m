%================================================================================
% ABIDA SHOUKAT
% 2022-a-8024
% BS(SE)A 6 Semester
%================================================================================
% abidaFFTmagnitude.m

% Step 1: Read and convert images to double format
img1 = im2double(imread('images1.jpeg'));    % Read first image and convert it to double precision (range [0,1])
img2 = im2double(imread('images2.jpeg'));    % Read second image and convert it to double precision (range [0,1])

% Debugging: Display the size of the images to ensure they are loaded correctly
disp('Size of img1:'); 
disp(size(img1));                       
disp('Size of img2:'); 
disp(size(img2));                       

% Step 2: Convert to grayscale if images are RGB (i.e., have 3 channels)
if size(img1, 3) == 3                      
    img1 = rgb2gray(img1);               
end
if size(img2, 3) == 3                    
    img2 = rgb2gray(img2);              
end

% Step 3: Resize image2 to match the size of image1 (necessary for FFT operations)
img2 = imresize(img2, [size(img1,1), size(img1,2)]);  % Resize image2 to match image1's height and width

% Step 4: Perform 2D Fast Fourier Transform (FFT) on both images
fft1 = fft2(img1);                       
fft2 = fft2(img2);                       

% Step 5: Extract magnitude and phase components from the FFT results
mag1 = abs(fft1);                       
mag2 = abs(fft2);                       
phase1 = angle(fft1);                  
phase2 = angle(fft2);                   

% Step 6: Mix magnitude and phase from different images and reconstruct new images using inverse FFT
mixed1 = real(ifft2(mag1 .* exp(1i * phase2))); 
mixed2 = real(ifft2(mag2 .* exp(1i * phase1)));  

% Step 7: Display all results in a 3x3 grid layout using subplots
figure('Name','FFT Magnitude and Phase Mixing','NumberTitle','off');  % Create a new figure window with a custom name

% Display original image1
subplot(3,3,1);                         
imshow(img1, []);                    
title('Original Image-1');          

% Display magnitude of image1 (logarithmic scale for better visibility)
subplot(3,3,2);                          
imshow(log(1 + mag1), []);           
title('Magnitude Image-1');           

% Display phase of image1
subplot(3,3,3);                          
imshow(phase1, []);                     % Display phase spectrum of image1
title('Phase Image-1');                 % Set subplot title

% Display original image2
subplot(3,3,4);                          
imshow(img2, []);                        % Display grayscale image2
title('Original Image-2');              % Set subplot title

% Display magnitude of image2
subplot(3,3,5);                          
imshow(log(1 + mag2), []);              % Display magnitude of image2 with log scale
title('Magnitude Image-2');             % Set subplot title

% Display phase of image2
subplot(3,3,6);                          
imshow(phase2, []);                     % Display phase spectrum of image2
title('Phase Image-2');                 % Set subplot title

% Display mixed result: magnitude from image1 and phase from image2
subplot(3,3,7);                          
imshow(mixed1, []);                     % Show reconstructed image
title('Mag1 + Phase2');                 % Set subplot title

% Display mixed result: magnitude from image2 and phase from image1
subplot(3,3,8);                          
imshow(mixed2, []);                     % Show reconstructed image
title('Mag2 + Phase1');                 % Set subplot title


