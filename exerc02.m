clear all
close all
% exec 2 
delta1 = 0; % declinacao solar no equinocio
L1 = -7.11; 
L2 = 32.1; 
H = -12:12;

beta1 = asind(cosd(L1).*cosd(delta1).*cosd(H.*15) + sind(L1).*sind(delta1));
beta2 = asind(cosd(L2).*cosd(delta1).*cosd(H.*15) + sind(L1).*sind(delta1));

figure(1)
plot(H, beta1)
hold on
plot(H, beta2)
legend('Latitude Joao Pessoa', 'Latitude 32.1°')
title('Analise no equinocio')
xlim([-12 12])
ylim([-90 90])
xlabel('Hora do dia');
ylabel('Angulo de altitude');
