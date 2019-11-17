clc
clear

%%%%%%%%%%%%%%%%%%%%%  Init Parameter

dis_map = zeros(6,3,2); %记录中心坐标  最后一位记录x,y
dis_map = init_map(dis_map);

TR_route = zeros(200,2);
PR_route = zeros(200,2); %路径
TR_route(1,:) = [1,6];
PR_route(1,:) = [3,1];
pos_TR = 1;   %记录路径指针
pos_PR = 1;

length_TR = 0;
length_PR = 0;

time_node_TR = zeros(200,1);   %记录时间节点
time_node_PR = zeros(200,1);
node_pos_TR = 1;
node_pos_PR = 1;

TR_timer = 0;  %放置尝试球车的Timer
PR_timer = 0;  %踢球传球拿球车的Timer

count_try_ball = 7;  %尝试球计数器

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Set Route

para_route_PR = [3,1 ; 3,3 ; 3,1 ; 3,2 ; 2,2 ; 2,1 ; 2,2 ; 3,2 ; 3,1 ; ...
                       3,3 ; 3,1 ; 3,2 ; 2,2 ; 2,1 ; 2,2 ; 3,2 ; 3,1 ; ...
                       3,3 ; 3,1 ; 3,2 ; 2,2 ; 2,1 ; 2,2 ; 3,2 ; 3,1 ; ...
                       3,3 ; 3,1 ; 3,2 ; 2,2 ; 2,1 ; 2,2 ; 3,2 ; 3,1 ; ...
                       3,3 ; 3,1 ; 3,2 ; 2,2 ; 2,1 ; 2,2 ; 3,2 ; 3,1];
                   
para_route_TR = [1,6 ; 1,5 ; 2,5 ; 3,5 ; 2,5 ; 1,5 ; ...
                       1,4 ; 2,4 ; 3,4 ; 2,4 ; 1,4 ; ...
                       1,3 ; 2,3 ; 3,3 ; 2,3 ; 1,3 ; ...
                       1,2 ; 2,2 ; 3,2 ; 2,2 ; 1,2 ; ...
                       1,2 ; 2,2 ; 3,2 ; 2,2 ; 1,2];

route = zeros(2,200,2);   %总路径
route1 = zeros(2,9,2);    %第一次               

route(1,1:length(para_route_PR),:) = para_route_PR;
route(2,1:length(para_route_TR),:) = para_route_TR;
%1:PR 2:TR
route1(1,:,:) = route(1,1:9,:);
route1(2,1:6,:) = route(2,1:6,:);  %第一次

route2(1,:,:) = route(1,9:17,:);
route2(2,1:6,:) = route(2,6:11,:); %第二次

route3(1,:,:) = route(1,17:25,:);
route3(2,1:6,:) = route(2,11:16,:);%第三次

route4(1,:,:) = route(1,25:33,:);
route4(2,1:6,:) = route(2,16:21,:);%第四次

route5(1,:,:) = route(1,33:41,:);
route5(2,1:6,:) = route(2,21:26,:);%第五次


%%%%%%%%%%%%%%%%%%%%%%   Estimate

[PR_timer,TR_timer,length_PR,length_TR,TR_route,PR_route,time_node_PR,time_node_TR,pos_PR,pos_TR,node_pos_PR,node_pos_TR] ...
= get_one_per(PR_timer,TR_timer,length_PR,length_TR,TR_route,PR_route,time_node_PR,time_node_TR,pos_PR,pos_TR,node_pos_PR,node_pos_TR,route1,dis_map);

[PR_timer,TR_timer,length_PR,length_TR,TR_route,PR_route,time_node_PR,time_node_TR,pos_PR,pos_TR,node_pos_PR,node_pos_TR] ...
= get_one_per(PR_timer,TR_timer,length_PR,length_TR,TR_route,PR_route,time_node_PR,time_node_TR,pos_PR,pos_TR,node_pos_PR,node_pos_TR,route2,dis_map);

[PR_timer,TR_timer,length_PR,length_TR,TR_route,PR_route,time_node_PR,time_node_TR,pos_PR,pos_TR,node_pos_PR,node_pos_TR] ...
= get_one_per(PR_timer,TR_timer,length_PR,length_TR,TR_route,PR_route,time_node_PR,time_node_TR,pos_PR,pos_TR,node_pos_PR,node_pos_TR,route3,dis_map);

[PR_timer,TR_timer,length_PR,length_TR,TR_route,PR_route,time_node_PR,time_node_TR,pos_PR,pos_TR,node_pos_PR,node_pos_TR] ...
= get_one_per(PR_timer,TR_timer,length_PR,length_TR,TR_route,PR_route,time_node_PR,time_node_TR,pos_PR,pos_TR,node_pos_PR,node_pos_TR,route4,dis_map);

[PR_timer,TR_timer,length_PR,length_TR,TR_route,PR_route,time_node_PR,time_node_TR,pos_PR,pos_TR,node_pos_PR,node_pos_TR] ...
= get_one_per(PR_timer,TR_timer,length_PR,length_TR,TR_route,PR_route,time_node_PR,time_node_TR,pos_PR,pos_TR,node_pos_PR,node_pos_TR,route5,dis_map);

