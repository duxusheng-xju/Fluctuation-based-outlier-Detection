function [] = FeatureValuePropagation(X,GraphNumber,Abnormal_number,ADLabels,Label,k)
[m,n]=size(X);
% tic
for i=1:GraphNumber
    fileName = ['A_test_SuiJiLink_' num2str(i)  '.txt'];%%%%%ע�⣬�������ҲҪ��һ�¡�
    A=load(fileName);
    tic
    Z=X*A;
    test=sum(X);
    test_demo=sum(Z);
    fluction(:,i)=(test./test_demo)';
% fluction(:,i)=(test_demo./test)';
% fluction=sum(Z-X);
end
%�ٴγ���һ�ּ���OFֵ�ķ���
%����������������Ⱥ��Ĳ����̶Ȳ�ͬ����ô�����������ӹ�ϵ���������ǵĲ���ֵ֮��Ĳ��죬����Խ��Խ�п�������Ⱥ�㡣
%
ChangeRate=sum(fluction,2);

% for ii=1:n
%     for j=1:k
%         Nk=find(A(:,ii)~=0);
%         diff(ii,j) = abs(ChangeRate(ii,:)-ChangeRate(Nk(j,:),:));
%     end
% end

%������forѭ������������ʱ�俪��
for ii=1:n
    Nk=find(A(:,ii)~=0);
    %�ڶ�������˼���Ч�ʵ�OFֵ���㷨
    OF(ii,:)=sum(abs(ChangeRate(ii,:)-ChangeRate(Nk,:))) ;
%     OF=OF_test ./ k;
end
toc

% OF=sum(diff,2)./k;


[value_outlier,index_outlier]=sort(OF);

auc = Measure_AUC(OF, ADLabels);
disp(auc)
 



 %��������
 ODA_AbnormalObject_Number=index_outlier(n-Abnormal_number+1:end,:);%outlier dGraphNumberection algorithm �㷨�϶����쳣����ı��
ODA_NormalObject_Number=index_outlier(1:n-Abnormal_number,:);%outlier dGraphNumberection algorithm�㷨�϶�����������ı��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%�㷨ʵ�ʵļ����/׼ȷ��/���ʵ�����ָ��ļ���%%%%%%%%%%%%%%%%%%%%%%%%
%%%%Real_NormalObject_Number��ʾ���ݼ�����������������ı�ţ�Real_AbnormalObject_Number��ʾ���ݼ��������쳣����ı��
[Real_NormalObject_Number,Real_Normal]=find(Label==0);
[Real_AbnormalObject_Number,Real_Abnormal]=find(Label==1);

%�������쳣���󣬷�������������
TP=length(intersect(Real_AbnormalObject_Number,ODA_AbnormalObject_Number));
FP=length(Real_AbnormalObject_Number)-TP;
TN=length(intersect(Real_NormalObject_Number,ODA_NormalObject_Number));
FN=length(Real_NormalObject_Number)-TN;

%׼ȷ��
ACC=(TP+TN)/(TP+TN+FP+FN);
fprintf('׼ȷ��ACC= %8.5f\n',ACC*100)
%�����==��ȫ��=R
DR=TP/(TP+FN);
fprintf('�����DR= %8.5f\n',DR*100)
%��׼��P
P=TP/(TP+FP);
fprintf('��׼��P= %8.5f\n',P*100)
%����
FAR=FP/(TN+FP);
fprintf('����FAR= %8.5f\n',FAR*100)


% if DR< 66.66
% demo(100,1)
% end
end

