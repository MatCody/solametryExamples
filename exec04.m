close all 
clear all
L1 = -7.11; % latitude JP

delta1 = -9.6; % dia 288

H = -5:5;

beta1 = asind(cosd(L1).*cosd(delta1).*cosd(H.*15) + sind(L1).*sind(delta1));

sigma = 52; % angulo coletor, estacionario 

thetaS = asind((cosd(delta1).*sind(H.*15))./cosd(beta1));

thetaC = 20; % angulo azimutal do coletor, estacionario

n1 = 288; % dia 15/10


A = 1160 + 75*sind(360/365*(n1-275));
k = 0.174 + 0.035*sind(360/365*(n1-100));
m = 1./(sind(beta1));
Ib = A.*exp(-k.*m);
cosTheta = cosd(beta1).*cosd(thetaS-thetaC).*sind(sigma) + sind(beta1).*cosd(sigma);
Ibc = Ib.*cosTheta;

% INCIDENCIA SOLAR DIFUSA

C = 0.095 + 0.04.*sind(360.*(n1-100)./365); % depende do dia
Idc = C.*Ib.*((1+cosd(sigma))./2); % depende do angulo do coletor

% INCIDENCIA SOLAR REFLETIDA
% refletancia 0.2

Irc = 0.2.*Ib.*(sind(beta1)+C).*((1-cosd(sigma))/2);

% INCIDENCIA TOTAL NO PAINEL
Ic = Ibc+Idc+Irc;

%fprintf('Valor total no coletor: %0.3f\n', Ic);
figure(1)
plot(H, Irc)
hold on
plot(H, Idc)
grid on
xlabel('Hora do dia')
ylabel('Incidencia solar difusa e refletida')
legend('Solar refletida', 'Solar difusa')
title('Incidencias Solares')
xlim([-5 5])
set(gca,'XTick',-5:1:5)
set(gca,'XTickLabel',7:1:17)


