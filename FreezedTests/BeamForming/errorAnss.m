BD = load("BD.mat");
FD = load("FD.mat");
TD = load("TD.mat");
angles = -90:10:90; % 角度范围 -90° 到 90°
error = (TD.beamformed_signals_time_domain - BD.beamformed_signals_time_domain);
figure;
plot(TD.t_total, (error).'+angles);

% 计算相关系数
R = zeros(1, size(BD.beamformed_signals_time_domain,1));
for icol = 1: size(BD.beamformed_signals_time_domain,1)
    R1 = corrcoef(FD.beamformed_signals_time_domain(icol,:), BD.beamformed_signals_time_domain(icol,:));
    % R(icol) = max(xcorr(FD.beamformed_signals_time_domain(icol,:), BD.beamformed_signals_time_domain(icol,:), 'coeff'));
    R(icol) = sum(FD.beamformed_signals_time_domain(icol,:).* BD.beamformed_signals_time_domain(icol,:))/...
        sqrt((sum(FD.beamformed_signals_time_domain(icol,:).^2)*sum(BD.beamformed_signals_time_domain(icol,:).^2)));
end

% 输出相关系数矩阵
disp(R);
figure;
plot(angles, R, 'b--',LineWidth=1.5)
hold on;
plot(angles, ones(size(angles)), 'r', LineWidth=1.5)
ylim([0.9 1.01])
legend('计算相关度', '理想值')
xlabel('波束角度')
ylabel('相关度')