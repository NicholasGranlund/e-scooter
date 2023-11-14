close all;
clear all;
clc;

% Define the masses
m = [5, 10, 15, 20, 25];
figure()

for k=1:length(m)
    l = 5;
    m_add = m(k);
    x_min = 0.1079;
    y_min = 0.17;

    x_add = linspace(x_min, 0.68, l);
    y_add = linspace(y_min, 1.1065, l);
    Com = zeros(2, length(x_add)*length(y_add));
    
    for i=1:length(x_add)
        for j=1:length(y_add)
             [x_com, y_com] = get_com(m_add, x_add(i), y_add(j));
             Com(1,j + (length(y_add)*(i-1))) = x_com;
             Com(2,j + (length(y_add)*(i-1))) = y_com;
        end
    end
   
    % Get Original CoM
    [x_com, y_com] = get_com(0,0,0);
    
    % Add the set of com
    subplot(2,3,k)
    hold on; grid on
    scatter(Com(1,:), Com(2,:), 20, 'filled')
    scatter(x_com, y_com, 50, 'filled')
    
    % Add the sketch of the bike
    plot([0, 0.88], [0, 0], 'k','LineWidth', 10)
    plot([0.88, 0.68], [0, 1.1065], 'k', 'LineWidth', 10)
    back_wheel = nsidedpoly(1000, 'Center', [0, 0], 'Radius', 0.1079);
    front_wheel = nsidedpoly(1000, 'Center', [0.88, 0], 'Radius', 0.1079);
    plot(back_wheel, 'FaceColor', 'k')
    plot(front_wheel, 'FaceColor', 'k')
    control_box = [0.4 0 ;
                   0.4 0.23; 
                   0.7 0.23; 
                   0.7 0] ;
    patch(control_box(:,1),control_box(:,2),'y', 'EdgeColor','k')
    axis equal

    % Add the bounding box
    plot([x_min, x_min, 0.68, 0.68, x_min], [y_min, 1.1065, 1.1065, y_min, y_min], 'k:','LineWidth', 2)
    
    % add plot details
    legend('Feasible CoM pos','Actual CoM pos')
    xlabel('x [m]'); ylabel('y [m]')
    title(sprintf('Possible CoM by adding %g kg', m_add));
    xlim([-0.2, 1])
    ylim([-0.2, 1.3068])

end
