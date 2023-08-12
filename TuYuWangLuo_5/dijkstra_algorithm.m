function [dist, path] = dijkstra_algorithm(adj_matrix, start_node)
% adj_matrix:�ڽӾ���
% start_node:��ʼ�ڵ�
% dist:��ʼ�ڵ㵽�����ڵ����̾���
% path:��ʼ�ڵ㵽�����ڵ�����·��

n = length(adj_matrix); %�ڵ���
dist = inf(1, n); %�����ڵ����̾����ʼ��Ϊ�����
path = cell(1, n); %�����ڵ�����·����ʼ��Ϊ��

dist(start_node) = 0; %��ʼ�ڵ㵽����ľ���Ϊ0

visited = zeros(1, n); %��ǽڵ��Ƿ񱻷���
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