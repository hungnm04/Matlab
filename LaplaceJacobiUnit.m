function LaplaceJacobiUnit(N, M, epsilon)
    % Check if the input arguments are provided; if not, use default values
    if nargin < 1
        N = 100;
    end
    if nargin < 2
        M = 100;
    end
    if nargin < 3
        epsilon = 0.001;
    end

    % Define the grid
    x = linspace(0, 100, N);
    y = linspace(0, 100, M);
    [X, Y] = meshgrid(x, y);

    % True analytical solution u(x, y) = 100 - x
    u_true = 100 - X;

    % Plot the true analytical solution using contourf
    figure;
    contourf(Y, X, u_true', 'EdgeColor', 'none');
    colorbar;
    title('True Analytical Solution (u(x, y) = 100 - x)');
    xlabel('x');
    ylabel('y');
end
