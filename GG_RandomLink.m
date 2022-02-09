function [outputArg1,outputArg2] = GG_RandomLink(X,GraphNumber,k,wm)
[m,n]=size(X);
A=zeros(m,m);%����һ��m*m��ȫ0����
%��A����ĶԽ���ȫ��Ϊ1
for iteration=1:GraphNumber
    clear A;
for i=1:m
    for j=1:m
        if j==i
            A(i,j) = 1;
        end
    end
end
for i=1:m
        notEqualNumber=i;
        randomNumber=randperm(m,k);
        while(find(randomNumber==i))
            randomNumber=randperm(m,k);
        end
        for j=1:k
            A(i,randomNumber(:,j))=1;
        end
end
%  [coeff,score,latent] = pca(X);
% % Coordinates =X(:,1:2);
% Coordinates =X;
% %��ͼ
% gplot(A,Coordinates)
%  biograph(A)
% Biograph object with 35 nodes and 35 edges.
% IDS={'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33','34','35'};
% bg=biograph(A,IDS);
% view(bg)
wm = sprintf('A_test_SuiJiLink_%d.txt',iteration);%%%%%%������ݲ�ͬ�����ݼ�����Ҫ����һ���������
filename = ['D:\matlab2019a\matlab files\FVP\Tabular Outlier Detection\Graph\',wm];
dlmwrite(filename,A','delimiter',' ');	%ע�⣬�����A������ת�ã�������ΪҪ��X*A�������ȶ�X����ת�ã�Ȼ��X*A��Ŀ������X��ÿһ�������ӵ��ھӵ�����ֵ�ۼ�����������Ӧ��Ҫ��AҲ����ת�á�
end
end

