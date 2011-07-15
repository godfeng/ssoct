function correctedBscan = correct_B_scan(rawBscan)
%_______________________________________________________________________________
% Copyright (C) 2010 LIOM Laboratoire d'Imagerie Optique et Moléculaire
%                    École Polytechnique de Montréal
% Edgar Guevara
% 2011/07/11

% Modifies values of global variable
global SSOctDefaults

% Values taken previously
sampleArm   = SSOctDefaults.sampleArm;
refArm      = SSOctDefaults.refArm;

% Reference (correction matrix)
correctionMatrix = repmat((sampleArm + refArm)/2, [1 SSOctDefaults.nLinesPerFrame]);
% Normaliza by th reference????
correctedBscan = (double(rawBscan) - correctionMatrix) ./ correctionMatrix;
% Hanning window
correctedBscan = correctedBscan.*repmat(hanning(SSOctDefaults.NSAMPLES), ...
    [1 SSOctDefaults.nLinesPerFrame]);
