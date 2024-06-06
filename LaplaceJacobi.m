function LaplaceJacobi(N, M, epsilon)
    % Check if the nargin(input arguments) are provided; if not, use default values
    if nargin < 1
        N = 100;   % Number of grid points in the x-direction
    end
    if nargin < 2
        M = 100;   % Number of grid points in the y-direction
    end
    if nargin < 3
        epsilon = 1e-3;   % Convergence tolerance
    end

    iter = 0;

    % Initialize phi and phi_new
    phi = zeros(N, M);
    phi_new = zeros(N, M);

    % Boundary conditions
    phi(:, 1) = linspace(100, 0, N);  % Left boundary
    phi(:, M) = linspace(100, 0, N);  % Right boundary
    phi(1, :) = 100;                  % Bottom boundary
    phi(N, :) = 0;                    % Top boundary

    phi_new(:, 1) = linspace(100, 0, N);  % Left boundary
    phi_new(:, M) = linspace(100, 0, N);  % Right boundary
    phi_new(1, :) = 100;                  % Bottom boundary
    phi_new(N, :) = 0;                    % Top boundary

    % Jacobi iteration
    while true
        % Perform one Jacobi iteration
        for i = 2:N-1
            for j = 2:M-1
                phi_new(i, j) = 0.25 * (phi(i-1, j) + phi(i+1, j) + phi(i, j-1) + phi(i, j+1));
            end
        end

        % Check for convergence
        if max(max(abs(phi_new - phi))) < epsilon
            break;
        end

        % Update the grid
        iter = iter + 1;
        phi = phi_new;
    end

    % Display the number of iterations
    disp(['Number of iterations: ', num2str(iter)]);

    % Plot the solution
    [X, Y] = meshgrid(1:M, 1:N);
    figure;
    contourf(Y, X, phi', 'EdgeColor', 'none');
    colorbar;
    title('Jacobi Iterative Method');
    xlabel('x');
    ylabel('y');
end
