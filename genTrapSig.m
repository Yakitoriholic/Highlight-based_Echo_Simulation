function a = genTrapSig(Am,t,width,rise_time,fall_time)

 %Am 幅度
 %t 时间
 %width脉冲宽度
 %rise time上升时间
 %fall time下降时间
a = zeros(size(t));
%生成梯形脉冲
for i = 1:length(t)
    if t(i) >= 0 && t(i) < rise_time
        a(i) = Am * t(i) / rise_time;
    elseif t(i) >= rise_time && t(i) < rise_time + width
        a(i) = Am;
    elseif t(i) >= rise_time + width && t(i) < rise_time + width + fall_time
        a(i) = Am - Am * (t(i) - (rise_time + width))/fall_time;
    end
end

end