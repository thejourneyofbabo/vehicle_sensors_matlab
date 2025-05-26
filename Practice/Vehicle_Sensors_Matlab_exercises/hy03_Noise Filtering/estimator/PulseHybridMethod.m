function [estimated_speed] = PulseHybridMethod(t,pulses, pulsesPerRevolution, time_interval)
    estimated_speed = zeros([length(t) 1]);

    Td = 0.0;
    prev_speed = 0.0;
    prev_time = 0.0;
    p_count = 0;

    %% ToDo
    for idx = 1:length(t)
        if idx > 1 && (pulses(idx) - pulses(idx-1)) > 0
            p_count = p_count + 1;
            if (t(idx)-prev_time) > time_interval
                Td = t(idx) -prev_time;
            end
        end

        if Td > 0
            num = 2 * pi * p_count;
            den = pulsesPerRevolution * Td;
            estimated_speed(idx) = num / den;

            p_count = 0;
            Td = 0;
            prev_speed = estimated_speed(idx);
            prev_time = t(idx);
        else
            estimated_speed(idx) = prev_speed;
        end
       
        % estimated_speed(idx) = 0;
    end
end




% function [estimated_speed] = PulseHybridMethod(t,pulses, pulsesPerRevolution, time_interval)
%     estimated_speed = zeros([length(t) 1]);
% 
%     prev_speed = 0.0;
%     prev_time = 0.0;
%     p_count = 0;
%     Td = 0.0;
% 
%     %% ToDo
%     for idx = 1:length(t)
% 
%         if idx > 1 && (pulses(idx)- pulses(idx-1)) > 0
%             p_count = p_count + 1;
% 
%             if (t(idx) - prev_time) > time_interval
%                 Td = t(idx)-prev_time;
% 
%             end
%         end
% 
%         if Td > 0
%             num = 2 * pi * p_count;
%             den = pulsesPerRevolution * Td;
%             estimated_speed(idx) = num/den;
% 
%             prev_speed = estimated_speed(idx);
%             p_count = 0;
%             prev_time = t(idx);
%             Td = 0;
%         else
%             estimated_speed(idx) = prev_speed;
%         end
% 
%         % estimated_speed(idx) = 0;
%     end
% end