%_______________________________________________________________________________
% Copyright (C) 2011 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/03/07

%% OCT axial resolution
lambda0 = 1310e-9;                      % Center wavelength
delta_lambda = 100e-9;                  % FWHM in wavelength
zr_air = (2/pi)*log(2)*lambda0^2/...    % Axial resolution in air
    delta_lambda;
n = 1.4;                                % Index of refraction of tissue
zr = zr_air / n;                        % Axial resolution in tissue

%% OCT transverse resolution
EP = [4e-3 4e-3 4e-3];                  % Entrance pupil diameter
beamWaist = [3.4 3.4 3.4]*1e-3;         % F280APC-C beam diameter
EFL = [18 36 54]*1e-3;                  % Effective Focal Length
% Numerical Aperture
NA = sqrt(1 ./ (1 + (2.*EFL./beamWaist).^2));  
rr = (2/pi)*lambda0./NA;                % Transverse (lateral) resolution

%% Maximum path difference (Field Of View of a FDOCT) (Penetration depth)
Ns = 1170;                              % Number of samples (Ns_max = 1286)
delta_Z_Nq = lambda0^2 * Ns / (4*delta_lambda*n);
n_air = 1;                              % Index of refraction of air
delta_Z_Nq_air = lambda0^2 * Ns / (4*delta_lambda*n_air);