# Vibrometer Data Analysis

## Overview

This repository contains MATLAB code for analyzing vibrometer frequency response functions (FRFs) for different angles. The provided code loads data from a `.mat` file, computes the magnitude, real, and imaginary parts of the response at various angles, and generates visualizations of the results.

## Files

- `main.m`: Main MATLAB script to perform the analysis and generate plots.
- `data/data.mat`: Input data file containing the frequency response functions (FRFs) to be analyzed.
- `results/`: Directory where the generated plots will be saved.
- `measurements/`: Directory that contains the experimental results.

## Usage

### Prerequisites

MATLAB needs to be installed.

### Steps

1. **Clone the Repository**

    ```bash
    git clone https://github.com/joaonunovalente/vibrometer-analysis.git
    cd vibrometer-analysis
    ```

2. **Prepare Data**

    Ensure the `data.mat` file is located in the `data` directory. The `data.mat` file should contain the necessary FRF data structured appropriately.

3. **Run the Script**

    Open MATLAB and navigate to the repository directory. Run the script `main.m`.

4. **View Results**

    The script will generate and save the following plots in the `results` directory:
    - Magnitude plot for the estimated velocity FRF.
    - Comparision of Magnitudes laser FRF.
    - Plot of the relative error.

## Script Details

### `analyze_vibrometer.m`

This script performs the following steps:

1. **Load Data**: Loads the FRF data from `data/data.mat`.
2. **Compute Data for Different Angles**: Calculates the real, imaginary, and magnitude components of the FRF for angles 20º, 30º, and 45º.
3. **Visualize Data**: Generates and saves the following plots:
    - Magnitude plot for the estimated velocity FRF.
    - Comparision of Magnitudes laser FRF.
    - Plot of the relative error.

## Contact

This repository is part of my PhD project. For more information and additional resources, please visit the main PhD repository [here](https://github.com/joaonunovalente/phd). For any questions or issues, please contact me at [jnvalente@ua.pt](mailto:jnvalente@ua.pt).

**João Nuno Valente**  
PhD Candidate, University of Aveiro  



