function helpViewEveryPart(input,t,range)
figure
subplot(3,2,1);
plot(t,real(input(1,:)));xlabel('t/s');ylabel('幅度/V');grid on;
title('艇艏');axis(range);

subplot(3,2,2);
plot(t,real(input(2,:)));xlabel('t/s');ylabel('幅度/V');grid on;
title('前艇体');axis(range);


subplot(3,2,3);
plot(t,real(input(3,:)));xlabel('t/s');ylabel('幅度/V');grid on;
title('舰桥');axis(range);


subplot(3,2,4);
plot(t,real(input(4,:)));xlabel('t/s');ylabel('幅度/V');grid on;
title('艇舯');axis(range);


subplot(3,2,5);
plot(t,real(input(5,:)));xlabel('t/s');ylabel('幅度/V');grid on;
title('后艇体');axis(range);


subplot(3,2,6);
plot(t,real(input(6,:)));xlabel('t/s');ylabel('幅度/V');grid on;
title('艇艉');axis(range);

end