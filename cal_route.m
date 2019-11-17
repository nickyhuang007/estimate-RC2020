function [length,time] = cal_route(p1,p2,v)
    length = abs((p1(1) - p2(1))) + abs((p1(2) - p2(2)));
%    length = sqrt((p1(1) - p2(1))^2 + (p1(2) - p2(2))^2);     %可以走斜线
    time = length / v;