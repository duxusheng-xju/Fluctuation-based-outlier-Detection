% function [GraphNumber,k] = demo(inputArg1,inputArg2)
% 
% %%%%%%%��������ķ�ʽ����
% % X=load('Normalization_glass.txt');
% % [m,n]=size(X);
% % for i=10:m
% %     for j=50:256
% %     k=i;
% %     GraphNumber=j;
% %     fprintf('k=%8.5f,GraphNumber=%8.5f\n',k,GraphNumber)
% %     main(GraphNumber,k);
% %     end
% % end
% X=load('Normalization_lympho.txt');
% [m,n]=size(X);
% Select_Parameter_times=20;
% for i=1:Select_Parameter_times
%     k=randperm(m,1);
% %     GraphNumber=randperm(256,1);%%%%���ɴ�1-256�м��һ��������� 
%     GraphNumber=2;
%     fprintf('k=%8.5f,GraphNumber=%8.5f\n',k,GraphNumber)
%     main(GraphNumber,k);
% end
% end

function [outputArg1,outputArg2] = main(GraphNumber,k)
% X=load('Normalization_wine.txt');
X=load('Normalization_test.txt');
%��������
GraphNumber=2;
k=10;
Abnormal_number=4;%�쳣��������
Label=load('Label_test.txt');
ADLabels=load('Label_test.txt');
%%%%����ͼ֮ǰ�������֮ǰ���ɵ�ͼ����Ȼ���ظ�д�롣
% delete 'D:\matlab2019a\matlab files\FVP\Graph' '.txt'
cd ('D:\matlab2019a\matlab files\FVP\Tabular Outlier Detection\Graph')
delete *.txt
GG_RandomLink(X,GraphNumber,k);
% tic
FVP(X',GraphNumber,Abnormal_number,ADLabels,Label,k);%�����X������ת��
% toc


%%%%%%%����ﵽһ����AUCֵ��ֹͣ���㣬�����ѭ���Լ�



end