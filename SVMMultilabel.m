X_train_file='F:\matlab\Assignment3Dataset\Multi Label Scene Data\X_train.mat';
X_test_file='F:\matlab\Assignment3Dataset\Multi Label Scene Data\X_test.mat';
Y_train_file='F:\matlab\Assignment3Dataset\Multi Label Scene Data\Y_train.mat';
Y_test_file='F:\matlab\Assignment3Dataset\Multi Label Scene Data\Y_test.mat';
X_train=importdata(X_train_file);
X_test=importdata(X_test_file);
Y_train=importdata(Y_train_file);
Y_test=importdata(Y_test_file);
Y_train_T = transpose(Y_train);
Y_test_T = transpose(Y_test);
SVMModel = cell(6,1);
Y_label_SVM= zeros(6,907);
for k=1:6
    SVMModel{k} = fitcsvm(X_train,Y_train_T(k,:),'KernelFunction','polynomial','PolynomialOrder',2);
end
for k=1:6
    Y_label_SVM(k,:) =predict(SVMModel{k},X_test);
end
intrCount=zeros(1,907);
unionCount=zeros(1,907);
for i=1:6
    for j=1:907
        if (Y_label_SVM(i,j)&Y_test_T(i,j)) == 1
            intrCount(1,j)=intrCount(1,j)+1;
        end    
        if (Y_label_SVM(i,j)|Y_test_T(i,j)) ~= 0
            unionCount(1,j)=unionCount(1,j)+1;
        end
    end
end
Accuracy=zeros(1,907);
for i=1:907
    Accuracy(1,i)=intrCount(1,i)/unionCount(1,i);
end
Sum_accuracy=0;
for i=1:907
    Sum_accuracy=Sum_accuracy+Accuracy(1,i);
end
SVM_Multilabe_Poly_accuracy=Sum_accuracy/907*100;
Ouput = sprintf('Percentage of accuracy on test data using SVM(Polynomial Kernel)  %f',SVM_Multilabe_Poly_accuracy);
disp(Ouput);