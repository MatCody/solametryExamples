close all
clear all


% exec 3
% Como os raios diretos variam para
% diferentes epocas do ano; como varia
% para as diferentes horas do dia ?

% INCIDENCIA SOLAR DIRETA NO PAINEL
% Todos os dias do ano
L1 = -7.11; % latitude de JP
L2 = 32.1; % latitude de Atlanta
n1 = 0:365; % dias do ano

%dia 15/10 -> 288
n2 = 288;
H = -5:5; % horas do dia, limitado

A = 1160 + 75.*sind(360/365.*(n1-275));
k = 0.174 + 0.035.*sind(360/365.*(n1-100));
beta1 = 90 - L1;
beta12 = 90 - L2;
m = 1./(sind(beta1));
m12 = 1./(sind(beta12));
Ib1 = A.*exp(-k.*m); 
Ib12 = A.*exp(-k.*m12);

A2 = 1160 + 75*sind(360/365*(n2-275));
k2 = 0.174 + 0.035*sind(360/365*(n2-100));
delta1 = 23.45*sin((360/365)*(n2-81));
beta2 = asind(cosd(L1).*cosd(delta1).*cosd(H.*15) + sind(L1).*sind(delta1));
beta21 = asind(cosd(L2).*cosd(delta1).*cosd(H.*15) + sind(L2).*sind(delta1));
m2 = 1./sind(beta2);
minV = -5;
maxV = 5;
m2 = min(max(m2, minV), maxV);
m21 = 1./sind(beta21);
Ib2 = A2.*exp(-k2.*m2); 
Ib21 = A2.*exp(-k2.*m21); 

figure(1)
subplot(2,1,1)
plot(n1, Ib1)
hold on
plot(n1, Ib12)
title('Raios diretos de Janeiro a Dezembro no meio dia')
xlabel('Dias do ano')
ylabel('Incidencia solar direta(W/m^2)')
xlim([0 365])
legend('Latitude Joao Pessoa', 'Latitude Atlanta')

subplot(2,1,2)
plot(H,Ib2)
hold on
plot(H, Ib21)
xlim([-5 5])
title('Raios diretos de 7 as 17 horas')
xlabel('Horas do dia')
ylabel('Incidencia solar direta(W/m^2)')
legend('Latitude Joao Pessoa', 'Latitude Atlanta')
set(gca,'XTick',-5:1:5)
set(gca,'XTickLabel',7:1:17)



