clear all
clc
close all
TrainDatabasePath = 'C:\Users\Veeru Subbu Ami\Desktop\PCA_based Face Recognition System - Copy\TrainDatabase';
FaceDetector= vision.CascadeObjectDetector();
videoFileReader = videoinput('winvideo',2);
while(1)
    frame = getsnapshot(videoFileReader);
    BB = step(FaceDetector, frame);
    figure(2),imshow(frame);
 for i = 1:size(BB,1)
rectangle('Position',BB(i,:),'LineWidth',3,'LineStyle','-  ','EdgeColor','r');
end
 for i = 1:size(BB,1)
 J= imcrop(frame,BB(i,:));
 K = imresize(J,[200 180]);
imwrite(K,['detected.jpg']);
 TestImage='C:\Users\Veeru Subbu Ami\Desktop\PCA_based Face Recognition System - Copy\detected.jpg';
 im=imread(TestImage);
T = CreateDatabase(TrainDatabasePath);
[m, A, Eigenfaces] = EigenfaceCore(T);
OutputName = Recognition(TestImage, m, A, Eigenfaces);
SelectedImage = strcat(TrainDatabasePath,'\',OutputName);
SelectedImage = imread(SelectedImage);
imshow(im)
title('Test Image');
figure,imshow(SelectedImage);
title('Equivalent Image');
str = strcat('Matched image is :  ',OutputName);
disp(str)
 end
end
