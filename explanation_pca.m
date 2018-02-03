clear;
clc;
close all;
Data=imread('123.jpg');
Data_gray=rgb2gray(Data);
Data_grayD=im2double(Data_gray);
figure,set(gcf,'numbertitle','off','name','grayscale image');
imshow(Data_grayD)
Data_mean=mean(Data_grayD);
[a b]=size(Data_gray);
Data_meanNew=repmat(Data_mean,a,1);
Dataadjust=Data_grayD-Data_meanNew;
%figure,set(gcf,'numbertitle','off','name','dataadjust');
%imshow(Dataadjust);
cov_Data=cov(Dataadjust);
[V, D]=eig(cov_Data);
V_trans=transpose(V);
%figure,set(gcf,'numbertitle','off','name','data trans');
%imshow(V_trans);

Dataadjust_trans=transpose(Dataadjust);
finaldata=V_trans*Dataadjust_trans;

% end of PCA code

%start of inverse PCA code
originaldata_trans=inv(V_trans)*finaldata;
originaldata=transpose(originaldata_trans)+Data_meanNew;
%figure,
%set(gcf,'numbertitle','off','name','RecoveredIMage');
%imshow(originaldata)
%end of inverse PCA code

%image compression
PCs=100
PCs=b-PCs;
reduced_V=V;
for i=1:PCs,
    reduced_V(:,1)=[];
end
Y=reduced_V'*Dataadjust_trans;
compressed_Data=reduced_V*Y;
compressed_Data=compressed_Data' +Data_meanNew;
figure,
set(gcf,'numbertitle','off','name','compressedimage');
imshow(compressed_Data)
