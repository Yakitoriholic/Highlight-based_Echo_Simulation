function mycolor = setColor
mycolorpoint=[[0 0 16];...
    [8 69 99];...
    [57 174 156];...
    [198 243 99];...
    [222 251 123];...
    [239 255 190]];
mycolorposition=[1 11 33 50 57 64];
mycolormap_r=interp1(mycolorposition,mycolorpoint(:,1),1:64,'linear','extrap');
mycolormap_g=interp1(mycolorposition,mycolorpoint(:,2),1:64,'linear','extrap');
mycolormap_b=interp1(mycolorposition,mycolorpoint(:,3),1:64,'linear','extrap');
mycolor=[mycolormap_r',mycolormap_g',mycolormap_b']/255;
mycolor=round(mycolor*10^4)/10^4;%保留4位小数
end