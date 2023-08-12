function [dist, path] = dijkstra_algorithm(adj_matrix, start_node)
% adj_matrix:邻接矩阵
% start_node:起始节点
% dist:起始节点到其他节点的最短距离
% path:起始节点到其他节点的最短路径

n = length(adj_matrix); %节点数
dist = inf(1, n); %到各节点的最短距离初始化为无穷大
path = cell(1, n); %到各节点的最短路径初始化为空

dist(start_node) = 0; %起始节点到自身的距离为0

visited = zeros(1, n); %标记节点是否被访问
for i = 1:n
    min_dist = inf;
    min_node = -1;
    for j = 1:n
        if ~visited(j) && dist(j) < min_dist
            min_dist = dist(j);
            min_node = j;
        end
    end
    if min_node == -1
        break;
    end
    visited(min_node) = 1;
    for j = 1:n
        if adj_matrix(min_node, j) > 0 && ~visited(j)
            new_dist = dist(min_node) + adj_matrix(min_node, j);
            if new_dist < dist(j)
                dist(j) = new_dist;
                path{j} = [path{min_node}, min_node];
            end
        end
    end
end
% adj_matrix = [0,1,4,0,0;1,0,2,5,0;4,2,0,1,3;0,5,1,0,2;0,0,3,2,0];
% start_node=1;end_node=5;
% [dist,path]=dijkstra_algorithm(adj_matrix,start_node);
% shortest_path=[path{end_node},end_node];
% shortest_dist=dist(end_node);