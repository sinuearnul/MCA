
%% MACROMOLECULAS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on

subplot(2,2,1)
%set(gca,'fontsize',18)
plot(year,prote_disp_pcp,year,prote_minp,'--r',year,prote_maxp,'--g',[2021 2100],[prote_rec prote_rec],'k--','LineWidth',2);
title('Proteína','FontSize', 22, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Tiempo','FontSize', 5, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('gr/persona/día','FontSize', 5, 'FontName', 'Arial Rounded MT Bold');
legend('Disp','Min','Max','Reco');
%axis([0 600 0 1.6])
set(gca, 'fontsize', 15);
grid;

subplot(2,2,2)
%set(gca,'fontsize',18)
plot(year,carbo_disp_pcp,year,carbo_minp,'--r',year,carbo_maxp,'--g',[2021 2100],[carbo_rec carbo_rec],'k--','LineWidth',2);
title('Carbohidratos','FontSize', 22, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Tiempo','FontSize', 5, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('gr/persona/día','FontSize', 5, 'FontName', 'Arial Rounded MT Bold');
%legend('Disponible','Min','Max','Recomendada');
%axis([0 600 0 1.6])
set(gca, 'fontsize', 15);
grid;

subplot(2,2,3)
%set(gca,'fontsize',18)
plot(year,lipi_disp_pcp,year,lipi_minp,'--r',year,lipi_maxp,'--g',[2021 2100],[lipi_rec lipi_rec],'k--','LineWidth',2);
title('Lípidos','FontSize', 22, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Tiempo','FontSize', 5, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('gr/persona/día','FontSize', 5, 'FontName', 'Arial Rounded MT Bold');
%legend('Disponible','Min','Max','Recomendada');
%axis([0 600 0 1.6])
set(gca, 'fontsize', 15);
grid;

subplot(2,2,4)
%set(gca,'fontsize',18)
plot(year,kcal_disp_pcp,year,kcal_minp,'--r',year,kcal_maxp,'--g',[2021 2100],[kcal_rec kcal_rec],'k--','LineWidth',2);
title('Kcal','FontSize', 22, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Tiempo','FontSize', 5, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('gr/persona/día','FontSize', 5, 'FontName', 'Arial Rounded MT Bold');
%legend('Disponible','Min','Max','Recomendada');
%axis([0 600 0 1.6])
set(gca, 'fontsize', 15);
grid;

hold off


%% HUMANS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('units','normalized','outerposition',[0.05 0.45 0.9 0.5])
hold on
plot(year,HHp,'g','LineWidth',2);
title('Humanos','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Año','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Masa (MT)','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid;



%{
figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on
subplot(3,1,1)
plot(year,C1p,'g','LineWidth',2);
%plot(year,C1p,year,C1pSC,'g','LineWidth',2);
title('C1 "Carnivoros Salvajes"','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Tiempo','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Masa','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%legend('Caso estable','Caso en estudio');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid;


subplot(3,1,2)
plot(year,pob_mundp,'g','LineWidth',2);
%plot(year,pob_mundp,year,pob_mundpSC,'g','LineWidth',2);
title('NumHH "Poblacion Mundial"','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Tiempo','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Humanos','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid;

subplot(3,1,3)
plot(year,RPp,'g','LineWidth',2);
%plot(year,RPp,year,RPpSC,'g','LineWidth',2);
title('RP "Piscina de Recursos"','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Tiempo','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Masa','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%legend('Caso en estudio','Caso estable');
%axis([0 200 1097 1.6]);
%axis([t(1) t(end) min(min([y(:,13) y(:,20) y(:,21)]))*0.8 max(max([y(:,13) y(:,20) y(:,21)]))*1.2])
set(gca, 'fontsize', 15);
grid;
hold off
%}


%% HERBIVORES AND CARNIVORES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on
plot(year,H1rp,year,H1mp,year,H2p,year,C1p,'g','LineWidth',2);
title('Herbívoros y Carnívoros','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Año','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Masa (MT)','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
legend('H1r','H1m','H2','C1');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid;

%{
figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on

subplot(3,1,1)
plot(year,H1rp,'g','LineWidth',2);
%plot(year,H1rp,year,H1rpSC,'g','LineWidth',2);
title('H1r "Ganado Rumiante"','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Tiempo','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Masa','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%legend('Caso en estudio','Caso estable');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid;

subplot(3,1,2)
plot(year,H1mp,'g','LineWidth',2);
%plot(year,H1mp,year,H1mpSC,'g','LineWidth',2);
title('H1m "Ganado Monogastrico"','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Tiempo','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Masa','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid;

subplot(3,1,3)
plot(year,H2p,'g','LineWidth',2);
%plot(year,H2p,year,H2pSC,'g','LineWidth',2);
title('H2 "Herbívoros Salvajes"','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Tiempo','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Masa','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid;
hold off
%}

%% PLANTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on
yyaxis left
axis([2020 2100 0 15000])
plot(year,P1ap,year,P1bp,'b','LineWidth',2);
title('PLANTAS','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Tiempo','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Masa (MTA)','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
set(gca, 'fontsize', 15);
yyaxis right 
axis([2020 2100 0 80000])
plot(year,P2p,year,RPp,'r','LineWidth',2);
ylabel('Masa','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
legend('P1a','P1b','P2','RP');
grid on;

%{
figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on
subplot(3,1,1)
plot(year,P1ap,'g','LineWidth',2);
%plot(year,P1ap,year,P1apSC,'g','LineWidth',2);
title('P1a "Agricultura Comestible para Humanos"','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Tiempo','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Masa','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%legend('Caso en estudio','Caso estable');
%axis([0 600 0 1.6])
set(gca, 'fontsize', 15);
grid;

subplot(3,1,2)
plot(year,P1bp,'g','LineWidth',2);
%plot(year,P1bp,year,P1bpSC,'g','LineWidth',2);
title('P1b "Agricultura NO Comestible para Humanos"','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Tiempo','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Masa','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid;

subplot(3,1,3)
plot(year,P2p,'g','LineWidth',2);
%plot(year,P2p,year,P2pSC,'g','LineWidth',2);
title('P2 "Plantas Silvestres"','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Tiempo','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Masa','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid;
hold off

%}



%% Grafico CO2eq  Atemp IPCC%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Tiempo
tIPCC = [2015 2025 2050 2075 2100];
tIPC = [2010 2020 2030 2040 2050 2060 2070 2080 2090 2100];

%% CO2eq
%Escenarios IPCC AR6
CO2eqSSP1_19 = [493.066	    531.457     560.187     552.365     536.913];
CO2eqSSP1_26 = [493.066	    532.953     600.768     619.880     603.401];
CO2eqSSP2_45 = [493.066	    534.573     648.901     757.412     816.270];
CO2eqSSP3_70 = [493.066	    538.685     692.041     898.892     1174.302];
CO2eqSSP5_85 = [493.066	    538.062     720.460     1055.113	1537.209];
%Modelo
CO2eqMODELO = [493.066 CO2eq(61) CO2eq(361) CO2eq(661) CO2eq(961)];


figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on
plot(tIPCC,CO2eqMODELO,'-b',tIPCC,CO2eqSSP1_19,'--g',tIPCC,CO2eqSSP1_26,'--',tIPCC,CO2eqSSP2_45,'--y',tIPCC,CO2eqSSP3_70,'--',tIPCC,CO2eqSSP5_85,'--r','LineWidth',2);
%plot(year,CO2eqp,year,CO2eqpSC,'g','LineWidth',2);
title('CO_2eq','FontSize', 22, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Año','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('PPM','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
legend('MCA','SSP1 1.9','SSP1 2.6','SSP2 4.5','SSP3 7.0','SSP5 8.5');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid on;


%% Atemp

%Escenarios IPCC AR6
AtempSSP1_19 = [0.984935  1.227375  1.482575  1.57195  1.58471  1.53367  1.495335  1.444295  1.39326  1.31670];
AtempSSP1_26 = [0.984935  1.227375	1.482575  1.66127  1.76335	1.81439	 1.82715   1.80163	 1.75059  1.71231];
AtempSSP2_45 = [0.984935  1.227375	1.482575  1.75059  2.00579	2.20995	 2.401405  2.554525	 2.68213  2.75869];
AtempSSP4_60 = [0.984935  1.227375	1.508095  1.81439  2.13339	2.40141  2.682125  2.92462	 3.12878  3.29466];
AtempSSP3_70 = [0.984919  1.265661	1.610209  1.85267  2.18445	2.52900	 2.899072  3.29466	 3.69026  4.12413];
AtempSSP5_85 = [0.984919  1.265661	1.610209  1.98028  2.41415	2.86079	 3.383991  3.93271	 4.49420  5.03016];
%Modelo
AtempMODELO = [0.984935  1.227375  atemp(120)+0.3 atemp(240)+0.3 atemp(360)+0.3 atemp(480)+0.3 atemp(600)+0.3 atemp(720)+0.3 atemp(840)+0.3 atemp(960)+0.3];


figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on
plot(tIPC,AtempMODELO,'-b',tIPC,AtempSSP1_19,'--g',tIPC,AtempSSP1_26,'--',tIPC,AtempSSP2_45,'--y',tIPC,AtempSSP4_60,'--',tIPC,AtempSSP3_70,'--',tIPC,AtempSSP5_85,'--r','LineWidth',2);
title('Anomalía de la Temperatura','FontSize', 22, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Año','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('°C','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
legend('MCA','SSP1 1.9','SSP1 2.6','SSP2 4.5','SSP4 6.0','SSP3 7.0','SSP5 8.5');
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
