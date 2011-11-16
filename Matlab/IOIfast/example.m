%% Read TDMS file (works only with decimated data)
filename='D:\Edgar\Documents\ssoct\Matlab\Acquisition\DATA\EMGdata_long_decimated.tdms';

[ConvertedData,ConvertVer,ChanNames,GroupNames,ci]=convertTDMS(1,filename);

Data = ConvertedData.Data.MeasuredData;

% wf_increment: This property represents the increment between two consecutive
% samples on the x-axis. (in milliseconds)
dt = Data(3).Property(3).Value;
% increment of 1 second in serial date number 
deltaSec = datenum('07-Apr-2008 23:00:01')- datenum('07-Apr-2008 23:00:00');

% wf_start_time: This property represents the time at which the waveform was
% acquired or generated.
t0 = datenum(Data(3).Property(1).Value);

% We create our time vector really fast (not using addtodate)
t = t0 + dt*deltaSec*(0:Data(3).Total_Samples-1);


% milliseconds vector
% tms = round(dt*(0:Data(3).Total_Samples-1)');
% Time vector
% t = zeros([Data(3).Total_Samples 1]);
% Date conversion loop (really slow)
% for iDate=1:Data(3).Total_Samples,
%     t(iDate) = addtodate(t0, tms(iDate), 'millisecond');
% end

%% 
close all
% Choose a data range to display (10000 samples = 1 second)
dataRange = (20:40)*10000+1;
figure
subplot(231)
plot(t(dataRange), Data(3).Data(dataRange)) ,title('Monitor+')
datetick('x',13)
subplot(232)
plot(t(dataRange), Data(4).Data(dataRange)) ,title('Monitor-')
datetick('x',13)
subplot(233)
plot(t(dataRange), Data(5).Data(dataRange))  ,title('Nothing')
datetick('x',13)
subplot(234)
plot(t(dataRange), Data(6).Data(dataRange)) ,title('Nothing')
datetick('x',13)
subplot(235)
plot(t(dataRange), Data(7).Data(dataRange)) ,title('Stimulation ')
datetick('x',13)

%% Number of samples/channel
for i1=3:7
length(Data(i1).Data)
end

(length(Data(7).Data)-length(Data(6).Data))/length(Data(7).Data)



%% extract ttl
[out1 temps1]=TDMS2ttl(ConvertedData);
dataRange = 1:350000;
out=out1(dataRange,:);
temps=temps1(dataRange);
figure
subplot(3,1,1) 
plot(temps,out(:,1)) , title('Trig camera')
subplot(3,1,2)
plot(temps,out(:,2)), title('Trig Light')
subplot(3,1,3)
plot(temps,out(:,3))

%%
%read frame rpesent
 [Imout frameout frameReadOut fileNo] = LectureImageMultiFast('D:\Users\temp\AA01E51\','image',-1);
 
 % extact certain frame
 images=LectureImageMultiFast('D:\Users\temp\AA01E51\','image',frameReadOut(30:33,:));
 

 
 %% 
 clc
 for iLoop = 0:10,
     nSamples = 1024;
     offset = iLoop*(nSamples);
     fprintf('offset = %d\n',offset)
 end
