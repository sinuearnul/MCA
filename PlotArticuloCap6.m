
%% MACROMOLECULAS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


load ('ValoresObtenidosCap5');

figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on

subplot(2,2,1)
%set(gca,'fontsize',18)
plot(year,prote_disp_pcpC5,'g',year,prote_disp_pcp,year,prote_minp,'--',year,prote_maxp,'--',[2021 2100],[prote_rec prote_rec],'k--','LineWidth',2);
title('Proteína','FontSize', 22, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Año','FontSize', 5, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('gr/persona/día','FontSize', 5, 'FontName', 'Arial Rounded MT Bold');
legend('Disp C5','Disp C6','Min','Max','Reco');
%axis([0 600 0 1.6])
set(gca, 'fontsize', 15);
grid;

subplot(2,2,2)
%set(gca,'fontsize',18)
plot(year,carbo_disp_pcpC5,'g',year,carbo_disp_pcp,year,carbo_minp,'--',year,carbo_maxp,'--',[2021 2100],[carbo_rec carbo_rec],'k--','LineWidth',2);
title('Carbohidratos','FontSize', 22, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Año','FontSize', 5, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('gr/persona/día','FontSize', 5, 'FontName', 'Arial Rounded MT Bold');
%legend('Disponible','Min','Max','Recomendada');
%axis([0 600 0 1.6])
set(gca, 'fontsize', 15);
grid;

subplot(2,2,3)
%set(gca,'fontsize',18)
plot(year,lipi_disp_pcpC5,'g',year,lipi_disp_pcp,year,lipi_minp,'--',year,lipi_maxp,'--',[2021 2100],[lipi_rec lipi_rec],'k--','LineWidth',2);
title('Lípidos','FontSize', 22, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Año','FontSize', 5, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('gr/persona/día','FontSize', 5, 'FontName', 'Arial Rounded MT Bold');
%legend('Disponible','Min','Max','Recomendada');
%axis([0 600 0 1.6])
set(gca, 'fontsize', 15);
grid;

subplot(2,2,4)
%set(gca,'fontsize',18)
plot(year,kcal_disp_pcpC5,'g',year,kcal_disp_pcp,year,kcal_minp,'--',year,kcal_maxp,'--',[2021 2100],[kcal_rec kcal_rec],'k--','LineWidth',2);
title('Kcal','FontSize', 22, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Año','FontSize', 5, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('gr/persona/día','FontSize', 5, 'FontName', 'Arial Rounded MT Bold');
%legend('Disponible','Min','Max','Recomendada');
%axis([0 600 0 1.6])
set(gca, 'fontsize', 15);
grid;

hold off


%% HUMANS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on

subplot(2,1,1)
plot(year,HHp,year,HHpC5,'g','LineWidth',2);
title('HH','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Año','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Masa (MT)','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid;

subplot(2,1,2)
plot(year,pob_mundp,year,pob_mundpC5,'g','LineWidth',2);
title('Población','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Año','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Personas','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid;


%% HERBIVORES AND CARNIVORES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on
plot(year,H1rp,'b',year,H1rpC5,'--b',year,H1mp,'r',year,H1mpC5,'--r',year,H2p,'y',year,H2pC5,'--y',year,C1p,'g',year,C1pC5,'--g','LineWidth',2);
title('Herbívoros y Carnívoros','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Año','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Masa (MT)','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
legend('H1r','H1r C5','H1m','H1m C5','H2','H2 C5','C1','C1 C5');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid;


%% PLANTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on
plot(year,P1ap,'b-',year,P1apC5,'b--',year,P1bp,'r-',year,P1bpC5,'r--','LineWidth',2);
title('PLANTAS','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Año','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Masa (MTA)','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
axis([2020 2100 0 70000])
set(gca, 'fontsize', 15);
legend('P1a','P1aC5','P1b','P1bC5');
grid on;

figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on
plot(year,P2p,'g',year,P2pC5,'--g',year,RPp,'y',year,RPpC5,'--y','LineWidth',2);
title('Plantas - PR','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Año','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Masa','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
axis([2020 2100 25000 95000])
set(gca, 'fontsize', 15);
legend('P2','P2C5','RP','RPC5');
grid on;

%{

figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on
yyaxis left
%axis([2020 2100 0 15000])
plot(year,P1ap,year,P1apC5,year,P1bp,year,P1bpC5,'LineWidth',2);
title('PLANTAS','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Tiempo','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Masa (MTA)','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
set(gca, 'fontsize', 15);
yyaxis right 
%axis([2020 2100 0 80000])
plot(year,P2p,year,P2pC5,year,RPp,year,RPpC5,'LineWidth',2);
ylabel('Masa','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
legend('P1a','P1aC5','P1b','P1bC5','P2','P2','RP');
grid on;

%}



%% Grafico CO2eq  Atemp IPCC%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Tiempo
tIPCC = [2015 2025 2050 2075 2100];
tIPC = [2010 2020 2030 2040 2050 2060 2070 2080 2090 2100];

%% CO2eq

figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on

subplot(2,1,1)
plot(year,CO2eqp,year,CO2eqpC5,'g','LineWidth',2);
%plot(year,CO2eqp,year,CO2eqpSC,'g','LineWidth',2);
title('CO_2eq','FontSize', 22, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Año','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('PPM','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
legend('C6','C5');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid on;


%% Atemp

%figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
%hold on
subplot(2,1,2)
plot(year,atempp,year,atemppC5,'g','LineWidth',2);
title('Anomalía de la Temperatura','FontSize', 22, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Año','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('°C','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
legend('C6','C5');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid on;


%{
figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on
subplot(2,1,1)
% CO2eq

plot(year,CO2eqp,'g','LineWidth',2);
%plot(year,CO2eqp,year,CO2eqpSC,'g','LineWidth',2);
title('CO2eq','FontSize', 22, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Tiempo','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('PPM','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%legend('Caso en estudio','Caso estable');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid;

subplot(2,1,2)
% temp
plot(year,tempp,'g','LineWidth',2);
%plot(year,tempp,year,temppSC,'g','LineWidth',2);
title('Temperatura','FontSize', 22, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Tiempo','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('°C','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%legend('Caso estable','Caso en estudio');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid;
hold off;
%}
