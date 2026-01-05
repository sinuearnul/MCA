
% Graficos de comparativos entre Cap 4 y Cap 5

load('CasoBaseCap4.mat')


%% Humanos pob_mund
figure('units','normalized','outerposition',[0.05 0.45 0.9 0.5])
hold on
plot(year,pob_mundp,year,pob_mundpCB,'g','LineWidth',2);
title('Humanos','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Año','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Habitantes','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
legend('Caso en estudio','Caso base');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid;

%% CO2eq

tIPCC = [2015 2025 2050 2075 2100];
%Modelo
CO2eqMODELO = [493.066 CO2eq(61) CO2eq(361) CO2eq(661) CO2eq(961)];

figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on
subplot(2,1,1)
plot(tIPCC,CO2eqMODELO,tIPCC,CO2eqMODELOCB,'g','LineWidth',2);
%plot(year,CO2eqp,year,CO2eqpSC,'g','LineWidth',2);
title('CO_2eq','FontSize', 22, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Año','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('PPM','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
legend('Caso en estudio','Caso base');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid on;


%% Atemp

tIPC = [2010 2020 2030 2040 2050 2060 2070 2080 2090 2100];
%Modelo
AtempMODELO = [0.984935  1.227375  atemp(120)+0.3 atemp(240)+0.3 atemp(360)+0.3 atemp(480)+0.3 atemp(600)+0.3 atemp(720)+0.3 atemp(840)+0.3 atemp(960)+0.3];

%figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
%hold on
subplot(2,1,2)
plot(tIPC,AtempMODELO,tIPC,AtempMODELOCB,'g','LineWidth',2);
title('Anomalía de la Temperatura','FontSize', 22, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Año','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('°C','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%legend('Caso en estudio','Caso base');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid on;



