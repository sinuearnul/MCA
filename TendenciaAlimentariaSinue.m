%% CONTROL DISPONIBILIDAD ALIMENTARIA

%convecion de unidades
g_a_milloneston = 0.000000000001; %gramos a millones de toneladas
diano = 365;  %año a días

%% CONSUMO ACTUAL en millones de toneladas / año

%        P1a      H1r    H1m
consHH = [3054.27 992.14 518.86];

%% PROPIEDADES NUTRICIONALES XiHH (%) g/100g de producto



%%
%*********************************************************************************
%
%Produccion Alimentaria Mundial 2022 (Millones de Ton)
%Cosumo anual de productos por HH (Gt)
%P1a
CeTu = 1173;
Ver = 752.06;
Fru = 909.6;
Ole = 219.5;
%H1r
Bov = 72;
Lec = 920.1;
Ovi = 16.1;
%H1m
Ave = 136;
Por = 109.8;
Hue = 92.6;
OtrGan = 6.4;
Pes = 158;

%Cosumo TOTAL por compartimento
ProducP1a = CeTu + Ver + Fru + Ole;
ProducH1r = Bov + Lec + Ovi;
ProducH1m = Ave + Por + Hue + OtrGan + Pes;

%Porcentaje de Consumo por compartimento
%P1a
pcCeTu = CeTu/ProducP1a;
pcVer = Ver/ProducP1a;
pcFru = Fru/ProducP1a;
pcOle = Ole/ProducP1a;
pcP1a = [pcCeTu pcVer pcFru pcOle];
%H1r
pcBov = Bov/ProducH1r;
pcLec = Lec/ProducH1r;
pcOvi = Ovi/ProducH1r;
pcH1r = [pcBov pcLec pcOvi];
%H1m
pcAve = Ave/ProducH1m;
pcPor = Por/ProducH1m;
pcHue = Hue/ProducH1m;
pcOtrGan = OtrGan/ProducH1m;
pcPes = Pes/ProducH1m;
pcH1m = [pcAve pcPor pcHue pcOtrGan pcPes];
%}

%       [Pro Car Lip Kc]
ANP1a = [6	87	1.1	378; %CeTu
        2.9	13	0.2	65;  %Ver
        1	6	0.2	25;  %Fru
        16	21	57	607];%Ole

ANH1r = [26	0	12	215; %Bov
        3.4	5	1	42;  %Lec
        25	0	21	294];%Ovi

ANH1m = [27	0	14	239; %Ave
        27	0	14	242; %Por
        13	1.1	11	155; %Hue
        26	7	19	200; %OtrGan
        22	0	12	206];%Pes

pcNP1a = pcP1a*ANP1a;
pcNH1r = pcH1r*ANH1r;
pcNH1m = pcH1m*ANH1m;

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


%*********************************************************************************
%%

%{
%P1a
P1aprote = 0.044663679052492; 
P1acarbo = 0.399105473034518;
P1alipi = 0.046285768217296;
P1akcal = 2.122573090860830;			

%H1r
H1rprote = 0.050400862026422;
H1rcarbo = 0.046371490702119;
H1rlipi = 0.017982720455338;
H1rkcal = 0.545546421706679;

%H1m
H1mprote = 0.229086035682725;
H1mcarbo = 0.002764119060438;
H1mlipi = 0.131315935334447;
H1mkcal = 2.158294731062540;

XiHH = [P1aprote P1acarbo P1alipi P1akcal;
        H1rprote H1rcarbo H1rlipi H1rkcal;
        H1mprote H1mcarbo H1mlipi H1mkcal];
%}

%% APORTACIÓN ACTUAL DE MACRONUTRIENTES EN MILLONES DE TON / AÑO
%apor = XiHH.*consHH';
%apor = consHH'.*XiHH;

for ii=1:3
    
   apor(ii,:)= XiHH(ii,:)*consHH(ii); 
    
end

suma_apor = sum(apor);

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
