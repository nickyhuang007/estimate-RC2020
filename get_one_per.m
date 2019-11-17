function [PR_timer,TR_timer,length_PR,length_TR,TR_route,PR_route,time_node_PR,time_node_TR,pos_PR,pos_TR,node_pos_PR,node_pos_TR] ...
= get_one_per(PR_timer,TR_timer,length_PR,length_TR,TR_route,PR_route,time_node_PR,time_node_TR,pos_PR,pos_TR,node_pos_PR,node_pos_TR,route,dis_map)
    
%%%%%%%%%%%%%%%%%%%%第一步：TR、PR到达交接传球位置
    
    PR_timer = PR_timer + 1;  %拿球时间1s
%    count_try_ball = count_try_ball - 1;
    
%[PR_timer,PR_route,length_PR,pos_PR] = move([3,1],[3,3],1000,pos_PR,PR_route,PR_timer,length_PR,dis_map);
    [PR_timer,PR_route,length_PR,pos_PR] = move(route(1,1,:),route(1,2,:),1000,pos_PR,PR_route,PR_timer,length_PR,dis_map);
    
    [TR_timer,TR_route,length_TR,pos_TR] = move(route(2,1,:),route(2,2,:),1000,pos_TR,TR_route,TR_timer,length_TR,dis_map);
    
    TR_timer = TR_timer + 1;
    PR_timer = PR_timer + 1;  %传球
    
    time_node_TR(node_pos_TR) = TR_timer;
    time_node_PR(node_pos_PR) = PR_timer;
    node_pos_TR = node_pos_TR + 1;
    node_pos_PR = node_pos_PR + 1;
    
    
    if(PR_timer > TR_timer) %等待就位
        TR_timer = PR_timer;
    else
        PR_timer = TR_timer;
    end
    
%%%%%%%%%%%%%%%%%%第二步：PR回基地，TR去放球

    [PR_timer,PR_route,length_PR,pos_PR] = move(route(1,2,:),route(1,3,:),1000,pos_PR,PR_route,PR_timer,length_PR,dis_map);

    [TR_timer,TR_route,length_TR,pos_TR] = move(route(2,2,:),route(2,3,:),1000,pos_TR,TR_route,TR_timer,length_TR,dis_map);
    [TR_timer,TR_route,length_TR,pos_TR] = move(route(2,3,:),route(2,4,:),1000,pos_TR,TR_route,TR_timer,length_TR,dis_map);
    
    TR_timer = TR_timer + 1;  %TR_放球时间
    
    time_node_TR(node_pos_TR) = TR_timer;
    time_node_PR(node_pos_PR) = PR_timer;
    node_pos_TR = node_pos_TR + 1;
    node_pos_PR = node_pos_PR + 1;    
    
    if(PR_timer > TR_timer) %等待就位
        TR_timer = PR_timer;
    else
        PR_timer = TR_timer;
    end    
    
%%%%%%%%%%%%%%%%%%%%第三步：TR回接收区，PR去踢球,踢完回去拿球    
    PR_timer = PR_timer + 2;  %设置球到PR上
    [PR_timer,PR_route,length_PR,pos_PR] = move(route(1,3,:),route(1,4,:),1000,pos_PR,PR_route,PR_timer,length_PR,dis_map);
    [PR_timer,PR_route,length_PR,pos_PR] = move(route(1,4,:),route(1,5,:),1000,pos_PR,PR_route,PR_timer,length_PR,dis_map);
    [PR_timer,PR_route,length_PR,pos_PR] = move(route(1,5,:),route(1,6,:),1000,pos_PR,PR_route,PR_timer,length_PR,dis_map);
    
    [TR_timer,TR_route,length_TR,pos_TR] = move(route(2,4,:),route(2,5,:),1000,pos_TR,TR_route,TR_timer,length_TR,dis_map);
    [TR_timer,TR_route,length_TR,pos_TR] = move(route(2,5,:),route(2,6,:),1000,pos_TR,TR_route,TR_timer,length_TR,dis_map);
    
    PR_timer = PR_timer + 2;  %踢球
    
    [PR_timer,PR_route,length_PR,pos_PR] = move(route(1,6,:),route(1,7,:),1000,pos_PR,PR_route,PR_timer,length_PR,dis_map);
    [PR_timer,PR_route,length_PR,pos_PR] = move(route(1,7,:),route(1,8,:),1000,pos_PR,PR_route,PR_timer,length_PR,dis_map);
    [PR_timer,PR_route,length_PR,pos_PR] = move(route(1,8,:),route(1,9,:),1000,pos_PR,PR_route,PR_timer,length_PR,dis_map);
    
    time_node_TR(node_pos_TR) = TR_timer;
    time_node_PR(node_pos_PR) = PR_timer;
    node_pos_TR = node_pos_TR + 1;
    node_pos_PR = node_pos_PR + 1;
    
    if(PR_timer > TR_timer) %等待就位
        TR_timer = PR_timer;
    else
        PR_timer = TR_timer;
    end        
    
    
    
    
%%%%%%%%%%%每次取一个球情况完成 