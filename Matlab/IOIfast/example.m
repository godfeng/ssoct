% example to extract file from IOI setup #2
filename='D:\Users\temp\AA01E51\electro.tdms';
filename='D:\Temp\electro.tdms';
filename='D:\Temp\electro1.tdms';

[ConvertedData,ConvertVer,ChanNames,GroupNames,ci]=convertTDMS(1,filename);
%Ai0 EEG 1, (ground 3)
%Ai1 Respirator (ground 6)
%AI2 electrophysiology, pin 7 (ground 9) not connected yet
Data=ConvertedData.Data.MeasuredData;
dt= ConvertedData.Data.MeasuredData(4).Property(3).Value;

%% 
figure
plot(dt*(1:length(Data(3).Data )), Data(3).Data) ,title('ECG')
figure
plot(dt*(1:length(Data(4).Data )), Data(4).Data) ,title('Respirator')
figure
plot(dt*(1:length(Data(5).Data )), Data(5).Data)  ,title('electrophysiology')
figure
plot(dt*(1:length(Data(6).Data )), Data(6).Data) ,title('Stimulator')

%%
for i1=3:7
length(Data(i1).Data)
end

(length(Data(7).Data)-length(Data(6).Data))/length(Data(7).Data)



%% extract ttl
[out1 temps1]=TDMS2ttl(ConvertedData);
n=20000;
out=out1(1:n,:);
temps=temps1(1:n);
figure
subplot(3,1,1) 
plot(temps,out(:,1)) , title('Trig camera')
subplot(3,1,2)
plot(temps,out(:,2)), title('Trig Light')
subplot(3,1,3)
plot(temps,out(:,3))


%read frame rpesent
 [Imout frameout frameReadOut fileNo] = LectureImageMultiFast('D:\Users\temp\AA01E51\','image',-1);
 
 % extact certain frame
 images=LectureImageMultiFast('D:\Users\temp\AA01E51\','image',frameReadOut(30:33,:));
 