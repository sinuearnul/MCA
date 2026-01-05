
VD1(1:240)=vd(1); VD1(241:480)=vd(13);  VD1(481:720)=vd(25);  VD1(721:960)=vd(37);
VD2(1:240)=vd(2); VD2(241:480)=vd(14);  VD2(481:720)=vd(26);  VD2(721:960)=vd(38);
VD3(1:240)=vd(3); VD3(241:480)=vd(15);  VD3(481:720)=vd(27);  VD3(721:960)=vd(39);
VD4(1:240)=vd(4); VD4(241:480)=vd(16);  VD4(481:720)=vd(28);  VD4(721:960)=vd(40);
VD5(1:240)=vd(5); VD5(241:480)=vd(17);  VD5(481:720)=vd(29);  VD5(721:960)=vd(41);
VD6(1:240)=vd(6); VD6(241:480)=vd(18);  VD6(481:720)=vd(30);  VD6(721:960)=vd(42);
VD7(1:240)=vd(7); VD7(241:480)=vd(19);  VD7(481:720)=vd(31);  VD7(721:960)=vd(43);
VD8(1:240)=vd(8); VD8(241:480)=vd(20);  VD8(481:720)=vd(32);  VD8(721:960)=vd(44);
VD9(1:240)=vd(9); VD9(241:480)=vd(21);  VD9(481:720)=vd(33);  VD9(721:960)=vd(45);
VD10(1:240)=vd(10); VD10(241:480)=vd(22);  VD10(481:720)=vd(34);  VD10(721:960)=vd(46);
VD11(1:240)=vd(11); VD11(241:480)=vd(23);  VD11(481:720)=vd(35);  VD11(721:960)=vd(47);
VD12(1:240)=vd(12); VD12(241:480)=vd(24);  VD12(481:720)=vd(36);  VD12(721:960)=vd(48);

VDbase1(1:960) = vd(1);
VDbase2(1:960) = vd(2);
VDbase3(1:960) = vd(3);
VDbase4(1:960) = vd(4);
VDbase5(1:960) = vd(5);
VDbase6(1:960) = vd(6);
VDbase7(1:960) = vd(7);
VDbase8(1:960) = vd(8);
VDbase9(1:960) = vd(9);
VDbase10(1:960) = vd(10);
VDbase11(1:960) = vd(11);
VDbase12(1:960) = vd(12);

figure%('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on

plot(1:960,VD1,'r',1:960,VD2,'b',1:960,VD3,'k',1:960,VD4,'g','LineWidth',4)
plot(1:960,VDbase1,'--',1:960,VDbase2,'--',1:960,VDbase3,'--',1:960,VDbase4,'--')
%title('Producción Agrícola','FontSize', 22, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
%xlabel('Meses','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('% de Producción','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
legend('Cereales','verduras', 'frutas','olegeneososas')
hold off

figure%('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on
plot(1:960,VD5,'r',1:960,VD6,'b',1:960,VD7,'k','LineWidth',4)
plot(1:960,VDbase5,'--',1:960,VDbase6,'--',1:960,VDbase6,'--')
%title('Producción G. Rumiante','FontSize', 22, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
%xlabel('Meses','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('% de Producción','FontSize',16, 'FontName', 'Arial Rounded MT Bold');
legend('Bovino','Leche', 'Ovino')
hold off

figure%('units','normalized','outerposition',[0.05 0.05 0.9 0.9])
hold on
plot(1:960,VD8,'r',1:960,VD9,'b',1:960,VD10,'k',1:960,VD11,'g',1:960,VD12,'m','LineWidth',4)
plot(1:960,VDbase8,'--',1:960,VDbase9,'--',1:960,VDbase10,'--',1:960,VDbase11,'--',1:960,VDbase12,'--')
%title('Producción G. Monogástrico','FontSize', 22, 'FontName', 'Arial Rounded MT Bold', 'FontWeight', 'bold');
%xlabel('Meses','FontSize', 16, 'FontName', 'Arial Rounded MT Bold'); 
ylabel('% de Producción','FontSize', 16, 'FontName', 'Arial Rounded MT Bold');
legend('Aves','Porcino', 'Huevo','Otros','Pescado')
hold off
