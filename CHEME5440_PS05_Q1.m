% CHEME 5440, PS05 
% Q1, Notch-Delta signalling 

clear all
close all

size_test=50; % number of test points
D1=linspace(0,1,size_test); 
D2=linspace(0,1,size_test); 

% initialize vectors and matricies 
ss_N1=zeros(1,size_test);
dD1=zeros(size_test,size_test); %matrix of phase vectors
ss_N2=zeros(1,size_test);
dD2=zeros(size_test,size_test); %matrix of phase vectors

null_N1=zeros(1,size_test);
D1_null=zeros(1,size_test);

null_N2=zeros(1,size_test);
D2_null=zeros(1,size_test);

%compute phase vectors 
for i=1:size_test  %index for D1 
    for j=1:size_test %index for D2
        
        ss_N1(i)= (D2(j)^2)/(0.1 + (D2(j)^2)); 
        dD1(j,i)= 1/(1 + 10*(ss_N1(i)^2)) - D1(i);
        
        ss_N2(j)= (D1(i)^2)/(0.1 + (D1(i)^2)); 
        dD2(j,i)= 1/(1 + 10*(ss_N2(j)^2)) - D2(j);     %not sure this is the right expression 
    end
end

%compute nullclines 
for k=1:size_test
    null_N1(k)= (D2(k)^2)/(0.1 + (D2(k)^2)); 
    D1_null(k)=  1/(1 + 10*(null_N1(k)^2));
    
    null_N2(k)= (D1(k)^2)/(0.1 + (D1(k)^2)); 
    D2_null(k)=  1/(1 + 10*(null_N2(k)^2));  
end

% plot 
figure(1)
%plot phase vectors
quiver(D1,D2,dD1,dD2,1.5,'k');
hold on 
%plot nullclines
plot(D1,D2_null,'-r');
plot(D1_null,D2,'-b');
xlim([0 1]); 
ylim([0 1]);
xlabel('D1');
ylabel('D2');
hold off 




