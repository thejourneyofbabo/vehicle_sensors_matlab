function [estimated_speed] = PulseTimingMethod(t, pulses, pulsesPerRevolution)
    estimated_speed = zeros([length(t) 1]);
    
    %% ToDo
    prev_time = 0.0;
    prev_pulse = 0.0;
    %curr_estimated_speed = 0;
    period_between_pulse = 0.0;

    for idx = 1:length(t)
        estimated_speed(idx) = 0;
        
        if idx == 1
            prev_time = t(idx);
            prev_pulse = pulses(idx);
            continue;
        end

        if (pulses(idx) - prev_pulse) > 0 
            period_between_pulse = t(idx) - prev_time;
            estimated_speed(idx) = (2 * pi) / (pulsesPerRevolution * period_between_pulse);
            prev_time = t(idx);
        else
            estimated_speed(idx) = estimated_speed(idx - 1);
        end
        prev_pulse = pulses(idx);

    end
end

