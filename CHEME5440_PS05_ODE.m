function dxdt = CHEME5440_PS05_ODE(t,x,Vmax,a,d,k,beta); %make SURE this line matches the file name

dxdt = zeros(7,1);

dxdt(1) = -Vmax + k(1)*x(7) + k(2)*x(6); 

dxdt(2) = Vmax - a(2)*x(2) + a(1)*x(3) + beta*x(7) + beta*x(6);

dxdt(3) = a(2)*x(2) - a(1)*x(3) - a(3)*x(3)*x(5) + d(1)*x(7) - a(4)*x(3)*x(4) + d(2)*x(6); 

dxdt(4) =  -a(4)*x(3)*x(4) + d(2)*x(6) + k(2)*x(6) - k(3)*x(3)*x(4) + k(4)*x(5) + beta*x(6); 

dxdt(5) = -a(3)*x(3)*x(5) + d(1)*x(7) + k(1)*x(7) + beta*x(7) - k(4)*x(5) + k(3)*x(3)*x(4); 

dxdt(6) = -d(2)*x(6) + a(4)*x(3)*x(4) -  k(2)*x(6) - beta*x(6); 

dxdt(7) = a(3)*x(3)*x(5) - k(1)*x(7) - d(1)*x(7) - beta*x(7); 