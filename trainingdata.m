FaceDetector= vision.CascadeObjectDetector();
videoFileReader = videoinput('winvideo', 2);
for i=61:100
    frame = getsnapshot(videoFileReader);
    BB = step(FaceDetector, frame);
    figure(2),imshow(frame);
 for j = 1:size(BB,1)
rectangle('Position',BB(j,:),'LineWidth',3,'LineStyle','-  ','EdgeColor','r');
end
 for k = 1:size(BB,1)
 J= imcrop(frame,BB(k,:));
 K = imresize(J,[200 180]);
figure, imshow(K)
imwrite(K,[int2str(i),'.jpg']);
  %im(i)=image(J);
 end
 
end