
time_years = floor(time/tp);

for k=1:time_years 
 year(k) = k + 2020;
end
 
for k=1:time_years 
    CO2eqp(k) = mean(CO2eq(1+(tp*(k-1)):tp*k));
end 


for k=1:time_years 
    CO2eqAFOLUp(k) = mean(CO2eqAFOLU(1+(tp*(k-1)):tp*k));
end

for k=1:time_years 
    atempp(k) = mean(atemp(1+(tp*(k-1)):tp*k));
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
