clear all;
clc;

%% Resultados Modelo de Capítulo 6

%% INPUTS

time = 80*12;    %Tiempo en meses
temp_PL_CO2 = 1;   %Afectacion de Temp en plantas 0=NO  1=SI
incre_HH = 1;  %Incremento poblacionala 0=NO  1=SI (tasa de natalidad y mortandad)  2=SI (increm poblacional)
demanda = 1;        % 1 Si la demanda controla el flujo

 %% CONTROL DE TIEMPO
tp=12; % meses por anio (PARA GRAFICAR)
h=1/tp; %tamano de paso ecuaciones 
hg=1/tp; %tamano de paso gradientes
%hw=1/12;
yeara(1) = 2021;

%% CONTROL DE CO2
%CO2eq(1) = 551; %ppm
CO2eq(1) = 522; %ppm
%CO2(1) = CO2eq*.815; %ppm Se grafica directamente CO2

%cambio en co2 para crecimiento de plantas
dCO2(1) = 0;        %diferencial de CO2
bc = -1.208e-5;     %parametro de ecuación cuadrática (sust. por RNA)
cc = 0.006196;      %parametro de ecuación cuadrática (sust. por RNA)

%Datos historicos (1850-2019)
dCons = 174.37; % ppm
dEmis = 2400 ; %Gton

fr =  dCons/dEmis;

%% CONTROL DE TEMPERATURA
%atemp(1)= -0.21;
atemp(1)= 1.2;
% atemp(1)=0.91;
 
 %atemp(1)= 1.945;
 %temp(1)=25;
 tempin=24;      %Temperatura optima
 temp(1)=tempin + atemp(1);
 tempoP1 = 22.5;
 tempoP2 = 25;
 
 
%% CONTROL POBLACION

pob_mund(1)= 7841013824.88479;
birth_rate(1) = 17.2231568995677/1000;
mortality_rate(1) = 8.03210175657131/1000;
ppHH=62/1000000000; %peso promedio por mil personas


ppHHi = 59.078;    %Peso promedio ideal Kg
%ppHH(1) = 62;        %peso promedio inicial Kg
apHH = 1.65;        %Altura promedio Mts

%% VALOR INICIAL DE ESPECIES
RP(1) = 75939.0479663931;
P1a(1) = 1937.7261514000;
P1b(1) = 7750.9046056000;
P2(1) = 48713.0772868040;
H1r(1) = 560.3278273580;
H1m(1) = 236.7245586420;
H2(1) = 50.2500000000;
C1(1) = 612.1300000000;
HH(1) = 489.8000000000;
numHH(1)=(HH(1)/ppHH);


%% FACTORES DE DESARROLLO DE COMPARTIMENTOS MENSUALES
  % RP si temp_PL == 0  
gRPP1a=0.0000277507538195019000 *hg;       %0%-60%
gRPP1b=0.0000034997121157711600 *hg;       %40%-100% (40% de areas cultivadas no disponibles para P1a)
gRPP2=0.0000067405385082326100 *hg;
 % RP si temp_PL == 1  
gRPP1am=0.0000277507538195019000 *hg;       %0%-60%
gRPP1bm=0.0000034997121157711600 *hg;       %40%-100% (40% de areas cultivadas no disponibles para P1a)
gRPP2m=0.0000067405385082326100 *hg;
% P1a
gP1aHH = 0.0032180739921274000000 *hg;
gP1aH1r = 0.0002228849653599000000 *hg;
gP1aH1m = 0.0016938903847497500000 *hg;
gP1aH2 = 0.0001027002577121630000 *hg;
gP1aRP = 0.0000000015590661612244 *hg;
% P1b
gP1bH1r = 0.0004197513345569200000 *hg;
gP1bH1m = 0.0001231722094444800000 *hg;
gP1bH2 = 0.0000256750644280408000 *hg;
gP1bRP = 0.0000000015590661612244 *hg;
% P2
gP2H1r = 0.0001000905183182320000 *hg;
gP2H1m = 0.0000022546776868497500 *hg;
gP2H2 =	0.0000408524745732471000 *hg;
gP2RP =	0.0000059679441886151100 *hg;
% H1r
gH1rHH = 0.0036150415100680700000 *hg;
gH1rC1 = 0.0112257064427033000000 *hg;
gH1rP1a = 0.0000000000000000000000 *hg;
gH1rP1b = 0.0000000000000000000000 *hg;
gH1rRP = 0.0000001295626259630080 *hg;
% H1m
gH1mHH = 0.0044749401806892200000 *hg;
gH1mC1 = 0.0043187379865480400000 *hg;
gH1mP1a = 0.0000000000000000000000 *hg;
gH1mP1b = 0.0000000000000000000000 *hg;
gH1mRP = 0.0000001295626259630080 *hg;
% H2
gH2C1 =	0.0038995960032877600000 *hg;
gH2RP =	0.0000000131684558442522 *hg;
% HH
gHHRP =	0.0001181953708279650000 *hg;
gHHH1r = 0.0001858271661963550000 *hg;
gHHH1m = 0.0010177003198423700000 *hg;
%C1
gC1RP =	0.0000988737934644999000 *hg;
 
%% FACTORES DE EMISION (ya estan multiplicados por el factor de permanencia (fr))
wRP=	-2.69878E-05/12;
wP2=	-2.73953E-05/12;
wP1a=	0.00013528/12;
wP1b=	3.38201E-05/12;
wH1r=	0.000467827/12;
wH1m=	0.001107347/12;
wH2=	0/12;
wC1=	0/12;
wHH=	0.007589972/12;
wpob_mund=	4.70578E-10/12;



%% CONTROL DEMANDA ALIMENTARIA
%APORTES NUTRICIONALES para HH (%)
%P1a
P1aHHprote = 0.044663679052492;
P1aHHcarbo = 0.399105473034518;
P1aHHlipi = 0.046285768217296;
P1aHHkcal = 2.122573090860830;			
%H1r
H1rHHprote = 0.050400862026422;
H1rHHcarbo = 0.046371490702119;
H1rHHlipi = 0.017982720455338;
H1rHHkcal = 0.545546421706679;
%H1m
H1mHHprote = 0.229086035682725;
H1mHHcarbo = 0.002764119060438;
H1mHHlipi = 0.131315935334447;
H1mHHkcal = 2.158294731062540;


 %Consumos de macromeleculas por HH (sedentaria de 60 Kg)g/p/dia    
prote_pro = 96; %gramos
carbo_pro = 343.75; %gramos
lipi_pro = 76.4; %gramos
kcal_pro = 2500; %gramos

%convecion de unidades
gaton= 0.000000000001;
diano=365;

%Valores de desperdicio FAO 2011
desp = 1300; %milloes de toneladas


%% TENDENCIA ALIMENTRIA ACTUAL (NO DINAMICA)

TendenciaAlimentariaSinue



%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  START LOOP   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 for i=1 : time
           
           %PLANTAS
   if temp_PL_CO2 == 1  

   %gRPP1a=gRPP1am*exp(-((temp(i)-tempoP1)^2)/100);                  
   %gRPP1b=gRPP1bm*exp(-((temp(i)-tempoP1)^2)/100);
   %gRPP2=gRPP2m*exp(-((temp(i)-tempoP2)^2)/100);
   
   gRPP1a = gRPP1am*g_CO2_Temp([dCO2(i),temp(i)]');
   asd(i)= gRPP1a;
   gRPP1b = gRPP1bm*g_CO2_Temp([dCO2(i),temp(i)]');
   asd1(i)= gRPP1b;
   gRPP2 = gRPP2m*g_CO2_Temp([dCO2(i),(temp(i)-2.5)]'); %Se desplaza -2.5 emn P2 devido a que la RN esta adaptada a 25C como optima
   asd2(i)= gRPP2;
   end
   
      %%
     
          %%%%% MATTER FLOW %%%%%   
    % RP
    RPP1a = gRPP1a*RP(i)*P1a(i);
    RPP1b = gRPP1b*RP(i)*P1b(i);
    RPP2 = gRPP2*RP(i)*P2(i);
    % P1a
    P1aHH = gP1aHH*P1a(i)*HH(i);
    P1aH1r = gP1aH1r*P1a(i)*H1r(i);
    P1aH1m = gP1aH1m*P1a(i)*H1m(i);
    P1aH2 = gP1aH2*P1a(i)*H2(i);
    P1aRP = gP1aRP*P1a(i)*RP(i);
    % P1b
    P1bH1r = gP1bH1r*P1b(i)*H1r(i);
    P1bH1m = gP1bH1m*P1b(i)*H1m(i);
    P1bH2 = gP1bH2*P1b(i)*H2(i);
    P1bRP = gP1bRP*P1b(i)*RP(i);
    % P2
    P2H1r = gP2H1r*P2(i)*H1r(i);
    P2H1m = gP2H1m*P2(i)*H1m(i);
    P2H2 = gP2H2*P2(i)*H2(i);
    P2RP = gP2RP*P2(i)*RP(i);
    % H1r
    H1rHH = gH1rHH*H1r(i)*HH(i);
    H1rC1 = gH1rC1*H1r(i)*C1(i);
    H1rP1a = gH1rP1a*H1r(i)*P1a(i);
    H1rP1b = gH1rP1b*H1r(i)*P1b(i);
    H1rRP = gH1rRP*H1r(i)*RP(i);
    % H1m
    H1mHH = gH1mHH*H1m(i)*HH(i);
    H1mC1 = gH1mC1*H1m(i)*C1(i);
    H1mP1a = gH1mP1a*H1m(i)*P1a(i);
    H1mP1b = gH1mP1b*H1m(i)*P1b(i);
    H1mRP = gH1mRP*H1m(i)*RP(i);
    % H2
    H2C1 =	gH2C1*H2(i)*C1(i);
    H2RP =	gH2RP*H2(i)*RP(i);
    % HH
    HHRP =	gHHRP*HH(i)*RP(i);
    HHH1r = gHHH1r*HH(i)*H1r(i);
    HHH1m = gHHH1m*HH(i)*H1m(i);
    %C1
    C1RP =	gC1RP*C1(i)*RP(i);
    
    


%% DEMANDA ALIMENTARIA (%)

%Necesidad de Macronutrientes Generales para HH
prote_reqHH(i) = prote_rec * diano * pob_mund(i) * g_a_milloneston; %Mill. De Ton/mun/año
carbo_reqHH(i) = carbo_rec * diano * pob_mund(1) * g_a_milloneston; %Mill. De Ton/mun/año
lipi_reqHH(i) = lipi_rec * diano * pob_mund(i) * g_a_milloneston; %Mill. De Ton/mun/año
kcal_reqHH(i) = kcal_rec * diano * pob_mund(i) * g_a_milloneston; %Mill. De Ton/mun/año

%Necesidad de Macronutrientes Especifico de Xi p/compatimento de acuerdo a la
%Tendencia alimentaria (TA) actual
prote_reqP1aHH(i) = prote_reqHH(i) * TA_P1aHHpro; 
prote_reqH1rHH(i) = prote_reqHH(i) * TA_H1rHHpro;
prote_reqH1mHH(i) = prote_reqHH(i) * TA_H1mHHpro;

carbo_reqP1aHH(i) = carbo_reqHH(i) * TA_P1aHHcar; 
carbo_reqH1rHH(i) = carbo_reqHH(i) * TA_H1rHHcar;
carbo_reqH1mHH(i) = carbo_reqHH(i) * TA_H1mHHcar;

lipi_reqP1aHH(i) = lipi_reqHH(i) * TA_P1aHHlip; 
lipi_reqH1rHH(i) = lipi_reqHH(i) * TA_H1rHHlip;
lipi_reqH1mHH(i) = lipi_reqHH(i) * TA_H1mHHlip;

kcal_reqP1aHH(i) = kcal_reqHH(i) * TA_P1aHHkca;
kcal_reqH1rHH(i) = kcal_reqHH(i) * TA_H1rHHkca;
kcal_reqH1mHH(i) = kcal_reqHH(i) * TA_H1mHHkca;

%Necesidad de masa Xi p/compatimento de acuerdo a la Tendencia alimentaria (TA) actual
reqP1aHH_solvprote(i) = prote_reqP1aHH(i)/P1aprote;
reqH1rHH_solvprote(i) = prote_reqH1rHH(i)/H1rprote;
reqH1mHH_solvprote(i) = prote_reqH1mHH(i)/H1mprote;

reqP1aHH_solvcarbo(i) = carbo_reqP1aHH(i)/P1acarbo;
reqH1rHH_solvcarbo(i) = carbo_reqH1rHH(i)/H1rcarbo;
reqH1mHH_solvcarbo(i) = carbo_reqH1mHH(i)/H1mcarbo;

reqP1aHH_solvlipi(i) = lipi_reqP1aHH(i)/P1alipi;
reqH1rHH_solvlipi(i) = lipi_reqH1rHH(i)/H1rlipi;
reqH1mHH_solvlipi(i) = lipi_reqH1mHH(i)/H1mlipi;

reqP1aHH_solvkcal(i) = kcal_reqP1aHH(i)/P1akcal;
reqH1rHH_solvkcal(i) = kcal_reqH1rHH(i)/H1rkcal;
reqH1mHH_solvkcal(i) = kcal_reqH1mHH(i)/H1mkcal;

% Cantidad de masa Xi p/compartimento que solvente la DEMANDA ALIMENTARIA HH 
reqP1aHH = [reqP1aHH_solvprote(i) reqP1aHH_solvcarbo(i) reqP1aHH_solvlipi(i) reqP1aHH_solvkcal(i)];
reqH1rHH = [reqH1rHH_solvprote(i) reqH1rHH_solvcarbo(i) reqH1rHH_solvlipi(i) reqH1rHH_solvkcal(i)];
reqH1mHH = [reqH1mHH_solvprote(i) reqH1mHH_solvcarbo(i) reqH1mHH_solvlipi(i) reqH1mHH_solvkcal(i)];

dem_P1aHH = (max(reqP1aHH))/tp;
dem_H1rHH = (max(reqH1rHH))/tp;
dem_H1mHH = (max(reqH1mHH))/tp;

% DEMANDA ALIMENTARIA P1a P1b H1r H1m

demtotal_H1r = H1rP1a + H1rP1b + H1rC1 + dem_H1rHH;
demtotal_H1m = H1mP1a + H1mP1b + H1mC1 + dem_H1mHH;
demtotal_P1a = P1aH1r + P1aH1m + P1aH2 + dem_P1aHH;
demtotal_P1b = P1bH1r + P1bH1m + P1bH2;

dem_P1aH1r = demtotal_H1r * TA_P1aH1r;
dem_P1bH1r = demtotal_H1r* TA_P1bH1r;
dem_P2H1r = demtotal_H1r* TA_P2H1r;
dem_HHH1r = demtotal_H1r* TA_HHH1r;

dem_P1aH1m = demtotal_H1m * TA_P1aH1m;
dem_P1bH1m = demtotal_H1m* TA_P1bH1m;
dem_P2H1m = demtotal_H1m* TA_P2H1m;
dem_HHH1m = demtotal_H1m* TA_HHH1m;

if demanda == 1
    RPP1a = demtotal_P1a;
    RPP1b = demtotal_P1b;
    P1aHH = dem_P1aHH;
    P1aH1r = dem_P1aH1r;
    P1aH1m = dem_P1aH1m;
    P1bH1r = dem_P1bH1r;
    P1bH1m = dem_P1bH1m;
    P2H1r = dem_P2H1r;
    P2H1m = dem_P2H1m;
    H1rHH = dem_H1rHH;
    H1mHH = dem_H1mHH;
    HHH1r = dem_HHH1r;    
    HHH1m = dem_HHH1m;
end


%%  DISPONIBILIDAD ALIMENTARIA "MACROMOLECULAS" (aporte nutrimental) disponibles percapita
prote_disp_pc(i) = (((P1aHHprote*P1aHH) + (H1rHHprote*H1rHH) + (H1mHHprote*H1mHH))/(pob_mund(i)*30.42))*1e12;
carbo_disp_pc(i) = (((P1aHHcarbo*P1aHH) + (H1rHHcarbo*H1rHH) + (H1mHHcarbo*H1mHH))/(pob_mund(i)*30.42))*1e12;
lipi_disp_pc(i) = (((P1aHHlipi*P1aHH) + (H1rHHlipi*H1rHH) + (H1mHHlipi*H1mHH))/(pob_mund(i)*30.42))*1e12;
kcal_disp_pc(i) = (((P1aHHkcal*P1aHH) + (H1rHHkcal*H1rHH) + (H1mHHkcal*H1mHH))/(pob_mund(i)*30.42))*1e12;
   
    prote_min(i) = 48;
    prote_max(i) = 120;
    carbo_min(i) = 168.75;
    carbo_max(i) = 525;
    lipi_min(i) = 0;
    lipi_max(i) = 133.3;
    kcal_min(i) = 1500;
    kcal_max(i) = 3000;
  
       
%%%%%%%---Producion mensual---%%%%%%% Análisis de Sensibilidad

a = 0.9;
b =1.1;

%P1a
prodCerTubHH = (P1aHH * 0.3840578);
prodCerTubH1r = (P1aH1r * 0.8842975);
prodCerTubH1m = (P1aH1m * 0.7129987);
prodCerTub = (prodCerTubHH + prodCerTubH1r + prodCerTubH1m);

prodVerHH = (P1aHH * 0.2462324);
prodVerH1r = (P1aH1r * 0.0000000);
prodVerH1m = (P1aH1m * 0.0000000);
prodVer = (prodVerHH + prodVerH1r + prodVerH1m); 

prodFruHH = (P1aHH * 0.2978273);
prodFruH1r = (P1aH1r * 0.0000000);
prodFruH1m = (P1aH1m * 0.0000000);
prodFru = (prodFruHH + prodFruH1r + prodFruH1m);

prodOleHH = (P1aHH * 0.0718825);
prodOleH1r = (P1aH1r * 0.1157025);
prodOleH1m = (P1aH1m * 0.2870013);
prodOle = (prodOleHH + prodOleH1r + prodOleH1m);

%H1r
prodBov = (H1rHH * 0.071411358);
prodLec = (H1rHH * 0.912620269);
prodOvi = (H1rHH * 0.015968373);

%H1m
prodAve = (H1mHH * 0.2705074);
prodPor = (H1mHH * 0.2183949);
prodHue = (H1mHH * 0.1841092);
prodOtrGan = (H1mHH * 0.0127298);
prodPes = (H1mHH * 0.3142588);

%P1b
prodResCulH1r = (P1bH1r * 0.75690303);
prodResCulH1m = (P1bH1m * 0.981309265);
prodResCul = (prodResCulH1r + prodResCulH1m);

prodEnsH1r =(P1bH1r * 0.24309697);
prodEnsH1m =(P1bH1m * 0.018690735);
prodEns = (prodEnsH1r + prodEnsH1m);

%P2
prodPasHoj = (P2H1r + P2H1m);

%HH
prodDes = (HHH1r + HHH1m);

    
    
 %%         %%%%% Next Step %%%%% 
%%
  
%% %%% CO2eq %%%%%  
    CO2eq(i+1) = CO2eq(i) + (wRP*RP(i)) + (wP1a*P1a(i)) + (wP1b*P1b(i)) + (wP2*P2(i)) + (wH1r*H1r(i)) + (wH1m*H1m(i)) + (wH2*H2(i)) + (wpob_mund*pob_mund(i)) + (wC1*C1(i));
    %CO2(i+1) = CO2eq(i)*0.815;

    dCO2(i+1) = CO2eq(i+1) - CO2eq(i);  %diferencial de CO2 para desarrollo plantas
    
%% %%% TEMPERATURA %%%%%   
      %atemp(i+1)=0.010008*CO2eq(i) - 3.21675;                                       %CO2eq 522 a 675.8  %Temp 25 a 28.54 Atemp
      
      %atemp(i+1)=0.0060155669*CO2eq(i) - 2.2124316562;                             %CO2eq 522 a 654    %Temp 25 a 26.72 
      %atemp(i+1)=0.0017370853*exp(0.0122159358*CO2eq(i));                          %CO2eq 522 a 663.7  %Temp 25 a 30.75 
      atemp(i+1)=0.0000213866*(CO2eq(i)^2) - 0.0136962886*CO2eq(i) + 2.2936139065 ; %se dezplaza hacia arriba 0.3 en la grafica de Atemp en ¨PlotArticulo¨
      
      %temp(i+1)= 1+tempo+atemp(i+1); chanchuyo
      temp(i+1)= tempin+atemp(i+1);


%% %%% POPULATION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Revisar 
    yeara(i+1) = i*(1/12) + 2020;
    
        if incre_HH == 0
    pob_mund (i+1)= pob_mund(i);
    end
    
    if incre_HH == 1
 
        ppHH(i) = HH(i)/pob_mund(i);
        
        IMCpc(i) = ppHH(i)*1e9/(apHH*apHH);
        
    birth_rate(i) = (36.4499771662*exp(-0.0009862446*(i+732)))/(1000*12);  
    mortality_rate(i) =( -2.3569365994*log(i+732) + 23.2130036155)/(1000*12);
    
            mHH = 0.00005368*(IMCpc(i)^4) - 0.00627589*(IMCpc(i)^3) + 0.27424943*(IMCpc(i)^2) - 5.29297998*IMCpc(i) + 37.92871035;
    
            mHH = m_IMC([IMCpc(i)]);
    
    pob_mund(i+1)= pob_mund(i) + pob_mund(i)*birth_rate(i) - mortality_rate(i)*pob_mund(i)*mHH;
    end
      
%%  FLUJOS      
    
    flujos(i,:) = [RPP1a RPP1b RPP2... 
                P1aHH P1aH1r P1aH1m P1aH2 P1aRP... 
                P1bH1r P1bH1m P1bH2 P1bRP...
                P2H1r P2H1m P2H2 P2RP...
                H1rHH H1rC1 H1rP1a H1rP1b H1rRP...
                H1mHH H1mC1 H1mP1a H1mP1b H1mRP...
                H2C1 H2RP...
                HHRP HHH1r HHH1m...
                C1RP];   

            
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
 
%% %%% COMPARTIMENT %%%%%
   
    RP(i+1)=	RP(i) + (P1aRP + P1bRP + P2RP + H1rRP + H1mRP + H2RP + C1RP + HHRP - RPP1a - RPP1b - RPP2) *h;

    P1a(i+1) = P1a(i) + (RPP1a + H1rP1a + H1mP1a - P1aHH - P1aH1r - P1aH1m - P1aH2 - P1aRP) *h;

    P1b(i+1) = P1b(i) + (RPP1b + H1rP1b + H1mP1b - P1bH1r - P1bH1m - P1bH2 - P1bRP) *h;
    
    H1r(i+1) = H1r(i) + (P1aH1r + P1bH1r + P2H1r + HHH1r - H1rHH - H1rC1 - H1rP1a - H1rP1b - H1rRP) *h;
    
    H1m(i+1) = H1m(i) + (P1aH1m + P1bH1m + P2H1m + HHH1m - H1mHH - H1mC1 - H1mP1a - H1mP1b - H1mRP) *h;
    
    HH(i+1) = HH(i)	+ (P1aHH + H1rHH + H1mHH - HHRP - HHH1r - HHH1m) *h;
    
    P2(i+1) = P2(i)	+ (RPP2 - P2H1r - P2H1m - P2H2 - P2RP) *h;
    
    H2(i+1) = H2(i)	+ (P1aH2 + P1bH2 + P2H2 - H2C1 - H2RP) *h;
    
    C1(i+1) = C1(i)	+ (H1rC1 + H1mC1 + H2C1 - C1RP) *h;
    
    
 end
 
 
 

 %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %% VALORES PROMEDIO PARA GRAFICAR CO2
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 time_years = floor(time/tp);

for k=1:time_years 
 year(k) = k + 2020;
end
 
%{ 
for k=1:time_years 
    CO2p(k) = mean(CO2(1+(tp*(k-1)):tp*k));
end
%} 

for k=1:time_years 
    CO2eqp(k) = mean(CO2eq(1+(tp*(k-1)):tp*k));
end 
 
for k=1:time_years 
    atempp(k) = mean(atemp(1+(tp*(k-1)):tp*k));
end 

for k=1:time_years 
    tempp(k) = mean(temp(1+(tp*(k-1)):tp*k));
end  

for k=1:time_years 
    P1ap(k) = mean(P1a(1+(tp*(k-1)):tp*k));
end  

for k=1:time_years 
    P1bp(k) = mean(P1b(1+(tp*(k-1)):tp*k));
end  

for k=1:time_years 
    P2p(k) = mean(P2(1+(tp*(k-1)):tp*k));
end  

for k=1:time_years 
    H1rp(k) = mean(H1r(1+(tp*(k-1)):tp*k));
end  

for k=1:time_years 
    H1mp(k) = mean(H1m(1+(tp*(k-1)):tp*k));
end  

for k=1:time_years 
    H2p(k) = mean(H2(1+(tp*(k-1)):tp*k));
end  

for k=1:time_years 
    HHp(k) = mean(HH(1+(tp*(k-1)):tp*k));
end  

for k=1:time_years 
    C1p(k) = mean(C1(1+(tp*(k-1)):tp*k));
end  

for k=1:time_years 
    RPp(k) = mean(RP(1+(tp*(k-1)):tp*k));
end  

for k=1:time_years 
    pob_mundp(k) = mean(pob_mund(1+(tp*(k-1)):tp*k));
end

%MACROMOLECULAS
for k=1:time_years 
    prote_disp_pcp(k) = mean(prote_disp_pc(1+(tp*(k-1)):tp*k));
end
for k=1:time_years 
    carbo_disp_pcp(k) = mean(carbo_disp_pc(1+(tp*(k-1)):tp*k));
end
for k=1:time_years 
    lipi_disp_pcp(k) = mean(lipi_disp_pc(1+(tp*(k-1)):tp*k));
end
for k=1:time_years 
    kcal_disp_pcp(k) = mean(kcal_disp_pc(1+(tp*(k-1)):tp*k));
end

% min y max
for k=1:time_years 
    prote_minp(k) = mean(prote_min(1+(tp*(k-1)):tp*k));
end
for k=1:time_years 
    carbo_minp(k) = mean(carbo_min(1+(tp*(k-1)):tp*k));
end
for k=1:time_years 
    lipi_minp(k) = mean(lipi_min(1+(tp*(k-1)):tp*k));
end
for k=1:time_years 
    kcal_minp(k) = mean(kcal_min(1+(tp*(k-1)):tp*k));
end
for k=1:time_years 
    prote_maxp(k) = mean(prote_max(1+(tp*(k-1)):tp*k));
end
for k=1:time_years 
    carbo_maxp(k) = mean(carbo_max(1+(tp*(k-1)):tp*k));
end
for k=1:time_years 
    lipi_maxp(k) = mean(lipi_max(1+(tp*(k-1)):tp*k));
end
for k=1:time_years 
    kcal_maxp(k) = mean(kcal_max(1+(tp*(k-1)):tp*k));
end



%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% COMPARTIMENT PLOTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%load ('Modelo_de_Cadena_Alimentaria_HH_Caso_Estable')

%PlotArticuloCap6
%PlotArticuloIngles
%PlotFlujos
%PlotCap4vsCap5