%% Clear windows and start timing
clc; clear; close all; addpath(genpath('./helpers/')); tic;

%% Constants for the problem
matrix = load('data/p067_matrix.txt');
N = size(matrix,1);

%% Dijkstra's algorithm

% Output formatting
fprintf("Dijkstra's algorithm: ");
lineCount = 0;

% 1. Mark all nodes unvisited. Create a set of all the unvisited nodes
% called the unvisited set.
visited = zeros(size(matrix));

% 2. Assign to every node a tentative distance value: set it to zero for
% our initial node and to -infinity for all other nodes. Set the initial
% node as current.
tentative_distance = -inf .* ones(size(matrix));
tentative_distance(1,1) = matrix(1,1);
current_node = [1,1];

while (true)
        
    % Print progress
    fprintf(1, repmat('\b', 1, lineCount)); %delete line before
    lineCount = fprintf(['visiting node (%d,%d). Progress: %d/%d %s %.2f%%\n'], ...
        current_node(1), current_node(2), sum(visited(:)), ...
        N*(N-1)/2+N, char(8776), sum(visited(:))/(N*(N-1)/2+N)*100);
    
    % 3. For the current node, consider all of its unvisited neighbors and
    % calculate their tentative distances through the current node. Compare
    % the newly calculated tentative distance to the current assigned value
    % and assign the larger one. For example, if the current node A is marked
    % with a distance of 6, and the edge connecting it with a neighbor B has
    % length 2, then the distance to B through A will be 6 + 2 = 8. If B was
    % previously marked with a distance smaller than 8 then change it to 8.
    % Otherwise, keep the current value.
    neighbours = [
        current_node(1)+1, current_node(2);
        current_node(1)+1, current_node(2)+1;
        ]';
    
    for n = neighbours
        
        % Outside matrix
        if any(n < 1) || any(n > N)
            continue;
        end
        
        % Already visited
        if (visited(n(1), n(2)))
            continue;
        end
        
        % Update tentative distance
        distance = tentative_distance(current_node(1), current_node(2)) + matrix(n(1), n(2));
        if (tentative_distance(n(1), n(2)) < distance)
            tentative_distance(n(1), n(2)) = distance;
        end
        
    end
    
    % 4. When we are done considering all of the unvisited neighbors of the
    % current node, mark the current node as visited and remove it from the
    % unvisited set. A visited node will never be checked again.
    visited(current_node(1), current_node(2)) = 1;
    
    % 5. If all destination nodes has been marked visited, then stop.
    if all(visited(end, :))
        break;
    end
    
    % 6. Otherwise, select the unvisited node that is marked with the
    % largest tentative distance, set it as the new "current node", and go
    % back to step 3.
    if (current_node(2) < current_node(1))
        current_node(2) = current_node(2) + 1;
    else
        current_node(1) = current_node(1) + 1;
        current_node(2) = 1;
    end
    %[~, index] = max(tentative_distance(:) - visited(:) * sum(matrix(:)));
    %[i, j] = ind2sub(size(matrix), index);
    %current_node = [i, j];
    
end

% Print progress
fprintf(1, repmat('\b', 1, lineCount)); %delete line before
lineCount = fprintf(['visiting node (%d,%d). Progress: %d/%d %s %.2f%%\n'], ...
    current_node(1), current_node(2), sum(visited(:)), ...
    N*(N-1)/2+N, char(8776), sum(visited(:))/(N*(N-1)/2+N)*100);

% Solution is stored at last node
s = max(tentative_distance(end, :));

%% Print result
time = toc;
formatSpec = 'Project Euler no.81 = %d.\nIt took %f seconds.\n';
fprintf(formatSpec,s,time)
