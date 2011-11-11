function ss_oct_defaults
% Loads default values most common spm_lot variables to ssOCTdefaults structure,
% as a global variable
% SYNTAX:
% ss_oct_defaults
% INPUTS:
% None
% OUTPUTS:
% None:  Just a global structure containing defaults values of common spm_lot 
%        variables named ssOCTdefaults
% Care must be taken when modifying this file!
%_______________________________________________________________________________
% Copyright (C) 2011 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/07/11

% Default values for ss_oct in structure ssOCTdefaults
global ssOCTdefaults

%===============================================================================
% Directories & file names
%===============================================================================
% Installation directory
ssOCTdefaults.dirUser           = 'D:\Edgar\Documents\ssoct\Matlab\';
% Data directory
ssOCTdefaults.dirExp            = 'D:\Edgar\Documents\ssoct\Matlab\Acquisition\DATA\';
% Current Experiments folder
ssOCTdefaults.dirCurrExp        = [];
% LabView folder
ssOCTdefaults.dirLabView        = 'D:\Edgar\Documents\ssoct\LabView\';
% Name of the file containing acquisition parameters
ssOCTdefaults.acqParamFileName  = 'acqParam.csv';
% Name of the subject
ssOCTdefaults.subjectID         = 'NO_NAME';
% Description of the experiment
ssOCTdefaults.expDescription    = 'EMPTY';
% Maximize figure
ssOCTdefaults.screenSize        = get(0,'Screensize');
ssOCTdefaults.screenSize        = [1+ssOCTdefaults.screenSize(3)/2 40 ...
    ssOCTdefaults.screenSize(3)/2 ...
    ssOCTdefaults.screenSize(4)-40];

%===============================================================================
% SS-OCT experiment specific variables
%===============================================================================
% Server machine (FPGA)
ssOCTdefaults.serverAddress     = '192.168.1.234';
ssOCTdefaults.portNumber        = 30;
% Number of samples per A-line (1170)
ssOCTdefaults.NSAMPLES          = 1170;
% Number of bytes per A-line (2368) > NSAMPLES*2=2340
ssOCTdefaults.nBytesPerAline    = 2368;
% Number of 16-bit words per A-line (nBytesPerAline/2)
ssOCTdefaults.nWordsPerAline    = ssOCTdefaults.nBytesPerAline/2;
% Number of characters of startup menu
ssOCTdefaults.MENUSIZE          = 360;
% Save to file
ssOCTdefaults.save2file         = true;
% Number of A-lines per frame
ssOCTdefaults.nLinesPerFrame    = 1024;
% Number of frames per volume
ssOCTdefaults.nFrames           = 64;
% Number of saved frames
ssOCTdefaults.nFramesSaved      = 0;
% Number of total samples per scan
ssOCTdefaults.nAcqSamples       = ssOCTdefaults.nLinesPerFrame *...
    ssOCTdefaults.nFrames;
% Tx & Rx buffer size for all socket sends & receives
ssOCTdefaults.BUFFERSIZE        = ssOCTdefaults.nBytesPerAline *...
    ssOCTdefaults.nLinesPerFrame;
% Required pause between acquired volumes (depends on nSamplesPerVolume)
ssOCTdefaults.pauseTime         = 1.8;

%===============================================================================
% GUI parameters
%===============================================================================
% Display B-scan in log scale
ssOCTdefaults.displayLog        = false;
% Display Color Bar
ssOCTdefaults.displayColorBar   = true;
% Interferogram signal plot
ssOCTdefaults.displaySingleLine = true;
% Resamling data at k-clock frequency
ssOCTdefaults.resampleData      = false;
% Correct B-scan in real-time
ssOCTdefaults.corrBscan         = false;
% Show FWHM in real time
ssOCTdefaults.showFWHM          = false;
% Calculate reference signal as the median A-line of current B-scan
ssOCTdefaults.medianRefArm      = false;
% Colormap to be used
ssOCTdefaults.OCTcolorMap       = get_colormaps('bow');

%===============================================================================
% Galvo mirrors parameters
%===============================================================================
ssOCTdefaults.galvos.xStartVolt         = -1;
ssOCTdefaults.galvos.xEndVolt           = 1;
ssOCTdefaults.galvos.yStartVolt         = -1;
ssOCTdefaults.galvos.yEndVolt           = 1;
ssOCTdefaults.galvos.xStartUm           = -100;
ssOCTdefaults.galvos.xEndUm             = 100;
ssOCTdefaults.galvos.yStartUm           = -100;
ssOCTdefaults.galvos.yEndUm             = 100;
% Number of samples per volume scan (given by LabView)
ssOCTdefaults.galvos.nSamplesPerVolume  = 1100;


%===============================================================================
% OCT axial resolution
%===============================================================================
% Center wavelength
ssOCTdefaults.lambda0           = 1310e-9;
% Wavelength range
ssOCTdefaults.minLambda         = 1258e-9;
ssOCTdefaults.maxLambda         = 1361.2e-9;
% FWHM in wavelength
% ssOCTdefaults.delta_lambda      = 100e-9;
ssOCTdefaults.delta_lambda      = ssOCTdefaults.maxLambda - ssOCTdefaults.minLambda;
% Axial resolution in air
ssOCTdefaults.zr_air            = (2/pi)*log(2)*ssOCTdefaults.lambda0^2 /...
    ssOCTdefaults.delta_lambda;
% Index of refraction of tissue
ssOCTdefaults.n                 = 1.4;
% Axial resolution in tissue
ssOCTdefaults.zr                = ssOCTdefaults.zr_air / ssOCTdefaults.n;

%===============================================================================
% OCT transverse resolution
%===============================================================================
% Entrance pupil diameter
ssOCTdefaults.EP                = [4e-3 4e-3 4e-3];
% F280APC-C beam diameter
ssOCTdefaults.beamWaist         = [3.4 3.4 3.4]*1e-3;
% Effective Focal Length [LSM02 LSM03 LSM04]
ssOCTdefaults.EFL               = [18 36 54]*1e-3;
% Numerical Aperture
ssOCTdefaults.NA                = sqrt(1 ./ (1 + (2.*ssOCTdefaults.EFL ./ ...
    ssOCTdefaults.beamWaist).^2));  
% Transverse (lateral) resolution for different scan lenses [LSM02 LSM03 LSM04]
ssOCTdefaults.rr                = (2/pi)*ssOCTdefaults.lambda0 ./ ssOCTdefaults.NA;

%===============================================================================
% Maximum path difference (Scan Range of a FDOCT) (Penetration depth)
%===============================================================================
ssOCTdefaults.delta_Z_Nq        = ssOCTdefaults.lambda0^2 * ...
    ssOCTdefaults.NSAMPLES / (4*ssOCTdefaults.delta_lambda*ssOCTdefaults.n);
% Index of refraction of air
ssOCTdefaults.n_air             = 1;
ssOCTdefaults.delta_Z_Nq_air    = ssOCTdefaults.lambda0^2 * ...
    ssOCTdefaults.NSAMPLES / (4*ssOCTdefaults.delta_lambda*ssOCTdefaults.n_air);
% Wavenumber range
ssOCTdefaults.minK              = 2*pi / ssOCTdefaults.maxLambda;
ssOCTdefaults.maxK              = 2*pi / ssOCTdefaults.minLambda;
% Wavenumbers column vector
ssOCTdefaults.vectorK           = linspace(ssOCTdefaults.maxK,...
    ssOCTdefaults.minK, ssOCTdefaults.NSAMPLES)';
% Lambda Column Vector (in nm)
ssOCTdefaults.vectorLambda      = 2*pi ./ ssOCTdefaults.vectorK;
% z-axis in um (air)
ssOCTdefaults.zAxis_air         = linspace(ssOCTdefaults.delta_Z_Nq_air ./...
    ssOCTdefaults.NSAMPLES,ssOCTdefaults.delta_Z_Nq_air,ssOCTdefaults.NSAMPLES);
% z-axis in um (tissue)
ssOCTdefaults.zAxis             = linspace(ssOCTdefaults.delta_Z_Nq ./...
    ssOCTdefaults.NSAMPLES,ssOCTdefaults.delta_Z_Nq,ssOCTdefaults.NSAMPLES);
% Positive z-axis in um (air)
ssOCTdefaults.positiveZaxis_air = linspace(ssOCTdefaults.delta_Z_Nq_air ./...
    ssOCTdefaults.NSAMPLES,ssOCTdefaults.delta_Z_Nq_air,ssOCTdefaults.NSAMPLES/2);
% Positive z-axis in um (tissue)
ssOCTdefaults.positiveZaxis     = linspace(ssOCTdefaults.delta_Z_Nq ./...
    ssOCTdefaults.NSAMPLES,ssOCTdefaults.delta_Z_Nq,ssOCTdefaults.NSAMPLES/2);
% ==============================================================================
% [EOF]
