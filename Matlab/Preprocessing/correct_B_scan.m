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

correctionMatrix = repmat(sampleArm,[1 SSOctDefaults.nLinesPerFrame]);
correctedBscan = (double(rawBscan)-correctionMatrix)./(correctionMatrix);

