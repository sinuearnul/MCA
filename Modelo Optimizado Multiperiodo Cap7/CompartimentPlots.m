

%% CRNIVOROS, HUMANS, RP
figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
%figure
hold on
subplot(3,1,1)
%set(gca,'fontsize',18)
plot(year,C1p,year,C1pSC,'g','LineWidth',2);
title('C1 "Carnivoros Salvajes"','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Time','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Mass','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%legend('Caso estable','Caso en estudio');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid;

subplot(3,1,2)
%set(gca,'fontsize',18)
%load('zxc.mat')
%plot(year,pob_mundp,year,pob_mundpSC,'g',year,cuarto,'m','LineWidth',2);
plot(year,pob_mundp,year,pob_mundpSC,'g','LineWidth',2);
title('NumHH "Poblacion Mundial"','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Time','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Humans','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid;

subplot(3,1,3)
%set(gca,'fontsize',18)
plot(year,RPp,year,RPpSC,'g','LineWidth',2);
title('RP "Piscina de Recursos"','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Time','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Mass','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
legend('Perfil óptimo','Caso Base');
%axis([0 200 1097 1.6]);
%axis([t(1) t(end) min(min([y(:,13) y(:,20) y(:,21)]))*0.8 max(max([y(:,13) y(:,20) y(:,21)]))*1.2])
set(gca, 'fontsize', 15);
grid;
hold off



% HERBIVORES
figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
%figure
hold on

subplot(3,1,1)
%set(gca,'fontsize',18)
plot(year,H1rp,year,H1rpSC,'g','LineWidth',2);
title('H1r "Ganado Rumiante"','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Time','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Mass','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
legend('Perfil óptimo','Caso Base');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid;

subplot(3,1,2)
%set(gca,'fontsize',18)
plot(year,H1mp,year,H1mpSC,'g','LineWidth',2);
title('H1m "Ganado Monogastrico"','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Time','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Mass','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid;

subplot(3,1,3)
%set(gca,'fontsize',18)
plot(year,H2p,year,H2pSC,'g','LineWidth',2);
title('H2 "Herbívoros Salvajes"','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Time','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Mass','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid;
hold off



% PLANTS
figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
%figure
hold on
subplot(3,1,1)
%set(gca,'fontsize',18)
plot(year,P1ap,year,P1apSC,'g','LineWidth',2);
title('P1a "Agricultura Comestible para Humanos"','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Time','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Mass','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
legend('Perfil óptimo','Caso Base');
%axis([0 600 0 1.6])
set(gca, 'fontsize', 15);
grid;

subplot(3,1,2)
%set(gca,'fontsize',18)
plot(year,P1bp,year,P1bpSC,'g','LineWidth',2);
title('P1b "Agricultura NO Comestible para Humanos"','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Time','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Mass','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid;

subplot(3,1,3)
%set(gca,'fontsize',18)
plot(year,P2p,year,P2pSC,'g','LineWidth',2);
title('P2 "Plantas Silvestres"','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Time','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Mass','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid;
hold off


figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on
subplot(2,1,1)
% CO2eq
%set(gca,'fontsize',18)
plot(year,CO2eqp,year,CO2eqpSC,'g','LineWidth',2);
title('CO2eq','FontSize', 22, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Time','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('ppm','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
legend('Perfil óptimo','Caso Base');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid;

subplot(2,1,2)
% temp
%set(gca,'fontsize',18)
plot(year,tempp,year,temppSC,'g','LineWidth',2);
title('Temperatura','FontSize', 22, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Time','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('oC','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%legend('Caso estable','Caso en estudio');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid;
hold off;



%{
%ENTRADAS H1m
figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on
subplot(2,2,1)
plot (flujos(:,6))
title('P1aH1m','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');

subplot(2,2,2)
plot (flujos(:,10))
title('P1bH1m','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');

subplot(2,2,3)
plot (flujos(:,14))
title('P2H1m','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');

subplot(2,2,4)
plot (flujos(:,31))
title('HHH1m','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');



%SALIDAS H1m
figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on
subplot(2,2,1)
plot (flujos(:,22))
title('H1mHH','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');

subplot(2,2,2)
plot (flujos(:,23))
title('H1mC1','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');

subplot(2,2,3)
plot (flujos(:,25))
title('H1mP1B','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');

subplot(2,2,4)
plot (flujos(:,26))
title('H1mRP','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
%}