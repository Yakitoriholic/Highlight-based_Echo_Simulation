function pve_B = beamscp(ksc, P_r, theta, phi)
%该函数输入为波数、阵元位置、入射方向角，输出方向响应向量
v_s = - [cosd(phi)* sind(theta), cosd(phi)* cosd(theta), ones(length(theta),1)*sind(phi)].';
kve = v_s*ksc.';
pve_B = exp(-1j * kve.' * P_r).';
end
