function [] = visualizeEncoderSpeed(t,vehicleSpeed, estimatedSpeedCounting, estimatedSpeedTiming, estimatedSpeedHybrid)
    figure
    plot(t, vehicleSpeed, DisplayName='gt speed');
    hold on; grid on;
    plot(t, estimatedSpeedCounting, DisplayName='estimated speed with pulse counting');
    plot(t, estimatedSpeedTiming, DisplayName='estimated speed with pulse timing')
    plot(t, estimatedSpeedHybrid, DisplayName='estimated speed with pulse hybrid method')
    hold on;

    xlabel('Time (seconds)');
    ylabel('Velocity (m/s)');
    
    % legend('gt speed', 'estimated speed with pulse counting', 'estimated speed with pulse timing');
    legend("show");
end

