function normal_radius = NormalRadius(ref_latitude_deg)
% Convert latitude to radian
lat = deg2rad(ref_latitude_deg);

% Set up "Constants"
a = 6378137.0;
b = 6356752.314245;

%% To do
% normal_radius = 0;
num = (a)^2;
den = ((a*cos(lat))^2 + (b*sin(lat))^2)^(1/2);
normal_radius = num/den;
end

