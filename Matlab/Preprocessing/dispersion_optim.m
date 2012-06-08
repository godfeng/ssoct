function M = dispersion_optim(frame, wavenumbers, a)
% This calculates the contrast of the image and returns M, the lower the
% value of M, the higher the contrast is.
% SYNTAX:
% M = dispersion_optim(frame, wavenumbers, a)
% INPUTS:
% frame         Interference pattern after reference substraction, division,
%               hanning window and interpolation.
% wavenumbers   Structure with pixels in k-space and linear space
% a             Dispersion compensation vector with a(1) = a_2, a(2) = a_3, etc.
% OUTPUTS:
% M             Figure of merit for the contrast
%_______________________________________________________________________________
% Copyright (C) 2012 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edward Baraghis, Edgar Guevara
% 2012/06/08

% Execute dispersion compensation routine
frame = dispersion_comp(frame, wavenumbers, a);

% Fourier transform the interferogram
% frame = ifft(frame,[],1);

% Structural image is the fft of the frame
% frame_of_interest = abs(frame);

frame_of_interest = abs(Bscan2FFT(frame));

% First derivative of the structural image
derivative = abs(diff(frame_of_interest));

% Figure of merit for the contrast
M = 1/sum(sum(derivative));
