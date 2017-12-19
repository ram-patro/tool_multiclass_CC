function image_feature_disp(ref)
%ref
%save ref ref
D1=[];
for i=1:numel(ref.uqm)
    D1=[D1;ref.uqm{i}'];
end
D1=D1*255;
D2=[];
for i=1:numel(ref.dev)
    D2=[D2;ref.dev{i}'];
end
%D2=D2+min(D2(:));
D2=(D2/max(D2(:)))*255;
D3=(ref.prob/max(ref.prob))*255;
D4=(ref.class/max(ref.class))*255;
D=[D1 D2 D3' D4'];
figure,imshow(imresize(uint8(D),9,'method','nearest'));
    

