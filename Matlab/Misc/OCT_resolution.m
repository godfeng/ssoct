% Some data about OCT resolution, data acquisition parameters, etc.
%_______________________________________________________________________________
% Copyright (C) 2011 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/03/07

%% OCT axial resolution
clc
lambda0 = 1310e-9;                      % Center wavelength
delta_lambda = 100e-9;                  % FWHM in wavelength
zr_air = (2/pi)*log(2)*lambda0^2/...    % Axial resolution in air
    delta_lambda;
n = 1.4;                                % Index of refraction of tissue
zr = zr_air / n;                        % Axial resolution in tissue
fprintf('Axial resolution = %.2f um\n',zr*1e6)

%% OCT transverse resolution
EP = [4e-3 4e-3 4e-3];                  % Entrance pupil diameter
beamWaist = [3.4 3.4 3.4]*1e-3;         % F280APC-C beam diameter
EFL = [18 36 54]*1e-3;                  % Effective Focal Length
% Numerical Aperture
NA = sqrt(1 ./ (1 + (2.*EFL./beamWaist).^2));  
rr = (2/pi)*lambda0./NA;                % Transverse (lateral) resolution
fprintf('Tranverse resolution = %.2f um\n',rr*1e6)

%% Maximum path difference (Field Of View of a FDOCT) (Penetration depth)
Ns = 1170;                              % Number of samples (Ns_max = 1286)
delta_Z_Nq = lambda0^2 * Ns / (4*delta_lambda*n);
n_air = 1;                              % Index of refraction of air
delta_Z_Nq_air = lambda0^2 * Ns / (4*delta_lambda*n_air);
fprintf('Maximum path difference (in air) = %.2f mm\n',delta_Z_Nq_air*1e3)
fprintf('Maximum path difference (in tissue) = %.2f mm\n',delta_Z_Nq*1e3)

%% Data acquisition parameters
nSamples = 1170;                        % Fixed by the swept source
nBits = 16;                             % ADC = 14 bits
freq = 50e3;                            % Sweep Trigger frequency
nBytes = nSamples*nBits/8;              % Bytes acquired every Sweep Trigger
nBytesPerSec = freq*nBytes;             % Bytes/sec
nKbytesPerSec = nBytesPerSec/1024;      % KBytes/sec
nMegsPerSec = nKbytesPerSec/1024;       % Mbytes/sec
nMbitsPerSec = nMegsPerSec*8;           % Mbits/sec < 1 Gbit/sec

%% Required Pathlength match (Axsun)
c = 299792458;                          % Speed of light in air (m/s)
nFiber = 1.4677;                        % effective index of refraction of fiber
                                        % SMF-28e
nLens = 1.55785;                        % index of refraction of N-BAK1/N-BK7 @1310nm
% Red Path in (in mm)
redPath = nFiber *(...
    1181 +   73 + 1180 + ...            % 50/50 coupler (source)
     895 +   60 +  943 + ...            % Circulator arms 1 & 2 (one-way)
     943 +   60 + 1055 + ...            % Circulator arms 2 & 3 (return)
    1184 +   73 + 1185)+ ...            % 50/50 coupler (detector)
    2*(22 + ...                         % Collimator length
    10 + 68 + 10 + ...                  % Collimator to X-galvo
    200 -(2*5.3)+ 15 + ...              % Telescope distance (X-galvo to scan lens)
    (nLens * 2 * 5.3) + ...             % LA1131-C telescope lens
    (nLens * 38.5) +...                 % Telecentric scan lens LSM04 length
    42.3);                              % Working ditance (LWD)
% Orange Path (in mm)
orangePath = 1060;
% Green Path (in mm)
greenPath = 2620;
% Electrical delay (conversion from mm to m)
electricalDelay = (redPath + orangePath - greenPath) / 1000;
minElectricalDelay = 28.3e-9;           % Minimum electrical clock delay
stepSizeClockDelay = 0.575e-9;          % the step size of clock delay
timeDelay = electricalDelay / c;        % Time delay between the clock and signal
% Number to use in the "Set clock delay" window
setClockDelay = round((timeDelay - minElectricalDelay) / stepSizeClockDelay);
fprintf('Set Clock Delay = %d [0x%X] \n',setClockDelay,setClockDelay)

% ==============================================================================
% [EOF]
