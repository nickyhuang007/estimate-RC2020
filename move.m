function [timer,route,length,pos] = move(p1,p2,v,pos,route,timer,length,dis_map)
    [tem_length,time] = cal_route(dis_map(p1(1,1),p1(1,2),:),dis_map(p2(1,1),p2(1,2),:),v);
    pos = pos + 1;
    route(pos,:) = p2;
    length = length + tem_length;
    timer = timer + time;