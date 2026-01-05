tf=(2020:0.083333334:2100);
%tf=(1:1:960);

%                   1     2    3
%   flujos(i,:) = [RPP1a RPP1b RPP2... 
%                  4      5     6      7     8
%                P1aHH P1aH1r P1aH1m P1aH2 P1aRP... 
%                  9       10    11     12
%                P1bH1r P1bH1m P1bH2 P1bRP...
%                 13    14    15   16
%                P2H1r P2H1m P2H2 P2RP...
%                  17   18     19     20    21
%                H1rHH H1rC1 H1rP1a H1rP1b H1rRP...
%                  22   23     24     25    26
%                H1mHH H1mC1 H1mP1a H1mP1b H1mRP...
%                 27   28
%                H2C1 H2RP...
%                 29   30    31
%                HHRP HHH1r HHH1m...
%                  32
%                C1RP]; 

%Flujos en 0 = 19, 20, 24 y 25


%% FLUJOS HH
% HH = P1aHH + H1rHH + H1mHH - HHRP - HHH1r - HHH1m
%        4       17      22     29     30      31

figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on
plot(tf,flujos(:,4),tf,flujos(:,17),tf,flujos(:,22),...
     tf,flujos(:,29),'--',tf,flujos(:,30),'--',tf,flujos(:,31),'--','LineWidth',2);
legend('P1aHH','H1rHH','H1mHH',...
       'HHRP','HHH1r','HHH1m');
title('FLUJOS HH','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Tiempo','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Masa','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid on;


%% FLUJOS C1
% C1 = H1rC1 + H1mC1 + H2C1 - C1RP
%       18      23      27     32

figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on
plot(tf,flujos(:,18),tf,flujos(:,23),tf,flujos(:,27),...
     tf,flujos(:,32),'--','LineWidth',2);
legend('H1rC1','H1mC1','H2C1',...
       'C1RP');
title('FLUJOS C1','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Tiempo','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Masa','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid on;


%% FLUJOS H2
% H2 = P1aH2 + P1bH2 + P2H2 - H2C1 - H2RP
%       7        11     15     27     28

figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on
plot(tf,flujos(:,7),tf,flujos(:,11),tf,flujos(:,15),...
     tf,flujos(:,27),'--',tf,flujos(:,28),'--','LineWidth',2);
legend('P1aH2','P1bH2','P2H2',...
       'H2C1','H2RP');
title('FLUJOS H2','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Tiempo','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Masa','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid on;


%% FLUJOS H1m
% H1m = P1aH1m + P1bH1m + P2H1m + HHH1m - H1mHH - H1mC1 - H1mP1a - H1mP1b - H1mRP
%         6        10      14      31      22      23       24        25      26

figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on
plot(tf,flujos(:,6),tf,flujos(:,10),tf,flujos(:,14),tf,flujos(:,31),...
     tf,flujos(:,22),'--',tf,flujos(:,23),'--',tf,flujos(:,26),'--','LineWidth',2);
legend('P1aH1m','P1bH1m','P2H1m','HHH1m',...
       'H1mHH','H1mC1','H1mRP');
title('FLUJOS H1m','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Tiempo','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Masa','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid on;


%% FLUJOS H1r
% H1r = P1aH1r + P1bH1r + P2H1r + HHH1r - H1rHH - H1rC1 - H1rP1a - H1rP1b - H1rRP
%         5        9        13     30      17      18       19       20      21

figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on
plot(tf,flujos(:,5),tf,flujos(:,9),tf,flujos(:,13),tf,flujos(:,30),...
     tf,flujos(:,17),'--',tf,flujos(:,18),'--',tf,flujos(:,21),'--','LineWidth',2);
legend('P1aH1r','P1bH1r','P2H1r','HHH1r',...
       'H1rHH','H1rC1','H1rRP');
title('FLUJOS H1r','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Tiempo','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Masa','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid on;


%% FLUJOS P2
% P2 = RPP2 - P2H1r - P2H1m - P2H2 - P2RP
%       3      13      14      15     16

figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on
yyaxis left
plot(tf,flujos(:,13),'--',tf,flujos(:,14),'-.',tf,flujos(:,15),':','LineWidth',2);
title('FLUJOS P2','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Tiempo','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Masa','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
set(gca, 'fontsize', 15);
yyaxis right 
%axis([0 200 0 1.6])
plot(tf,flujos(:,3),tf,flujos(:,16),'--','LineWidth',2);

legend('P2H1r','P2H1m','P2H2','RPP2','P2RP');
ylabel('Masa','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
grid on;


%% FLUJOS P1b
% P1b = RPP1b + H1rP1b + H1mP1b - P1bH1r - P1bH1m - P1bH2 - P1bRP
%         2       20      25        9        10      11      12

figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on
plot(tf,flujos(:,2),...
     tf,flujos(:,9),'--',tf,flujos(:,10),'--',tf,flujos(:,11),'--',tf,flujos(:,12),'--','LineWidth',2);
legend('RPP1b',...
      'P1bH1r','P1bH1m','P1bH2','P1bRP');
title('FLUJOS P1b','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Tiempo','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Masa','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid on;


%% FLUJOS P1a
%P1a = RPP1a + H1rP1a + H1mP1a - P1aHH - P1aH1r - P1aH1m - P1aH2 - P1aRP
%       1        19       24       4       5         6       7       8

figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on
plot(tf,flujos(:,1),...
     tf,flujos(:,4),'--',tf,flujos(:,5),'--',tf,flujos(:,6),'--',tf,flujos(:,7),'--',tf,flujos(:,8),'--','LineWidth',2);
legend('RPP1a',...
       'P1aHH','P1aH1r','P1aH1m','P1aH2','P1aRP');
title('FLUJOS P1a','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Tiempo','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Masa','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid on;



%% FLUJOS RP
% RP = P1aRP + P1bRP + P2RP + H1rRP + H1mRP + H2RP + C1RP + HHRP - RPP1a - RPP1b - RPP2
%        8       12     16     21      26      28     32     29      1       2       3       

figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on
plot(tf,flujos(:,8),tf,flujos(:,12),tf,flujos(:,16),tf,flujos(:,21),tf,flujos(:,26),tf,flujos(:,28),tf,flujos(:,32),tf,flujos(:,29),...
     tf,flujos(:,1),'--',tf,flujos(:,2),'--',tf,flujos(:,3),'--','LineWidth',2);
legend('P1aRP','P1bRP','P2RP','H1rRP','H1mRP','H2RP','C1RP','HHRP',...
       'RPP1a','RPP1b','RPP2');
title('FLUJOS RP','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Tiempo','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Masa','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%axis([0 200 0 1.6])
set(gca, 'fontsize', 15);
grid on;



%{
figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on
yyaxis left
plot(tf,flujos(:,8),tf,flujos(:,12),tf,flujos(:,21),tf,flujos(:,26),tf,flujos(:,28),tf,flujos(:,32),tf,flujos(:,29),...
     tf,flujos(:,1),tf,flujos(:,2));%,'LineWidth',2);
 title('FLUJOS RP','FontSize', 20, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Tiempo','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Masa','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
set(gca, 'fontsize', 15); 
yyaxis right  
%axis([0 200 0 1.6])
plot(tf,flujos(:,16),...
     tf,flujos(:,3));%,'LineWidth',2);
legend('P1aRP','P1bRP','H1rRP','H1mRP','H2RP','C1RP','HHRP',...
       'RPP1a','RPP1b',...
       'P2RP','RPP2'); 
ylabel('Masa','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
grid on;
%}



