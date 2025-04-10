function normal_radius = NormalRadius(ref_latitude_deg)
% Convert latitude to radian
%lat = deg2rad(ref_latitude_deg);

% Set up "Constants"
ELLIPSE_A = 6378137.0;
ELLIPSE_B = 6356752.314245;

%% To do
normal_radius = (ELLIPSE_A^2) / sqrt((ELLIPSE_A * cosd(ref_latitude_deg))^2 + (ELLIPSE_B * sind(ref_latitude_deg))^2);
end

