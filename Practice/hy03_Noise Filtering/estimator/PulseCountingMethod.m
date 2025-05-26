function [estimated_speed] = PulseCountingMethod(t,pulses, pulsesPerRevolution, time_interval)
    estimated_speed = zeros([length(t) 1]);
    pulses_per_interval = 0;
    prev_state = 0.0;
    prev_time = 0.0;
    time_checker = 0.0;
    speed_coef = 2 * pi / (pulsesPerRevolution * time_interval);
    prev_speed = 0.0;
    
    %% ToDo
    for idx = 1:length(t)

        time_checker = t(idx)-prev_time;
        if pulses(idx)-prev_state > 0
            pulses_per_interval = pulses_per_interval + 1;
            prev_state = pulses(idx);
        else
            prev_state = pulses(idx);
        end

        if time_checker > time_interval
            estimated_speed(idx) = speed_coef * pulses_per_interval;
            prev_speed = estimated_speed(idx);
            prev_time = t(idx);
            pulses_per_interval = 0;
        else 
            estimated_speed(idx) = prev_speed;
        end

        % estimated_speed(idx) = 0;
    end
end

