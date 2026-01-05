
%clear all;
%clc;

function Z = FMCA(vd)
%% Caso Estable
%CasoEstablePromedio     **** Hay que desactivar lo que "no sirva"

%% Valor de variables de decisión
%vd = vdopt;

%vd = [0.3841  0.2462  0.2978  0.0719  0.0714  0.9126  0.0160  0.2705  0.2184  0.1842  0.0127  0.3142 ... %periodo 1
%      0.3841  0.2462  0.2978  0.0719  0.0714  0.9126  0.0160  0.2705  0.2184  0.1842  0.0127  0.3142 ... %periodo 2
%      0.3841  0.2462  0.2978  0.0719  0.0714  0.9126  0.0160  0.2705  0.2184  0.1842  0.0127  0.3142 ... %periodo 3
%      0.3841  0.2462  0.2978  0.0719  0.0714  0.9126  0.0160  0.2705  0.2184  0.1842  0.0127  0.3142];   %periodo 4


%% INPUTS
time = 12*80;         %Tiempo en meses
temp_PL_CO2 = 1;    %Afectacion de Temp en plantas 0=NO  1=SI
incre_HH = 1;       %Dinamica poblacional 0=NO  1=SI (tasa de natalidad y mortandad)  2=SI (increm poblacional)
demanda = 1;        % 1 Si la demanda controla el flujo

 %% CONTROL DE TIEMPO
tp=12;      % meses por anio (PARA GRAFICAR)
h=1/tp;     %tamano de paso ecuaciones 
hg=1/tp;    %tamano de paso gradientes
hw=1/tp;
yeara(1) = 2021;

%% CONTROL DE CO2
CO2eq(1) = 522;     %ppm
CO2(1) = CO2eq*.75; %ppm emision en 2019


%cambio en co2 para crecimiento de plantas
dCO2(1) = 0;        %diferencial de CO2
bc = -1.208e-5;     %parametro de ecuación cuadrática
cc = 0.006196;      %parametro de ecuación cuadrática

%Datos historicos (1850-2019)
dCons = 174.37; % ppm
dEmis = 2400 ; %Gton

fr =  dCons/dEmis;

%% CONTROL DE TEMPERATURA
atemp(1) = 1.2;  %Anomalía inicial
 tempin=24;      %Temperatura optima
 temp(1)=tempin + atemp(1);
 tempoP1 = 22.5;
 tempoP2 = 25;

 
%% CONTROL POBLACION
pob_mund(1)= 7841013824.88479;              %población mundial inicial
birth_rate(1) = 17.2231568995677/1000;      %tasa de natalidad actual
mortality_rate(1) = 8.03210175657131/1000;  %tasa de mortalidad actual

%****************************************************************************************
ppHHi = 59.078;    %Peso promedio ideal Kg
%ppHH(1) = 62;        %peso promedio inicial Kg
apHH = 1.65;        %Altura promedio Mts

%****************************************************************************************

%% VALOR INICIAL DE ESPECIES

% En millones de toneladas 
RP(1) = 75939.0479663931;
P1a(1) = 1937.7261514000;
P1b(1) = 7750.9046056000;
P2(1) = 48713.0772868040;
H1r(1) = 560.3278273580;
H1m(1) = 236.7245586420;
H2(1) = 50.2500000000;
C1(1) = 612.1300000000;
HH(1) = 489.8000000000;

%% FACTORES DE DESARROLLO DE COMPARTIMENTOS MENSUALES
% RP si temp_PL == 0  
gRPP1a = 0.0000277507538195019000 *hg;       %0%-60%
gRPP1b = 0.0000034997121157711600 *hg;       %40%-100% (40% de areas cultivadas no disponibles para P1a)
gRPP2  = 0.0000067405385082326100 *hg;
% RP si temp_PL == 1  
gRPP1am = 0.0000277507538195019000 *hg;       %0%-60%
gRPP1bm = 0.0000034997121157711600 *hg;       %40%-100% (40% de areas cultivadas no disponibles para P1a)
gRPP2m  = 0.0000067405385082326100 *hg;
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
 
%% FACTORES DE ABSORCIóN (Gt de Co2eq / unidad de compartimnto Xi)
waRP  = -2.69878E-05/12;
waP2  = -2.73953E-05/12;
%% FACTORES DE EMISION (Gt de Co2eq / unidad de Xi producida)
%P1a
wCerTub = 0.001064412;
wVer = 0.000390607;
wFru = 0.000257639;
wOle = 0.00099841;
%H1r	
wBov = 0.02853;
wLec = 0.00095659;
wOvi = 0.021868323;
%H1m	
wAve = 0.004312059;
wPor = 0.003737705;
wHue = 0.003173638;
wOtrGan = 0.0459;
wPes = 0.003342607;
%P1b	
wResCul = 0;
wEns = 0.001387399;
%P2	
wPasHoj = 0.000622589;
%HH
% Aqui le cambiamos wDes = 0.143348214;
wDes = 0.000848214285714286;
wpob_mund = (59-10.94443)/pob_mund(1); %Emisi Anuales - AFOLU - El % de desechos ***ENTRE 12 PARA HACERLO MENSUAL

wH2 = 0;
wC1 = 0;



%% #########################  TendenciaAlimentaria ######################################
%TendenciaAlimentaria

% CONTROL DISPONIBILIDAD ALIMENTARIA
%convecion de unidades
g_a_milloneston = 0.000000000001; %gramos a millones de toneladas
diano = 365;  %año a días

% Porcentaje de consumo por compartimento por parte de H1r
%P1a a H1r     CeTu     Ver   Fru      Ole
pcP1aH1r = [0.8842975    0     0    0.1157025];
%P1b a H1r    ResCul      Ens 
pcP1bH1r = [0.75690303 0.24309697];

% Porcentaje de consumo por compartimento por parte de H1m
%P1a a H1m     CeTu     Ver   Fru      Ole
pcP1aH1m = [0.7129987    0     0    0.2870013];
%P1b a H1m    ResCul      Ens 
pcP1bH1m = [0.981309265 0.018690735];

%**************************************************************************

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parametro de entrada
consHH = [3.0542e3    1.0082e3    0.5028e3];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Variables de decisión
%pcP1a = [vd(1)    vd(2)    vd(3)    vd(4)];
%pcH1r = [vd(5)    vd(6)    vd(7)];
%pcH1m = [vd(8)    vd(9)    vd(10)    vd(11)    vd(12)];
%se agrega las variables multiperiodo dentro del ciclo if linea 318

% Ajuste Variables de decisión

%pcP1a = pcP1a/suma(pcP1a);
%pcH1r = pcH1r/suma(pcH1r);
%pcH1m = pcH1m/suma(pcH1m);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  START LOOP   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 for i=1 : time
           
     
           %PLANTAS factor de desarrollo en función de CO2 y Teemperatura %(Redes Neuronales)
   if temp_PL_CO2 == 1 
   %{    
   gRPP1a=gRPP1am*(exp(-(((temp(i)-tempo)^2)/100)) + (bc*dCO2(i)^2) + cc*dCO2(i));
   gRPP1b=gRPP1bm*(exp(-(((temp(i)-tempo)^2)/100)) + (bc*(dCO2(i)^2) + cc*dCO2(i));
   gRPP2=gRPP2m*(exp(-(((temp(i)-tempo)^2)/100)) + (bc*dCO2(i)^2) + cc*dCO2(i));
   %}
       
   gRPP1a = gRPP1am*g_CO2_Temp([dCO2(i),temp(i)]');
   gRPP1b = gRPP1bm*g_CO2_Temp([dCO2(i),temp(i)]');
   gRPP2 = gRPP2m*g_CO2_Temp([dCO2(i),(temp(i)-2.5)]'); %Se desplaza -2.5 emn P2 devido a que la RN esta adaptada a 25C como optima
     
   end
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Variables de decisión     
if i <= 240
    pcP1a = [vd(1)    vd(2)    vd(3)    vd(4)];
    pcH1r = [vd(5)    vd(6)    vd(7)];
    pcH1m = [vd(8)    vd(9)    vd(10)    vd(11)    vd(12)];

elseif i <= 480
    pcP1a = [vd(13)    vd(14)    vd(15)    vd(16)];
    pcH1r = [vd(17)    vd(18)    vd(19)];
    pcH1m = [vd(20)    vd(21)    vd(22)    vd(23)    vd(24)];

elseif i <= 720
    pcP1a = [vd(25)    vd(26)    vd(27)    vd(28)];
    pcH1r = [vd(29)    vd(30)    vd(31)];
    pcH1m = [vd(32)    vd(33)    vd(34)    vd(35)    vd(36)];
else 
    pcP1a = [vd(37)    vd(38)    vd(39)    vd(40)];
    pcH1r = [vd(41)    vd(42)    vd(43)];
    pcH1m = [vd(44)    vd(45)    vd(46)    vd(47)    vd(48)];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% PROPIEDADES NUTRICIONALES XiHH (%) g/100g de producto

%       [Pro Car Lip Kc]
ANP1a = [6	87	1.1	378; %CeTu
        2.9	13	0.2	65;  %Ver
        1	6	0.2	25;  %Fru
        16	21	57	607];%Ole

ANH1r = [26	0	12	215; %Bov
        3.4	5	1	42;  %Lec
        25	0	21	294];%Ovi

ANH1m = [22.5	0	 1.93	107; %Ave   
        18	0   17.5 229; %Por
        13	1.1	11	 155; %Hue
        26	7	19	 200; %OtrGan
        22	0	12	 206];%Pes

pcNP1a = pcP1a*ANP1a;
pcNH1r = pcH1r*ANH1r;
pcNH1m = pcH1m*ANH1m;

% promedio ponderado 
XiHH = [pcNP1a; pcNH1r; pcNH1m]/100;

%P1a
P1aprote = XiHH(1,1); 
P1acarbo = XiHH(1,2);
P1alipi = XiHH(1,3);
P1akcal = XiHH(1,4); 			

%H1r
H1rprote = XiHH(2,1);
H1rcarbo = XiHH(2,2);
H1rlipi = XiHH(2,3);
H1rkcal = XiHH(2,4);

%H1m
H1mprote = XiHH(3,1);
H1mcarbo = XiHH(3,2);
H1mlipi = XiHH(3,3);
H1mkcal = XiHH(3,4);


%Cantidad total de proteinas, carbohidratos, lipidos y kcal aportadas por cada compartimento (P1a H1r H1m)
for ii=1:3
    
   apor(ii,:)= XiHH(ii,:)*consHH(ii); 
    
end

suma_apor = sum(apor);

% Porcentaje de aportación de cada compartimento de cada macronutriente.
% ejemplo, porcentaje de las proteinas totales que son aportadas por P1a
for ii=1:4
    
   TA(:,ii)= apor(:,ii)/suma_apor(ii); 
    
end

%% TENDENCIA ALIMENTARIA ACTUAL

% Distribución porcentual para satisfacer la demanda
%TA = apor./sum(apor;

%HH macronutrientes
TA_P1aHHpro = TA(1,1);
TA_H1rHHpro = TA(2,1);
TA_H1mHHpro = TA(3,1);

TA_P1aHHcar = TA(1,2);
TA_H1rHHcar = TA(2,2);
TA_H1mHHcar = TA(3,2);

TA_P1aHHlip = TA(1,3);
TA_H1rHHlip = TA(2,3);
TA_H1mHHlip = TA(3,3);

TA_P1aHHkca = TA(1,4);
TA_H1rHHkca = TA(2,4);
TA_H1mHHkca = TA(3,4);

%% TENDENCIA ACTUAL DE INSUMOS PARA GANADO

%H1r insumos
TA_P1aH1r = 0.049907197;
TA_P1bH1r = 0.37613941;
TA_P2H1r = 0.56343576;
TA_HHH1r = 0.010517633;

%H1m insumos
TA_P1aH1m = 0.677419355;
TA_P1bH1m = 0.197035745;
TA_P2H1m = 0.022667829;
TA_HHH1m = 0.102877071;			

%% CONSUMO RECOMENDADO de macronutrientes HH OMS (sedentaria de 60 Kg)g/p/dia    

prote_rec = 96;     %gramos persona/dia
carbo_rec = 343.75; %gramos persona/dia
lipi_rec  = 76.4;   %gramos persona/dia
kcal_rec  = 2500;   %gramos persona/dia

   
    %% Flujos Naturales
   
          %%%%% MATTER FLOW %%%%%   
    % RP
    RPP1a = gRPP1a*RP(i)*P1a(i);
    RPP1b = gRPP1b*RP(i)*P1b(i);
    RPP2  = gRPP2 *RP(i)*P2 (i);
   
    % P1a
    P1aHH  = gP1aHH *P1a(i)*HH(i);
    P1aH1r = gP1aH1r*P1a(i)*H1r(i);    
    P1aH1m = gP1aH1m*P1a(i)*H1m(i);
    P1aH2  = gP1aH2 *P1a(i)*H2(i);
    P1aRP  = gP1aRP *P1a(i)*RP(i);
    % P1b
    P1bH1r = gP1bH1r*P1b(i)*H1r(i);
    P1bH1m = gP1bH1m*P1b(i)*H1m(i);
    P1bH2  = gP1bH2*P1b(i) *H2(i);
    P1bRP  = gP1bRP*P1b(i) *RP(i);
    % P2
    P2H1r = gP2H1r*P2(i)*H1r(i);
    P2H1m = gP2H1m*P2(i)*H1m(i);
    P2H2  = gP2H2 *P2(i)*H2(i);
    P2RP  = gP2RP *P2(i)*RP(i);
    % H1r
    H1rHH  = gH1rHH *H1r(i)*HH(i);
    H1rC1  = gH1rC1 *H1r(i)*C1(i);
    H1rP1a = gH1rP1a*H1r(i)*P1a(i);
    H1rP1b = gH1rP1b*H1r(i)*P1b(i);
    H1rRP  = gH1rRP *H1r(i)*RP(i);
    % H1m
    H1mHH  = gH1mHH *H1m(i)*HH(i);
    H1mC1  = gH1mC1 *H1m(i)*C1(i);
    H1mP1a = gH1mP1a*H1m(i)*P1a(i);
    H1mP1b = gH1mP1b*H1m(i)*P1b(i);
    H1mRP  = gH1mRP *H1m(i)*RP(i);
    % H2
    H2C1 =	gH2C1*H2(i)*C1(i);
    H2RP =	gH2RP*H2(i)*RP(i);
    % HH
    HHRP  =	gHHRP*HH(i) *RP(i);
    HHH1r = gHHH1r*HH(i)*H1r(i);
    HHH1m = gHHH1m*HH(i)*H1m(i);
    
    %C1
    C1RP =	gC1RP*C1(i)*RP(i);
    
%{
    %almacenamiento de flujos
    flujos(i,:) = [RPP1a RPP1b RPP2... 
                P1aHH P1aH1r P1aH1m P1aH2 P1aRP... 
                P1bH1r P1bH1m P1bH2 P1bRP...
                P2H1r P2H1m P2H2 P2RP...
                H1rHH H1rC1 H1rP1a H1rP1b H1rRP...
                H1mHH H1mC1 H1mP1a H1mP1b H1mRP...
                H2C1 H2RP...
                HHRP HHH1r HHH1m...
                C1RP];   

%                    1     2    3
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
%}
    
%% TENDENCIA ALIMENTRIA ACTUAL (NO DINAMICA)


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

% Lo que los compartimentos tienen que producir
demtotal_H1r = H1rP1a + H1rP1b + H1rC1 + dem_H1rHH;
demtotal_H1m = H1mP1a + H1mP1b + H1mC1 + dem_H1mHH;
demtotal_P1a = P1aH1r + P1aH1m + P1aH2 + dem_P1aHH;
demtotal_P1b = P1bH1r + P1bH1m + P1bH2;

% Lo que los compartimentos necesecitan
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% La variable de consumo va a cambiar en cada iteración
% Las variables ProductX en realidad son XHH. Para hacer una correcta
% integración, las variables de consumo actual del archivo de 
% TendenciaAlimentaria las tendreamos que homogeneizar con las de este
% archivo que son las prodXY. Ejemplo CeTu es prodCerTubHH.

%consHH = [ProducP1a ProducH1r ProducH1m];
consHH = [P1aHH H1rHH H1mHH];

% Todo esto conlleva un error de conceptualización que tenía. Las variables
% de consumo del archivo de TA (hasta la línea 33) los usamos previamente
% para obtener los porcentajes de la demanda de HH (linea 35-53). Esto
% porque estabamos usando esa tendencia alimentaria, pero ahora debemos
% hacer al revés: establecer "arbitrariamente" unos porcentajes, y con
% esos, establecer el consumo, una matriz nutrimental XiHH y una matriz de
% Tendencia Alimentaria TA. Hacerlo así incluso nos va a reducir la
% canridad de variables de decisión de 12 a 9.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  DISPONIBILIDAD ALIMENTARIA "MACROMOLECULAS" (aporte nutrimental) percapita

prote_disp_pc(i) = (((P1aprote*P1aHH) + (H1rprote*H1rHH) + (H1mprote*H1mHH))/(pob_mund(i)*30.42))*(1/g_a_milloneston);
carbo_disp_pc(i) = (((P1acarbo*P1aHH) + (H1rcarbo*H1rHH) + (H1mcarbo*H1mHH))/(pob_mund(i)*30.42))*(1/g_a_milloneston);
lipi_disp_pc(i) = (((P1alipi*P1aHH) + (H1rlipi*H1rHH) + (H1mlipi*H1mHH))/(pob_mund(i)*30.42))*(1/g_a_milloneston);
kcal_disp_pc(i) = (((P1akcal*P1aHH) + (H1rkcal*H1rHH) + (H1mkcal*H1mHH))/(pob_mund(i)*30.42))*(1/g_a_milloneston);
   
    prote_min(i) = 48;
    prote_max(i) = 120;
    carbo_min(i) = 168.75;
    carbo_max(i) = 525;
    lipi_min(i) = 0;
    lipi_max(i) = 133.3;
    kcal_min(i) = 1500;
    kcal_max(i) = 3000;


    
%%%%%%%---Producion ---%%%%%%%

%**************************************************************************
% sustituí los valores númericos por la variable correspondiente. Los
% porcentajes para H1r y H1m los agregué en Tendencia Alimentaria
%**************************************************************************
%P1a
%prodCerTubHH  = (P1aHH * 0.3840578);
prodCerTubHH   = (P1aHH * pcP1a(1));
%prodCerTubH1r = (P1aH1r * 0.8842975);
prodCerTubH1r  = (P1aH1r * pcP1aH1r(1));
%prodCerTubH1m = (P1aH1m * 0.7129987);
prodCerTubH1m  = (P1aH1m * pcP1aH1m(1));
prodCerTub = (prodCerTubHH + prodCerTubH1r + prodCerTubH1m);

%prodVerHH  = (P1aHH * 0.2462324);
prodVerHH   = (P1aHH * pcP1a(2));
%prodVerH1r = (P1aH1r * 0.0000000);
prodVerH1r  = (P1aH1r * pcP1aH1r(2));
%prodVerH1m = (P1aH1m * 0.0000000);
prodVerH1m  = (P1aH1m * pcP1aH1m(2));
prodVer = (prodVerHH + prodVerH1r + prodVerH1m); 

%prodFruHH  = (P1aHH * 0.2978273);
prodFruHH   = (P1aHH * pcP1a(3));
%prodFruH1r = (P1aH1r * 0.0000000);
prodFruH1r  = (P1aH1r * pcP1aH1r(3));
%prodFruH1m = (P1aH1m * 0.0000000);
prodFruH1m  = (P1aH1m * pcP1aH1m(3));
prodFru = (prodFruHH + prodFruH1r + prodFruH1m);

%prodOleHH  = (P1aHH * 0.0718825);
prodOleHH   = (P1aHH * pcP1a(4));
%prodOleH1r = (P1aH1r * 0.1157025);
prodOleH1r  = (P1aH1r * pcP1aH1r(4));
%prodOleH1m = (P1aH1m * 0.2870013);
prodOleH1m  = (P1aH1m * pcP1aH1m(4));
prodOle = (prodOleHH + prodOleH1r + prodOleH1m);

%H1r
%prodBov = (H1rHH * 0.071411358);
prodBov  = (H1rHH * pcH1r(1));
%prodLec = (H1rHH * 0.912620269);
prodLec  = (H1rHH * pcH1r(2));
%prodOvi = (H1rHH * 0.015968373);
prodOvi  = (H1rHH * pcH1r(3));

%H1m
%prodAve    = (H1mHH * 0.2705074);
prodAve     = (H1mHH * pcH1m(1));
%prodPor    = (H1mHH * 0.2183949);
prodPor     = (H1mHH * pcH1m(2));
%prodHue    = (H1mHH * 0.1841092);
prodHue     = (H1mHH * pcH1m(3));
%prodOtrGan = (H1mHH * 0.0127298);
prodOtrGan  = (H1mHH * pcH1m(4));
%prodPes    = (H1mHH * 0.3142588);
prodPes     = (H1mHH * pcH1m(5));

%P1b
%prodResCulH1r = (P1bH1r * 0.75690303);
prodResCulH1r  = (P1bH1r * pcP1bH1r(1));
%prodResCulH1m = (P1bH1m * 0.981309265);
prodResCulH1m  = (P1bH1m * pcP1bH1m(1));
prodResCul = (prodResCulH1r + prodResCulH1m);

%prodEnsH1r = (P1bH1r * 0.24309697);
prodEnsH1r  = (P1bH1r * pcP1bH1r(2));
%prodEnsH1m = (P1bH1m * 0.018690735);
prodEnsH1m  = (P1bH1m * pcP1bH1m(2));
prodEns = (prodEnsH1r + prodEnsH1m);

%P2
prodPasHoj = (P2H1r + P2H1m);

%HH
prodDes = (HHH1r + HHH1m);
    

CO2eqP1a = (wCerTub*prodCerTub) + (wVer*prodVer) + (wFru*prodFru) + (wOle*prodOle);
CO2eqH1r = (wBov*prodBov) + (wLec*prodLec) + (wOvi*prodOvi);
CO2eqH1m = (wAve*prodAve) + (wPor*prodPor) + (wHue*prodHue) + (wOtrGan*prodOtrGan) + (wPes*prodPes);
CO2eqP1b = (wResCul*prodResCul) + (wEns*prodEns);
CO2eqP2  = (wPasHoj*prodPasHoj);
CO2eqHH  = (wDes*prodDes);


 %%         %%%%% Next Step %%%%% 
%%
  
%%%%% CO2eq calculado a partir del tamano de los compartimentos%%%%%  
%{
CO2eqasd(1) = 0;
    CO2eq(i+1) = CO2eq(i) + h*((wRP*RP(i)) + (wP1a*P1a(i)) + (wP1b*P1b(i)) + (wP2*P2(i)) + (wH1r*H1r(i)) + (wH1m*H1m(i)) + (wH2*H2(i)) + (wpob_mund*pob_mund(i)) + (wC1*C1(i)));
    CO2(i+1) = CO2eq(i)*0.75;
%}
%%%%%% CO2eq calculado a partir de la Produccion alimentarias%%%%%   
    CO2eq(i+1) = CO2eq(i) + (waRP*RP(i)) + (waP2*P2(i)) + (h * fr * (CO2eqP1a + CO2eqH1r + CO2eqH1m + CO2eqP1b + CO2eqP2 + CO2eqHH + wpob_mund*pob_mund(i)) + wH2*H2(i) + wC1*C1(i)); %*** AFOLU se multiplica por 12 ya que son emisiónes por flujo mensual y las demas son anuales
    
    
    %CO2(i+1) = CO2eq(i)*0.75;

 dCO2(i+1) = CO2eq(i+1) - CO2eq(i);  %diferencial de CO2 para desarrollo plantas
 
 
 

%% %%% TEMPERATURA %%%%%   
      atemp(i+1)=0.0000213866*(CO2eq(i)^2) - 0.0136962886*CO2eq(i) + 2.2936139065 ; %se dezplaza hacia arriba 0.3 en la grafica de Atemp en ¨PlotArticulo¨
      
      temp(i+1)= tempin+atemp(i+1);
      
      

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
      
%% FLUJOS

        flujos(i,:) = [RPP1a RPP1b RPP2... 
                P1aHH P1aH1r P1aH1m P1aH2 P1aRP... 
                P1bH1r P1bH1m P1bH2 P1bRP...
                P2H1r P2H1m P2H2 P2RP...
                H1rHH H1rC1 H1rP1a H1rP1b H1rRP...
                H1mHH H1mC1 H1mP1a H1mP1b H1mRP...
                H2C1 H2RP...
                HHRP HHH1r HHH1m...
                C1RP];  

            %    flujos(i,:) = [RPP1a RPP1b RPP2... 
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
    
 %%%%% COMPARTIMENT %%%%%
   
    RP(i+1)=	RP(i) + (P1aRP + P1bRP + P2RP + H1rRP + H1mRP + H2RP + C1RP + HHRP - RPP1a - RPP1b - RPP2) *h;

    P1a(i+1) = P1a(i) + (RPP1a + H1rP1a + H1mP1a - P1aHH - P1aH1r - P1aH1m - P1aH2 - P1aRP) *h;

    P1b(i+1) = P1b(i) + (RPP1b + H1rP1b + H1mP1b - P1bH1r - P1bH1m - P1bH2 - P1bRP) *h;
    
    H1r(i+1) = H1r(i) + (P1aH1r + P1bH1r + P2H1r + HHH1r - H1rHH - H1rC1 - H1rP1a - H1rP1b - H1rRP) *h;
    
    H1m(i+1) = H1m(i) + (P1aH1m + P1bH1m + P2H1m + HHH1m - H1mHH - H1mC1 - H1mP1a - H1mP1b - H1mRP) *h;
    
    HH(i+1) = HH(i)	+ (P1aHH + H1rHH + H1mHH - HHRP - HHH1r - HHH1m) *h;
    
    P2(i+1) = P2(i)	+ (RPP2 - P2H1r - P2H1m - P2H2 - P2RP) *h;
    
    H2(i+1) = H2(i)	+ (P1aH2 + P1bH2 + P2H2 - H2C1 - H2RP) *h;
    
    C1(i+1) = C1(i)	+ (H1rC1 + H1mC1 + H2C1 - C1RP) *h;
    
%if P2(i+1) < 0
%    P2(i+1) = 0;
%end

CO2eqAFOLU(i) = CO2eqP1a + CO2eqH1r + CO2eqH1m + CO2eqP1b + CO2eqP2 + CO2eqHH;
 end
 
%% VALORES PROMEDIO PARA GRAFICAR CO2
%ValoresPromedio
%CompartimentPlots
%NutrientPlots


%% Función Objetivo

%Z = CO2eq(end);
Z = sum(CO2eq(i));
%Z = CO2eqAFOLU(end);
%Z = sum(CO2eqAFOLU(i));
end