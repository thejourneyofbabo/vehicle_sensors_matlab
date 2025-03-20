function [estimated_speed] = PulseCountingMethod(t,pulses, pulsesPerRevolution, time_interval)
    estimated_speed = zeros([length(t) 1]);
    
    %% ToDo
    tmp_pulse_count = 0;
    prev_time = 0.0;
    prev_pulse = 0;

    for idx = 1:length(t)
        % estimated_speed(idx) = 0;
        if idx == 1 
            prev_time = t(idx);
             prev_pulse = pulses(idx);
            continue;
        end

        if (pulses(idx) - prev_pulse) > 0 
            tmp_pulse_count = tmp_pulse_count + 1;
        end

        prev_pulse = pulses(idx);
        
        if (t(idx) - prev_time) >= time_interval
            estimated_speed(idx) = (2 * pi * tmp_pulse_count) / (pulsesPerRevolution * time_interval);
            tmp_pulse_count = 0;
            prev_time = t(idx);
        else
            estimated_speed(idx) = estimated_speed(idx - 1);
        end
        
    end

end

