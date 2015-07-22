function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.
%
% Note: This was slightly modified such that it expects y = 1 or y = 0

% Find Indices of Positive and Negative Examples
pos = find(y == 1); neg = find(y == 0);

% Plot Examples
if size(X,2) >= 3
    figure
    scatter3(X(pos, 1), X(pos, 2),X(pos,3),'fill')
    hold on;
    scatter3(X(neg, 1), X(neg, 2),X(neg,3),'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75])
    hold off;
elseif size(X,2) == 2
        scatter(X(pos, 1), X(pos, 2),'fill')
        hold on;
        scatter(X(neg, 1), X(neg, 2),'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75])
        hold off;
else 
     plot(X(pos),'--rs')
     hold on;
     plot(X(neg),'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75])
     hold off;
end


end
