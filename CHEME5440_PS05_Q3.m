% CHEME 5440 PS05
% Question 3, Receptor signalling and adaptation in bacterial chemotaxis
clear all
close all
% The variable species are:
% x1 = E0
% x2 = E1
% x3 = E1*
% x4 = B
% x5 = Bp
% x6 = {E1*B}
% x7 = {E1*Bp}

% Parameters 
    % NOTE for ligand-dependant variables: manually change the value of L four times
L=10; % step-like change in ligand concen (test for values: 0.01, 0.1, 1, 10)

Vmax=0.02; % micromolar/s
a(1)= L/(1+L); % 1/s
a(2)= 1/(1+L); % 1/s
a(3)=100; % 1/s*micomolar
a(4)=1000; % 1/s*micomolar
d(1)=0.01; % 1/s
d(2)=1; % 1/s
k(1)=1; % 1/s
k(2)=0; 
k(3)=1; % 1/s*micomolar
k(4)=1; % 1/s
beta= (2.5*L)/(1+L); % 1/s

% Initial conditions
    % I set all ODEs equal to zero, and set L=0, then solved for the SS concentrations of x2, x3, ... x7
     % See CHEME5440_PS05_Q3_SSsolve.mlx file for this computation. 
    % I then manually computed the SS value of x1 using the relationship:
        % Total Concen E (10micromolar, given in paper) = x1 +x2 +x3 +x6 +x7
        % Thus, x1 = 10 - (x2 + x3 + x6 + x7) = 4379/500
x0 = [...
    4379/500     % SS CONCEN OF EACH SPECIES, WHEN L=0 (no attractant)
    1/50       
    101/500     
    1/202
    1/1000
    1
    1/50];     

% Time-span
tspan = [0 3000] ; % time-span in sec (will need to change for diff L's)
                   

% Use ODE45 solver
[t_out,x_out] = ode45(@(t,x) CHEME5440_PS05_ODE(t,x,Vmax,a,d,k,beta),tspan,x0); 

% Plot results in nM values
figure(1);
hold on;
plot(t_out,x_out(:,3)/x0(3),'-b'); 
%legend('3K','3K*','2K','2K*','Location','Best'); %'Location', 'Best' puts legend in the best spot
set(gcf,'Position', [548 171 423 334]);
set(gcf,'Color', [1 1 1]);
set(gca,'FontName','Arial');
set(gca,'FontSize',14);
set(gca,'XGrid','off');
set(gca,'XLim',tspan);
%set(gca,'YLim',[0 1.5]);
set(gca,'YGrid','off');
xlabel('Time (seconds)','FontName','Arial','FontSize',14);
ylabel('Activity (A/A_s_s)','FontName','Arial','FontSize',14);
title('Attractant: 0-10','FontName','Arial','FontSize',14); % CHANGE WITH L 
set(gca,'GridLineStyle','--');
set(gca,'TickDir','out');
box on;
grid on;
hold off;




