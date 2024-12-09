% 参数设置
fs = 3000; % 采样率 3kHz
f = 750; % 信号频率 750Hz
c = 1500; % 声速 1500 m/s
d = 1; % 阵元间距（10m长的线阵，共10个元素）
theta = 30; % 信号入射角度 30°
N = 10; % 阵元数量
T_signal = 0.1; % 信号时长
T_total = 2.1; % 总时长（包括补零）
angles = -90:10:90; % 角度范围 -90° 到 90°
P_r = [(0:(N-1))*d; zeros(1,N); zeros(1,N)]; % 阵列三维坐标

% 生成信号
t = 0:1/fs:T_signal-1/fs; % 信号时间向量
signal = sin(2*pi*f*t); % 正弦信号
signal_padded = [zeros(1,fs), signal, zeros(1,fs)]; % 补零

% 仿真阵元域数据
t_total = 0:1/fs:T_total-1/fs; % 总时间向量
L = length(t_total);
fft_len = 2^nextpow2(L); % FFT长度
element_signals = zeros(N, length(t_total)); % 初始化阵元信号矩阵
for i = 1:N
    delay = -(i-1)*d*sind(theta)/c; % 计算时延
    delay_samples = round(delay * fs); % 时延转换为样本数
    element_signals(i,:) = apply_delay(signal_padded, delay_samples);
end
figure;
plot(t_total, element_signals'+(0:N-1)*2);

% 时延波束形成
beamformed_signals_time_domain = zeros(length(angles), L); % 初始化时域波束形成信号矩阵
phi = 0; % 俯仰角
fk = (0:fft_len-1).'/fft_len *fs;
for a = 1:length(angles)
    theta = angles(a);
    % beamformed_signal_time_domain = zeros(1, L);

    ksc = 2* pi* fk/ c;
    pve_B = beamscp(ksc, P_r, theta, phi);
    % delay = (i-1)*d*sind(theta)/c; % 计算时延
    % delay_samples = round(delay * fs); % 时延转换为样本数
    % element_signal = apply_delay(element_signals(i,:), delay_samples);
    element_signal_fft = fft(element_signals, fft_len, 2); % 计算FFT
    beamformed_signal_freq_domain = sum(conj(pve_B) .* element_signal_fft,1);

    beamformed_signal_time_domain = real(ifft(beamformed_signal_freq_domain, fft_len, 2, 'symmetric')); % 计算IFFT
    beamformed_signals_time_domain(a,:) = beamformed_signal_time_domain(1:L); % 截取有效部分
end

% 输出波束域数据
figure;
plot(t_total, (beamformed_signals_time_domain).'+angles);
xlabel('Time (s)');
ylabel('Amplitude');
title('Time-domain Beamformed Signal');
save('FD.mat', 't_total', 'beamformed_signals_time_domain');