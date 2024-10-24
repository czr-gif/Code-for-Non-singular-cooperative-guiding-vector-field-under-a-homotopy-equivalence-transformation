# Code for Non-singular Cooperative Guiding Vector Field under a Homotopy Equivalence Transformation

This repository contains the model, figures, and animation code related to the paper:

**Chen, Z., & Zuo, Z. (2025). Non-singular cooperative guiding vector field under a homotopy equivalence transformation.**  
*Automatica, 171*, 111962.  
[https://doi.org/10.1016/j.automatica.2024.111962](https://doi.org/10.1016/j.automatica.2024.111962)

## Code List

- **Figure_in_paper.m**  
  MATLAB code for generating the figures presented in the paper (except the Discussion section).
  
- **model_2D_ellipse.slx**  
  Simulink model for the 2D ellipse case.

- **model_2D_Trefoil.slx**  
  Simulink model for the 2D trefoil case.

- **model_3D_Lissajous.slx**  
  Simulink model for the 3D Lissajous curve case.

- **ani2D.m**  
  MATLAB animation code for the 2D models.

- **ani3D.m**  
  MATLAB animation code for the 3D models.

- **Discussion.m**  
  Code related to the Discussion section in the paper.

- **Discussion6_0.m**  
  Additional code for the Discussion section (Scenario 6.0).

- **Discussion6_1.m**  
  Additional code for the Discussion section (Scenario 6.1).

## Usage Instructions

1. **Figures**  
   Open the `Figure_in_paper.m` file in MATLAB, and run the code using `Ctrl+Enter` to generate the figures presented in the paper (except for the Discussion section).

2. **Simulink Models & Animations**  
   After running any of the Simulink models (`model_2D_ellipse.slx`, `model_2D_Trefoil.slx`, or `model_3D_Lissajous.slx`), you can use the corresponding animation scripts (`ani2D.m` or `ani3D.m`) to generate GIFs of the simulations.

> **Note**  
> Ensure that you have the required toolboxes installed for Simulink and MATLAB animation to execute the models and scripts successfully.

## Citation

If you use this code in your research, please cite the original paper:

