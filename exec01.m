clear all
close all
% exec 1
% Como a declinacao solar e latitude influenciam
% no ângulo de altitude e instalacao do painel para o
% meio dia (betaN e tilt);
% como as estacoes do ano influenciam o ângulo do painel ?

deltaAll = -23.45:0.15:23.45;
latAll = -90:1:90;
delta = 0;
lat = -7.11;
n = 0:365;

% latitude fixa para Joao Pessoa
betaN = 90 - lat + deltaAll;
tilt = 90 - betaN;
figure(1)
plot(deltaAll, betaN)
hold on
plot(deltaAll, tilt)
legend('beta_N', 'Tilt')
xlabel('Declinacao solar')
ylabel('Angulo de altitude e do painel')
xlim([-23.45 23.45])

% Angulo de altitude fixo
betaN2 = 90 - latAll + delta;
tilt2 = 90 - betaN2;
figure(2)
plot(latAll, betaN2)
hold on
plot(latAll, tilt2)
legend('beta_N', 'Tilt')
xlabel('Latitude')
ylabel('Angulo de altitude e do painel')
xlim([-90 90])

% Influencia das estações do ano
deltaVar = 23.45.*sind((360/365).*(n-81));
tilt3 = lat - deltaVar;
figure(3)
plot(n, tilt3)
xlabel('Dias do ano')
ylabel('Angulo do painel')
xlim([0 365])


