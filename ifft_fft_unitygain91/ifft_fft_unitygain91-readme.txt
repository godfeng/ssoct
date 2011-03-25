Unity Gain in Cascaded IFFT and FFT Pair Design Example v9.1 README File


This readme file for the Unity Gain in Cascaded IFFT and FFT Pair Design contains
information about the design example posted on the Altera Support website:
http://www.altera.com/support/examples/exm-index.html
Ensure that you have read the information on the design example web page 
before using the example.



This readme file contains the following sections:

o  Package Contents
o  Tool Requirements
o  Quartus II Compilation
o  ModelSim Simulation Models
o  Release History
o  Design Examples Disclaimer
o  Contacting Altera



Package Contents
================

Unity Gain in Cascaded IFFT and FFT Pair Design Example v9.1
Design files in the zip download include:
	o BFT_unitygain.v - Top-level design file implementing the cascaded IFFT+FFT system
	o fft91.v - Wrapper file for fft and ifft blocks
	o Scaler.v - Scales the input data with respect to the input exponent value
	o tb_BFT_unitygain.v  - Testbench for RTL functional simulation
	o BFT_unitygain.tcl - TCL script to automate ModelSim?simulation  
	o unity_gain_tb.m—MATLAB script to compare the difference between block-floating-point output with floating-point output


Tool Requirements
=================

This design example requires the following software package:
	o Quartus II 9.1
	o FFT MegaCore Function v9.1
	o ModelSim version 6.3g or later 

Please contact your local sales representative if you do not have one of these
software tools.



Description of Design Example
=============================

The FFT MegaCore function supports block-floating-point (BFP) architecture, a trade-off between fixed-point and 
full floating-point architecture. The block-floating-point FFT receives fixed-point input data and calculates the 
fixed-point output data with exponent. Due to lack of an exponent input port in FFT, when cascading IFFT with FFT, 
the scaling factor must be computed externally. This design example describes how to achieve unity gain in a 
block-floating-point IFFT+FFT pair with scaling arithmetic with an Altera FFT MegaCore  function.


To get more details on the FFT IP, refer to the FFT MegaCore Function User Guide 
located at:

http://www.altera.com/literature/ug/ug_fft.pdf



Quartus II Compilation
======================

To run the compilation for the Unity Gain in Cascaded IFFT and FFT Pair project in Quartus II, 
perform the following steps:
1. Open Quartus II project: File -> Open Project ->  ..\ifft_fft_unitygain\BFT_unitygain.qpf
2. Specify the FFT user library: Assignments -> Settings ->  Category (User Libraries)
   Browse to the C:\altera\91\ip\fft\lib in the Library name box. 
3. Review FFT parameters using IP Toolbench: Tools -> MegaWizard Plug-in Manager 
   Select "Edit an existing custom megafunction variation" and choose the FFT intellectual property (IP) block: 
   ..\ifft_fft_unitygain\BFT_unitygain.v
   You can review the parameters by clicking on the "Parameterize" button in IP Toolbench.
4. Regenerate the FFT MegaCore wrapper file by clicking on the "Generate" button in IP Toolbench.
5. You are ready to compile the design in Quartus II: Processing -> Start Compilation



ModelSim Simulation Models
==========================

In IP Toolbench, the option to generate Verilog simulation model is enabled in the "Set Up Simulation" window.
The steps to generate the simulation models from IP Toolbench are highlighted in the previous section:
"Quartus II Compilation".  We will be using these IP Toolbench-generated IP functional simulation models 
to verify the design in ModelSim.

To run the functional simulation for the Coefficient Reload FIR Filter project
using ModelSim, perform the following steps:

1. From the ModelSim software click Change Directory (File menu) to the Current Directory.
2. Modify the path in BFP_unitygain.tcl to your working directory
3. To run the ModelSim simulation, click Execute Macro (Tools menu) and select BFP_unitygain.tcl.
   The TCL script sets up the ModelSim project, compiles the appropriate libraries and design files,
   runs the simulation, and displays the result in the waveform editor.

To get more details on the IP Functional Simulation Models, refer to the Altera white paper titled  
"Using IP Functional Simulation Models to Verify Your System Design White Paper" located at:

http://www.altera.com/literature/wp/wp_simgen.pdf



MATLAB Models
=============

To verify the RTL simulation results are correct, you can compare them with the results from the provided
MATLAB models found in the working directory

To run the MATLAB models, perform the following steps:
1. In MATLAB, change the directory to the ..\ifft_fft_unitygain directory
2. To run the MATLAB model, type the following command in the MATLAB workspace:

	>> unity_gain_tb



Release History
===============

Version 9.1 December 2009	Update to FFT v9.1 MegaCore function

Version 7.2 December 2007	Update to FFT v7.2 MegaCore function

Version 2.1.3 	     2004	Initial release



Design Examples Disclaimer
==========================

These design examples may only be used within Altera Corporation devices and remain 
the property of Altera. They are being provided on an “as-is?basis and as an accommodation; 
therefore, all warranties, representations, or guarantees of any kind (whether express, 
implied, or statutory) including, without limitation, warranties of merchantability, non-infringement, 
or fitness for a particular purpose, are specifically disclaimed. Altera expressly does not recommend, 
suggest, or require that these examples be used in combination with any other product not provided 
by Altera.



Contacting Altera
=================

Although we have made every effort to ensure that this design example works 
correctly, there might be problems that we have not encountered. If you have 
a question or problem that is not answered by the information provided in this 
readme file or the example's documentation, please contact your Altera Field 
Applications Engineer.

If you have additional questions that are not answered in the documentation
provided with this function, please contact Altera Applications:

World-Wide Web:                 http://www.altera.com
                                http://www.altera.com/mysupport/
Technical Support Hotline:	(800) 800-EPLD (U.S.)
                                (408) 544-7000 (Internationally)
                                
Copyright (c) 2009 Altera Corporation. All rights reserved.




