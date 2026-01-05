
% MACROMOLECULAS
figure('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on

subplot(2,2,1)
%set(gca,'fontsize',18)
plot(year,prote_disp_pcp,year,prote_minp,year,prote_maxp,[2021 2100],[prote_rec prote_rec],'k--','LineWidth',2);
title('Proteina','FontSize', 22, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Time','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Mass','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%legend('Caso estable','Caso en estudio');
%axis([0 600 0 1.6])
set(gca, 'fontsize', 15);
grid;

subplot(2,2,2)
%set(gca,'fontsize',18)
plot(year,carbo_disp_pcp,year,carbo_minp,year,carbo_maxp,[2021 2100],[carbo_rec carbo_rec],'k--','LineWidth',2);
title('Carbohidratos','FontSize', 22, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Time','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Mass','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%legend('Caso estable','Caso en estudio');
%axis([0 600 0 1.6])
set(gca, 'fontsize', 15);
grid;

subplot(2,2,3)
%set(gca,'fontsize',18)
plot(year,lipi_disp_pcp,year,lipi_minp,year,lipi_maxp,[2021 2100],[lipi_rec lipi_rec],'k--','LineWidth',2);
title('Lipidos','FontSize', 22, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Time','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Mass','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%legend('Caso estable','Caso en estudio');
%axis([0 600 0 1.6])
set(gca, 'fontsize', 15);
grid;

subplot(2,2,4)
%set(gca,'fontsize',18)
plot(year,kcal_disp_pcp,year,kcal_minp,year,kcal_maxp,[2021 2100],[kcal_rec kcal_rec],'k--','LineWidth',2);
title('Kcal','FontSize', 22, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
xlabel('Time','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('Mass','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
%legend('Caso estable','Caso en estudio');
%axis([0 600 0 1.6])
set(gca, 'fontsize', 15);
grid;

hold off