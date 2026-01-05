%load ('CasoEstable','CO2','CO2eq','temp','P1a','P1b','P2','H1r','H1m','H2','HH','C1','RP','pob_mund')
load ('CasoSinOpt','CO2','CO2eq','temp','P1a','P1b','P2','H1r','H1m','H2','HH','C1','RP','pob_mund')

%% VALORES PROMEDIO PARA GRAFICAR CO2
%

time = 12*80;
tp = 12; 
time_years = floor(time/tp);

for k=1:time_years 
 year(k) = k + 2020;
end
 
 
for k=1:time_years 
    CO2pSC(k) = mean(CO2(1+(tp*(k-1)):tp*k));
end
 
for k=1:time_years 
    CO2eqpSC(k) = mean(CO2eq(1+(tp*(k-1)):tp*k));
end 
 
for k=1:time_years 
    temppSC(k) = mean(temp(1+(tp*(k-1)):tp*k));
end  

for k=1:time_years 
    P1apSC(k) = mean(P1a(1+(tp*(k-1)):tp*k));
end  

for k=1:time_years 
    P1bpSC(k) = mean(P1b(1+(tp*(k-1)):tp*k));
end  

for k=1:time_years 
    P2pSC(k) = mean(P2(1+(tp*(k-1)):tp*k));
end  

for k=1:time_years 
    H1rpSC(k) = mean(H1r(1+(tp*(k-1)):tp*k));
end  

for k=1:time_years 
    H1mpSC(k) = mean(H1m(1+(tp*(k-1)):tp*k));
end  

for k=1:time_years 
    H2pSC(k) = mean(H2(1+(tp*(k-1)):tp*k));
end  

for k=1:time_years 
    HHpSC(k) = mean(HH(1+(tp*(k-1)):tp*k));
end  

for k=1:time_years 
    C1pSC(k) = mean(C1(1+(tp*(k-1)):tp*k));
end  

for k=1:time_years 
    RPpSC(k) = mean(RP(1+(tp*(k-1)):tp*k));
end  

for k=1:time_years 
    pob_mundpSC(k) = mean(pob_mund(1+(tp*(k-1)):tp*k));
end

clear 'CO2' 'CO2eq' 'temp' 'P1a' 'P1b' 'P2' 'H1r' 'H1m' 'H2' 'HH' 'C1' 'RP' 'pob_mund'