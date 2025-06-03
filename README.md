# MATLAB Image Processing Projects

Welcome to the MATLAB Image Processing Projects repository by **Abida Shoukat**. This repository contains two distinct projects that demonstrate the use of MATLAB for image analysis and transformation using **morphological operations** and **frequency domain (FFT) techniques**.

## 📁 Repository Contents

- `AbidaCircleCount.m`: Detects and counts colorful circles in an image using HSV color space and morphological operations.
- `abidaFFTmagnitude.m`: Performs frequency domain analysis on two images using Fast Fourier Transform (FFT) and demonstrates image reconstruction by mixing magnitude and phase components.
- `circles.jpg`: Sample input image for the circle detection script.
- `images1.jpeg`, `images2.jpeg`: Input images used in FFT analysis.

---

## 🟢 1. Circle Detection — `AbidaCircleCount.m`

### 📌 Description:
This script detects colorful circular objects in an image using the HSV color space, binary masking, and morphological operations.

### ✅ Key Features:
- Converts image from RGB to HSV.
- Creates a binary mask based on saturation and value thresholds.
- Uses morphological operations to clean up the mask.
- Labels and counts distinct circular regions.
- Plots the detected circles and centroids.

### 🖼️ Input:
- `circles.jpg` (must be present in the same directory)

### 📊 Output:
- Number of circles detected
- Visual result with circle centroids marked on the image

---

## 🔵 2. FFT Magnitude and Phase Mixing — `abidaFFTmagnitude.m`

### 📌 Description:
This script applies 2D FFT on two grayscale images, extracts their magnitude and phase components, and mixes them to observe how magnitude and phase contribute to image reconstruction.

### ✅ Key Features:
- Reads two input images and converts them to grayscale if needed.
- Resizes images to the same dimensions.
- Computes FFT, magnitude, and phase.
- Reconstructs images using swapped magnitude/phase combinations.
- Displays original, magnitude, phase, and mixed results.

### 🖼️ Inputs:
- `images1.jpeg`
- `images2.jpeg`

### 📊 Output:
- Subplots showing:
  - Original images
  - Magnitude and phase plots
  - Reconstructed images using magnitude-phase swapping

---

## 🔧 Requirements

- MATLAB R2021a or later
- Image Processing Toolbox

---

## 📦 How to Run

1. Clone or download the repository.
2. Ensure the following image files are in the same directory as the scripts:
   - `circles.jpg`
   - `images1.jpeg`
   - `images2.jpeg`
3. Open MATLAB and navigate to the project folder.
4. Run the scripts:
   ```matlab
   run('AbidaCircleCount.m')
   run('abidaFFTmagnitude.m')

---
## 👩‍💻 Author
Abida Shoukat
---
## 📃 License
This project is for educational purposes. You are free to use, modify, and distribute it with proper credit.
