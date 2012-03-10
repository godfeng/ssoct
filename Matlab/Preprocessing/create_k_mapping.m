% Create a mapping function from pixel spacing to k-spacing
%% Load and prepare data
clear; close all; clc
load (fullfile('D:\Edgar\Documents\ssoct\Matlab\Misc','coupler_50_50.mat'))
[b,a] = butter(16, 0.2, 'low');
ref_hi_filt = filtfilt(b, a, mean(ref_hi,2));
NSAMPLES = 1128;
nLinesPerFrame = 512;
fixedSampling = linspace(0,NSAMPLES - 1,NSAMPLES)';
B_hi_corr = mean(B_hi(:)).*(B_hi - ref_hi_filt(:,ones(512, 1))) ./ ref_hi_filt(:,ones(512, 1));
B_hi_corr = mean(B_hi_corr(:, 300:325),2);
figure(1)
plot(fixedSampling, B_hi_corr, fixedSampling, B_hi(:,200), fixedSampling, ref_hi_filt)
legend({'Reference Corrected' 'Raw' 'Reference'}, 'location', 'SouthEast')

%% Theoretical sinus zero-crossing

A_theo = 3000*sin(2*pi*0.0374*fixedSampling + 5)';
[ind_theo, t_theo] = crossing(A_theo, fixedSampling);
ind_theo = ind_theo'; t_theo = t_theo';
figure(2)
subplot(211)
plot(fixedSampling, A_theo, 'k-', t_theo, 0, 'ro')
legend({'Theoretical' 'zero-cross'}, 'location', 'SouthEast')

%% Experimental zero-crossing
[ind_corr t_corr] = crossing(B_hi_corr, fixedSampling);
ind_corr = ind_corr'; t_corr = t_corr';
t_corr = round(t_corr);
figure(2)
subplot(212)
plot(fixedSampling, B_hi_corr, 'b-', t_corr, 0, 'ro')
legend({'Experimental' 'zero-cross'}, 'location', 'SouthEast')

%% T experimental vs Theoretical
figure(3)
subplot(211)
plot(t_theo, 'k-')
hold on
plot (t_corr, 'b*')
legend({'T theo' 'T exp'}, 'location', 'SouthEast')


%% Measured k-clock sampling
load (fullfile('D:\Edgar\Documents\ssoct\Matlab\Misc','phase.mat'))
k0 = data.k;
figure(3)
subplot(212)
plot (fixedSampling, fixedSampling, 'k-', fixedSampling, k0, 'g.')
legend({'Pixel spacing' 'k spacing'}, 'location', 'SouthEast')

%% Instantaneous T
% Pad my t_corr vector with initial and final values in order to avoid edge
% artifacts
NPAD = 50;
t_corr_res = resample([repmat(t_corr(1), [NPAD 1]); t_corr; repmat(t_corr(end), ...
    [NPAD 1])], NSAMPLES, numel(t_corr), 40);
% Extract the relevant portion of the signal
extraElements = round(NPAD*NSAMPLES/numel(t_corr));
t_corr_res = t_corr_res(extraElements+1:end-extraElements-1);
% figure;
% plot(t_corr_res, 'b-')
fprintf('Interpolation samples: %d\n',numel(t_corr_res))

%% Interpolation
% frame=interp1(wavenumbers.pixels,frame,wavenumbers.linear,'linear');
B_hi_interp = interp1(fixedSampling, B_hi_corr, t_corr_res, 'linear');
figure(4)
plot(fixedSampling, B_hi_corr, 'b-', fixedSampling, B_hi_interp, 'r-', fixedSampling, A_theo, 'k--')
legend({'Raw' 'Interpolated' 'Theoretical'}, 'location', 'SouthEast')

%% Calculate again zero-crossing
[ind_interp t_interp] = crossing(B_hi_interp, fixedSampling);
ind_interp = ind_interp'; t_interp = t_interp';
figure(5)
hold on
plot(diff(t_theo), 'k.')
plot(diff(t_corr), 'bo')
plot (diff(t_interp), 'rs')
legend({'\DeltaT Theo.' '\DeltaT Exp.' '\DeltaT Exp. Interp.'}, 'location', 'SouthEast')
tilefigs
