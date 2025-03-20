function [moving_average_filter_data] = movingAverageFilter(sensor_data, sensor_measure_time, gt_data, window_size, sensor_type)
    % initialize 0
    moving_average_filter_data = zeros(1, length(sensor_data));

    % complete the moving average filter
    %% ToDo

    for idx=1:length(moving_average_filter_data)
        % if idx < window_size
        %     moving_average_filter_data(idx) = mean(sensor_data(1:idx));
        % else
        %     moving_average_filter_data(idx) = mean(sensor_data(idx-window_size+1:idx)); 
        % end

        if idx < window_size
            moving_average_filter_data(idx) = mean(sensor_data(1:idx));
            continue;
        end
        
        moving_average_filter_data(idx) = mean(sensor_data(idx-window_size+1:idx));

    end
    
    %% Visualization

    % get absolute error
    difference = abs(moving_average_filter_data - gt_data);
    sum_of_absolute_differences = sum(difference(:)); 
    absolute_mean_error = sum_of_absolute_differences / length(difference);
    
    fprintf("Error: %.3f\n", absolute_mean_error);
        
    if strcmp(sensor_type, 'IMU')
        figure;
        plot(sensor_measure_time, moving_average_filter_data, 'g', 'LineWidth', 2); hold on;
        plot(sensor_measure_time, sensor_data, 'r:', 'LineWidth', 1); hold on;
        legend('Filter data', 'Measured data');
        title('Moving Average Filter Data');
        xlabel('time(sec)');
        ylabel('m/ss');
        grid on;
    else
        figure;
        plot(sensor_measure_time, moving_average_filter_data, 'g', 'LineWidth', 2); hold on;
        plot(sensor_measure_time, sensor_data, 'r:', 'LineWidth', 1); hold on;
        legend('Filter data', 'Measured data');
        title('Moving Average Filter Data'); hold on;
        xlabel('time(sec)');
        ylabel('m/s');
        grid on;
    end
end

