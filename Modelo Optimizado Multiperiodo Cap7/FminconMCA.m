clear all
clc
pa=0.05 ;
%pa=0.10 ;
multiperiodo = 1;

%% Para comparar resultados
%CasoEstablePromedio
time = 12*80;
tp = 12; 
time_years = floor(time/tp);

%% Uso de Fmincon para optimizar

%% Opciones
% optimset nos permite configurar opciones de la optimización
options = optimset;

options = optimset(options,'Display', 'iter');     % Activa que se muestre en la pantalla de comandos las iteraciones
options = optimset(options,'MaxFunEvals', 5000);   % Pone un límite en la cantidad de veces que se evalua (corre) la función. 
                                                   % Cada iteración requiere evaluar varias veces la función
options = optimset(options,'MaxIter', 2000);        % Pone un limite en las iteraciones
options = optimset(options,'TolFun', 1e-15);       % Tolerancia en la función. El código no para hasta que no alcanza este 
                                                   % grado de exactitud, lo cual puede hacer que se tarde mucho
options = optimset(options,'TolX', 1e-15);         % Similar al previo, pero con las variables de decisión
options = optimset(options,'Diagnostics', 'on');   % Activa una diagnóstico del problema para fines informativos
%options = optimset(options, 'Algorithm', 'sqp');

%% fmincon se utliza para optimizar. Tú usa el siguiente comando:

%      CerTub	Ver     Fru     Ole     Bov     Lec     Ovi     Ave     Por     Hue     OtrGan  Pes
vd = [0.3841  0.2462  0.2978  0.0719  0.0714  0.9126  0.0160  0.2705  0.2184  0.1842  0.0127  0.3142 ... %periodo 1
      0.3841  0.2462  0.2978  0.0719  0.0714  0.9126  0.0160  0.2705  0.2184  0.1842  0.0127  0.3142 ... %periodo 2
      0.3841  0.2462  0.2978  0.0719  0.0714  0.9126  0.0160  0.2705  0.2184  0.1842  0.0127  0.3142 ... %periodo 3
      0.3841  0.2462  0.2978  0.0719  0.0714  0.9126  0.0160  0.2705  0.2184  0.1842  0.0127  0.3142];   %periodo 4
 
%% Multi periodo

if multiperiodo == 0
%A = [];
MatrizAmono    
end

if multiperiodo == 1
MatrizA  
end

%b = []; 
Matrizb
       
  
Aeq = [1  1  1	1	0	0	0	0	0	0	0	0 ... %P1a Periodo 1
       0  0	 0	0	0	0	0   0	0	0	0	0 ... 
       0  0	 0	0	0	0	0   0	0	0	0	0 ...
       0  0	 0	0	0	0	0   0	0	0	0	0;
       
       0  0  0	0	0	0	0	0	0	0	0	0 ... %P1a Periodo 2
       1  1	 1	1	0	0	0   0	0	0	0	0 ...
       0  0	 0	0	0	0	0   0	0	0	0	0 ...
       0  0	 0	0	0	0	0   0	0	0	0	0;
       
       0  0  0	0	0	0	0	0	0	0	0	0 ... %P1a Periodo 3
       0  0	 0	0	0	0	0   0	0	0	0	0 ...
       1  1	 1	1	0	0	0   0	0	0	0	0 ...
       0  0	 0	0	0	0	0   0	0	0	0	0;
       
       0  0  0	0	0	0	0	0	0	0	0	0 ... %P1a Periodo 4
       0  0	 0	0	0	0	0   0	0	0	0	0 ...
       0  0	 0	0	0	0	0   0	0	0	0	0 ...
       1  1	 1	1	0	0	0   0	0	0	0	0;
           
       0  0  0	0 	1	1	1	0	0	0	0	0 ... %H1r Periodo 1
       0  0	 0	0	0	0	0   0	0	0	0	0 ...
       0  0	 0	0	0	0	0   0	0	0	0	0 ...
       0  0	 0	0	0	0	0   0	0	0	0	0;
       
       0  0	 0	0	0	0	0   0	0	0	0	0 ... %H1r Periodo 2
       0  0  0	0 	1	1	1	0	0	0	0	0 ...
       0  0	 0	0	0	0	0   0	0	0	0	0 ...       
       0  0	 0	0	0	0	0   0	0	0	0	0;
       
       0  0	 0	0	0	0	0   0	0	0	0	0 ... %H1r Periodo 3
       0  0	 0	0	0	0	0   0	0	0	0	0 ...   
       0  0  0	0 	1	1	1	0	0	0	0	0 ...
       0  0	 0	0	0	0	0   0	0	0	0	0;
       
       0  0	 0	0	0	0	0   0	0	0	0	0 ... %H1r Periodo 4
       0  0	 0	0	0	0	0   0	0	0	0	0 ...
       0  0	 0	0	0	0	0   0	0	0	0	0 ...       
       0  0  0	0 	1	1	1	0	0	0	0	0;       
       
       0  0	 0	0	0	0	0	1	1	1	1	1 ... %H1m Periodo 1
       0  0	 0	0	0	0	0   0	0	0	0	0 ...
       0  0	 0	0	0	0	0   0	0	0	0	0 ...
       0  0	 0	0	0	0	0   0	0	0	0	0;
       
       0  0	 0	0	0	0	0   0	0	0	0	0 ... %H1m Periodo 2
       0  0	 0	0	0	0	0	1	1	1	1	1 ...       
       0  0	 0	0	0	0	0   0	0	0	0	0 ...
       0  0	 0	0	0	0	0   0	0	0	0	0;      
       
       0  0	 0	0	0	0	0   0	0	0	0	0 ... %H1m Periodo 3
       0  0	 0	0	0	0	0   0	0	0	0	0 ...
       0  0	 0	0	0	0	0	1	1	1	1	1 ...      
       0  0	 0	0	0	0	0   0	0	0	0	0;
       
       0  0	 0	0	0	0	0   0	0	0	0	0 ... %H1m Periodo 4
       0  0	 0	0	0	0	0   0	0	0	0	0 ...
       0  0	 0	0	0	0	0   0	0	0	0	0 ...       
       0  0	 0	0	0	0	0	1	1	1	1	1];
       
   
beq = [1  1  1  1  1  1  1  1  1  1  1  1]';


%Limites Inf y Sup con +-50%
%lb = [0.1920  0.1231  0.1489  0.0359  0.0357  0.4563  0.0080  0.1353  0.1092  0.0921  0.0064  0.1571];
%ub = [0.5761  0.3693  0.4467  0.1078  0.1071  1.3689  0.0240  0.4058  0.3276  0.2762  0.0191  0.4714];

lb = [0 0 0 0 0 0 0 0 0 0 0 0 ...
      0 0 0 0 0 0 0 0 0 0 0 0 ...
      0 0 0 0 0 0 0 0 0 0 0 0 ...
      0 0 0 0 0 0 0 0 0 0 0 0];

ub = [1 1 1 1 1 1 1 1 1 1 1 1 ...
      1 1 1 1 1 1 1 1 1 1 1 1 ...
      1 1 1 1 1 1 1 1 1 1 1 1 ...
      1 1 1 1 1 1 1 1 1 1 1 1];

nonlcon = [];

%[vdopt,Z] = fmincon(@FMCA,vd,A,b,Aeq,beq,lb,ub,nonlcon,options);
[vdopt,Z] = fmincon(@FMCA,vd,A,b,Aeq,beq,lb,ub,nonlcon,options);
% vdopt = fmincon(@nombre de la FO, valor conocido o no conocido(0), [resticciones (lado iz de desigualdad)] , [resticciones (lado der de desigualdad)],  des %solo esos 4 para función más básica 
% vdopt = fmincon(@FLV, 1.2,[],[]);


% vd es el valor de la variable de decision que la computadora establezca en cada iteración
% Z será el valor de la función en cada iteración
% @Funcion es tu funcion a optimizar
% vd0 o a es el valor inicial de tu variable de decisión
% [] los ponemos así, ya que esos argumentos son para las restricciones, mismas que ahorita no tenemos
% lb y up son limites para la variable de decisión
% options activa las opciones descritas arriba

%% Prueba

%FMCAprueba2


%% Graficas

%ValoresPromedio
%CompartimentPlots
%NutrientPlots
%PlotArticuloCap7
%DVPlots