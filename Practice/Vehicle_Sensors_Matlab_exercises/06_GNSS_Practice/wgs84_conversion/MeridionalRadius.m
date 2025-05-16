function meridional_radius = MeridionalRadius(ref_latitude_deg)
% Convert latitude to radian
lat = deg2rad(ref_latitude_deg);

% Set up "Constants"
a = 6378137.0;
b = 6356752.314245;

%% To do
% meridional_radius = 0;
num = (a*b)^2;
den = ((a*cos(lat))^2 + (b*sin(lat))^2)^(3/2);
meridional_radius = num / den;
end

