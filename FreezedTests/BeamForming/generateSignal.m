function [signal, t] = generateSignal(fc, B, sT, fs, type)
% 根据给定的中心频率、带宽、信号时长和采样率，生成不同类型的信号

t = 0:1/fs:sT; % 时间向量

switch type
    case 1
        % 生成正弦信号
        signal = sin(2*pi*fc*t);
    case 2
        % 生成线性调频信号
        f_inst = fc + B*t;
        signal = cos(2*pi*f_inst.*t);
    case 3
        % 生成双曲调频信号
        signal = cos(2*pi*fc*t + 2*pi*(B/2)*t.^2);
    case 4
        % 生成三角波信号
        signal = sawtooth(2*pi*fc*t, 0.5);
    case 5
        % 生成方波信号
        signal = square(2*pi*fc*t);
    case 6
        % 生成矩形脉冲信号
        signal = pulstran(t, 0:1/fs:sT, 'rectpuls', B);
    otherwise
        error('Invalid signal type');
end
