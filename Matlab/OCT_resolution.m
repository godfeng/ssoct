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
fprintf('Tranverse resolution = %.2f mm\n',delta_Z_Nq_air*1e3)

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
c = 299792458;                          % Speed of light in air
nFiber = 1.47;                          % effective index of refraction of the fiber
redPath = nFiber*(1181+1180+1056+1058+1056+(1058+27+43)*2+1056+1179+1185)+...
    (15+20+35+43+30)*2;                 % Red Path in mm
% Electrical delay (in m)
electricalDelay = (redPath + 1060 - 2620) / 1000;
minElectricalDelay = 28.3e-9;           % Minimum electrical clock delay
stepSizeClockDelay = 0.575e-9;          % the step size of clock delay
timeDelay = electricalDelay / c;        % Time delay between the clock and signal
% Number to use in the "Set clock delay" window
setClockDelay = round((timeDelay - minElectricalDelay) / stepSizeClockDelay);
