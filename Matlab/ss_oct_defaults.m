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
% Number of samples per A-line (1170). 1128 if sampling frequency is fixed to
% 125 MHz
ssOCTdefaults.NSAMPLES          = 1128;
% Number of samples to perform FFT
ssOCTdefaults.nSamplesFFT       = 2^nextpow2(2*ssOCTdefaults.NSAMPLES);
% Sampling in K-space
ssOCTdefaults.kClockSampling    = [...
    0;0.0002083;0.0004166;0.003408;0.01423;0.041731;0.098132;0.19747;0.35274;0.57344;0.86474;1.2281;1.6617;2.1606;2.7174;3.3236;3.9688;4.6414;5.3292;6.0223;6.7143;7.4026;8.0858;8.7622;9.4303;10.089;10.739;11.381;12.017;12.65;13.281;13.913;14.551;15.197;15.856;16.528;17.213;17.909;18.614;19.324;20.035;20.746;21.454;22.162;22.87;23.577;24.284;24.991;25.696;26.402;27.108;27.817;28.529;29.245;29.967;30.695;31.428;32.167;32.913;33.669;34.434;35.207;35.986;36.77;37.557;38.343;39.127;39.907;40.682;41.45;42.213;42.974;43.734;44.496;45.261;46.03;46.804;47.585;48.374;49.167;49.964;50.765;51.569;52.377;53.184;53.991;54.797;55.605;56.417;57.234;58.054;58.875;59.698;60.525;61.359;62.202;63.052;63.906;64.763;65.619;66.476;67.334;68.189;69.041;69.887;70.728;71.565;72.403;73.244;74.09;74.937;75.785;76.633;77.483;78.336;79.197;80.069;80.956;81.861;82.784;83.73;84.701;85.706;86.754;87.856;89.019;90.245;91.528;92.857;94.219;95.604;97.002;98.405;99.805;101.19;102.56;103.89;105.19;106.44;107.66;108.85;109.99;111.11;112.19;113.26;114.32;115.37;116.42;117.47;118.52;119.57;120.61;121.66;122.69;123.71;124.71;125.69;126.64;127.56;128.46;129.34;130.22;131.09;131.97;132.87;133.78;134.72;135.67;136.64;137.63;138.63;139.64;140.66;141.69;142.71;143.73;144.75;145.77;146.78;147.78;148.78;149.78;150.78;151.77;152.77;153.76;154.75;155.75;156.74;157.74;158.74;159.74;160.74;161.74;162.74;163.75;164.75;165.75;166.75;167.75;168.75;169.75;170.75;171.75;172.75;173.75;174.75;175.75;176.75;177.75;178.75;179.75;180.75;181.75;182.75;183.75;184.75;185.75;186.75;187.75;188.75;189.75;190.75;191.75;192.76;193.79;194.83;195.9;196.98;198.07;199.17;200.27;201.37;202.46;203.54;204.61;205.66;206.71;207.74;208.77;209.78;210.79;211.79;212.78;213.78;214.78;215.79;216.81;217.85;218.91;219.99;221.08;222.19;223.3;224.42;225.52;226.62;227.7;228.77;229.82;230.87;231.92;232.97;234.03;235.1;236.17;237.25;238.34;239.43;240.51;241.59;242.66;243.73;244.79;245.85;246.92;247.99;249.07;250.16;251.26;252.37;253.49;254.63;255.78;256.95;258.14;259.35;260.59;261.84;263.12;264.41;265.72;267.04;268.35;269.66;270.96;272.25;273.52;274.79;276.06;277.33;278.6;279.85;281.1;282.34;283.57;284.81;286.06;287.31;288.57;289.84;291.09;292.34;293.58;294.8;296.01;297.22;298.42;299.63;300.83;302.05;303.27;304.5;305.73;306.96;308.17;309.36;310.53;311.66;312.77;313.86;314.93;315.99;317.05;318.13;319.2;320.29;321.38;322.47;323.58;324.7;325.83;326.97;328.11;329.26;330.39;331.53;332.66;333.79;334.92;336.05;337.18;338.31;339.43;340.55;341.66;342.78;343.9;345.03;346.16;347.28;348.41;349.53;350.65;351.77;352.9;354.03;355.16;356.29;357.41;358.52;359.63;360.73;361.84;362.95;364.06;365.18;366.3;367.44;368.59;369.74;370.91;372.07;373.24;374.41;375.57;376.73;377.89;379.04;380.19;381.33;382.48;383.63;384.78;385.94;387.09;388.25;389.4;390.54;391.67;392.79;393.9;395.01;396.11;397.21;398.31;399.42;400.53;401.65;402.79;403.93;405.08;406.22;407.37;408.51;409.64;410.78;411.92;413.07;414.22;415.39;416.58;417.77;418.96;420.15;421.34;422.51;423.67;424.81;425.93;427.04;428.15;429.26;430.38;431.51;432.66;433.81;434.98;436.15;437.31;438.48;439.64;440.79;441.94;443.08;444.22;445.36;446.51;447.67;448.84;450.02;451.19;452.35;453.5;454.62;455.74;456.84;457.94;459.03;460.14;461.26;462.4;463.56;464.73;465.92;467.1;468.29;469.46;470.63;471.78;472.94;474.09;475.23;476.37;477.51;478.65;479.8;480.95;482.1;483.25;484.4;485.55;486.7;487.85;489.01;490.16;491.31;492.46;493.62;494.79;495.95;497.12;498.3;499.49;500.68;501.87;503.06;504.24;505.41;506.58;507.75;508.93;510.11;511.3;512.49;513.68;514.87;516.06;517.26;518.46;519.66;520.84;522.01;523.16;524.32;525.47;526.64;527.8;528.97;530.15;531.33;532.52;533.71;534.9;536.09;537.26;538.43;539.59;540.75;541.91;543.08;544.25;545.42;546.61;547.8;548.99;550.17;551.34;552.5;553.65;554.79;555.93;557.07;558.21;559.34;560.48;561.63;562.78;563.93;565.09;566.26;567.42;568.6;569.77;570.94;572.12;573.29;574.46;575.63;576.8;577.98;579.16;580.34;581.53;582.72;583.9;585.08;586.25;587.41;588.57;589.72;590.87;592.02;593.18;594.34;595.51;596.69;597.87;599.04;600.22;601.38;602.53;603.67;604.82;605.96;607.12;608.29;609.47;610.67;611.87;613.07;614.27;615.44;616.6;617.75;618.88;620.01;621.14;622.28;623.44;624.6;625.78;626.96;628.14;629.32;630.5;631.68;632.85;634.02;635.18;636.34;637.49;638.63;639.77;640.91;642.05;643.19;644.33;645.49;646.66;647.84;649.02;650.2;651.39;652.58;653.77;654.95;656.14;657.33;658.52;659.71;660.9;662.09;663.26;664.43;665.59;666.74;667.89;669.04;670.18;671.33;672.48;673.63;674.78;675.94;677.1;678.27;679.42;680.58;681.73;682.89;684.05;685.21;686.39;687.57;688.77;689.96;691.16;692.36;693.56;694.76;695.95;697.14;698.32;699.49;700.66;701.84;703.02;704.2;705.37;706.54;707.71;708.86;710.01;711.15;712.28;713.41;714.53;715.66;716.8;717.95;719.09;720.25;721.41;722.58;723.75;724.93;726.11;727.3;728.49;729.69;730.88;732.07;733.25;734.41;735.56;736.7;737.83;738.96;740.09;741.22;742.36;743.5;744.65;745.81;746.96;748.12;749.29;750.46;751.64;752.83;754.03;755.23;756.43;757.61;758.78;759.92;761.03;762.12;763.2;764.27;765.35;766.45;767.57;768.71;769.87;771.05;772.24;773.45;774.66;775.87;777.09;778.3;779.52;780.73;781.93;783.12;784.3;785.46;786.62;787.77;788.91;790.05;791.19;792.32;793.45;794.58;795.72;796.87;798.03;799.2;800.37;801.54;802.71;803.88;805.05;806.21;807.37;808.52;809.68;810.83;811.99;813.14;814.3;815.45;816.61;817.78;818.94;820.11;821.26;822.41;823.55;824.68;825.81;826.94;828.06;829.19;830.32;831.46;832.61;833.76;834.92;836.08;837.24;838.4;839.54;840.68;841.82;842.95;844.08;845.2;846.32;847.44;848.56;849.69;850.83;851.97;853.11;854.25;855.39;856.52;857.65;858.78;859.91;861.05;862.2;863.35;864.49;865.63;866.77;867.91;869.05;870.19;871.34;872.48;873.62;874.75;875.88;877.01;878.16;879.32;880.49;881.68;882.87;884.07;885.26;886.43;887.6;888.75;889.89;891.02;892.14;893.25;894.36;895.46;896.55;897.64;898.73;899.83;900.93;902.04;903.15;904.26;905.37;906.48;907.58;908.68;909.78;910.87;911.97;913.08;914.18;915.29;916.4;917.53;918.66;919.8;920.95;922.11;923.27;924.44;925.61;926.79;927.96;929.12;930.28;931.43;932.58;933.72;934.86;935.99;937.12;938.24;939.37;940.51;941.66;942.83;944.02;945.23;946.45;947.68;948.92;950.16;951.39;952.61;953.82;955.02;956.19;957.36;958.5;959.64;960.77;961.9;963.03;964.16;965.29;966.4;967.51;968.61;969.68;970.75;971.8;972.83;973.87;974.92;975.98;977.05;978.14;979.23;980.34;981.44;982.54;983.62;984.7;985.76;986.8;987.83;988.84;989.85;990.84;991.83;992.81;993.79;994.77;995.75;996.74;997.73;998.73;999.72;1000.7;1001.7;1002.7;1003.7;1004.7;1005.7;1006.8;1007.8;1008.8;1009.8;1010.8;1011.8;1012.8;1013.8;1014.8;1015.8;1016.8;1017.8;1018.7;1019.7;1020.7;1021.7;1022.7;1023.7;1024.7;1025.7;1026.8;1027.8;1028.8;1029.8;1030.8;1031.7;1032.7;1033.7;1034.7;1035.6;1036.5;1037.4;1038.3;1039.2;1040.1;1041;1041.9;1042.8;1043.7;1044.7;1045.6;1046.6;1047.6;1048.7;1049.7;1050.7;1051.7;1052.7;1053.8;1054.8;1055.8;1056.8;1057.8;1058.8;1059.8;1060.9;1061.9;1062.9;1063.9;1064.9;1065.9;1067;1068;1069.1;1070.1;1071.1;1072.1;1073.1;1074.1;1075;1076;1076.9;1077.8;1078.7;1079.6;1080.5;1081.4;1082.2;1083.1;1084;1084.8;1085.7;1086.5;1087.4;1088.3;1089.1;1090;1090.8;1091.7;1092.5;1093.3;1094.1;1094.9;1095.7;1096.5;1097.3;1098.1;1098.9;1099.7;1100.5;1101.3;1102.1;1103;1103.8;1104.6;1105.4;1106.2;1107;1107.8;1108.6;1109.3;1110.1;1110.9;1111.7;1112.5;1113.3;1114;1114.8;1115.5;1116.3;1117;1117.7;1118.5;1119.2;1119.9;1120.7;1121.4;1122.2;1122.9;1123.7;1124.5;1125.3;1126;1126.8;1127.5;1128.3;1129;1129.7;1130.4;1131.1;1131.8;1132.5;1133.2;1133.8;1134.5;1135.1;1135.8;1136.4;1137.1;1137.8;1138.4;1139.1;1139.8;1140.5;1141.2;1141.9;1142.6;1143.3;1144;1144.6;1145.3;1145.9;1146.6;1147.2;1147.8;1148.5;1149.1;1149.7;1150.3;1150.9;1151.5;1152.1;1152.7;1153.3;1153.8;1154.4;1155;1155.6;1156.2;1156.8;1157.4;1158;1158.6;1159.1;1159.7;1160.2;1160.8;1161.4;1162;1162.7;1163.3;1164;1164.6];
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
ssOCTdefaults.GUI.displayLog        = false;
% Display Color Bar
ssOCTdefaults.GUI.displayColorBar   = true;
% Interferogram signal plot
ssOCTdefaults.GUI.displaySingleLine = true;
% Colormap to be used
ssOCTdefaults.GUI.OCTcolorMap       = get_colormaps('bow');
% Show FWHM in real time
ssOCTdefaults.GUI.showFWHM          = false;
% Correct B-scan in real-time
ssOCTdefaults.corrBscan             = false;
% ResamPling data at k-clock frequency
ssOCTdefaults.resampleData          = false;
% Calculate reference signal as the median A-line of current B-scan
ssOCTdefaults.medianRefArm          = false;


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
ssOCTdefaults.axial.lambda0             = 1310e-9;
% Wavelength range
ssOCTdefaults.axial.minLambda           = 1258e-9;
ssOCTdefaults.axial.maxLambda           = 1361.2e-9;
% FWHM in wavelength
% ssOCTdefaults.axial.delta_lambda      = 100e-9;
ssOCTdefaults.axial.delta_lambda        = ssOCTdefaults.axial.maxLambda - ...
    ssOCTdefaults.axial.minLambda;
% Axial resolution in air
ssOCTdefaults.axial.zr_air              = (2/pi)*log(2)*...
    ssOCTdefaults.axial.lambda0^2 / ssOCTdefaults.axial.delta_lambda;
% Index of refraction of tissue
ssOCTdefaults.axial.n                   = 1.4;
% Axial resolution in tissue
ssOCTdefaults.axial.zr                  = ssOCTdefaults.axial.zr_air / ssOCTdefaults.axial.n;

%===============================================================================
% OCT transverse (lateral) resolution
%===============================================================================
% Entrance pupil diameter
ssOCTdefaults.lateral.EP                = [4e-3 4e-3 4e-3];
% F280APC-C beam diameter
ssOCTdefaults.lateral.beamWaist         = [3.4 3.4 3.4]*1e-3;
% Effective Focal Length [LSM02 LSM03 LSM04]
ssOCTdefaults.lateral.EFL               = [18 36 54]*1e-3;
% Numerical Aperture
ssOCTdefaults.lateral.NA                = sqrt(1 ./ (1 + (2.*...
    ssOCTdefaults.lateral.EFL ./ ssOCTdefaults.lateral.beamWaist).^2));  
% Transverse (lateral) resolution for different scan lenses [LSM02 LSM03 LSM04]
ssOCTdefaults.lateral.rr                = (2/pi)*ssOCTdefaults.axial.lambda0 ./ ...
    ssOCTdefaults.lateral.NA;

%===============================================================================
% Maximum path difference (Scan Range of a FDOCT) (Penetration depth)
%===============================================================================
ssOCTdefaults.range.delta_Z_Nq          = ssOCTdefaults.axial.lambda0^2 * ...
    ssOCTdefaults.NSAMPLES / (4*ssOCTdefaults.axial.delta_lambda*ssOCTdefaults.axial.n);
% Index of refraction of air
ssOCTdefaults.range.n_air               = 1;
ssOCTdefaults.range.delta_Z_Nq_air      = ssOCTdefaults.axial.lambda0^2 * ...
    ssOCTdefaults.NSAMPLES / (4*ssOCTdefaults.axial.delta_lambda*ssOCTdefaults.range.n_air);
% Wavenumber range
ssOCTdefaults.range.minK                = 2*pi / ssOCTdefaults.axial.maxLambda;
ssOCTdefaults.range.maxK                = 2*pi / ssOCTdefaults.axial.minLambda;
% Wavenumbers column vector
ssOCTdefaults.range.vectorK             = linspace(ssOCTdefaults.range.maxK,...
    ssOCTdefaults.range.minK, ssOCTdefaults.NSAMPLES)';
% Lambda Column Vector (in nm)
ssOCTdefaults.range.vectorLambda        = 2*pi ./ ssOCTdefaults.range.vectorK;
% z-axis in um (air)
ssOCTdefaults.range.zAxis_air           = linspace(ssOCTdefaults.range.delta_Z_Nq_air ./...
    ssOCTdefaults.NSAMPLES,ssOCTdefaults.range.delta_Z_Nq_air,ssOCTdefaults.NSAMPLES);
% z-axis in um (tissue)
ssOCTdefaults.range.zAxis               = linspace(ssOCTdefaults.range.delta_Z_Nq ./...
    ssOCTdefaults.NSAMPLES,ssOCTdefaults.range.delta_Z_Nq,ssOCTdefaults.NSAMPLES);
% Positive z-axis in um (air)
ssOCTdefaults.range.posZaxis_air        = linspace(ssOCTdefaults.range.delta_Z_Nq_air ./...
    ssOCTdefaults.NSAMPLES,ssOCTdefaults.range.delta_Z_Nq_air,ssOCTdefaults.NSAMPLES/2);
% Positive z-axis in um (tissue)
ssOCTdefaults.range.posZaxis            = linspace(ssOCTdefaults.range.delta_Z_Nq ./...
    ssOCTdefaults.NSAMPLES,ssOCTdefaults.range.delta_Z_Nq,ssOCTdefaults.NSAMPLES/2);
% ==============================================================================
% [EOF]
