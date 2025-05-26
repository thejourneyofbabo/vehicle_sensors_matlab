function [estimated_speed] = PulseCountingMethod(t,pulses, pulsesPerRevolution, time_interval)
    estimated_speed = zeros([length(t) 1]);
    
    p_count = 0;
    prev_time = 0.0;

    
    %% ToDo
    for idx = 1:length(t)
        if idx==1
            estimated_speed(idx) = 0;
            continue;
        end

        if pulses(idx)-pulses(idx-1) > 0
            p_count = p_count + 1;
        end

        if (t(idx) - prev_time) > time_interval
            num = 2*pi*p_count;
            den = pulsesPerRevolution * time_interval;
            estimated_speed(idx) = num / den;
            p_count = 0;
            prev_time = t(idx);
        else
            estimated_speed(idx) = estimated_speed(idx -1);

        end

        
        % estimated_speed(idx) = 0;
    end
end

