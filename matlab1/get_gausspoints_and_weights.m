function [gausspoints, gaussweights] = get_gausspoints_and_weights(degree)
if degree == 2
    gausspoints = [1/6, 1/6;...
                   2/3, 1/6;...
                   1/6, 2/3];
    gaussweights = [1/3 1/3 1/3];
else
    error(['cannot do quadrature for the desired degree: ' num2str(degree)]);
end
end