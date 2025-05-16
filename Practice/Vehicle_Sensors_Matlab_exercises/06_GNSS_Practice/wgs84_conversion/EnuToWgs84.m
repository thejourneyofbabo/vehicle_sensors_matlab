function llh = EnuToWgs84(enu,ref_llh)
llh = zeros(size(enu));

%% Todo
M = MeridionalRadius(ref_llh(1));
N = NormalRadius(ref_llh(1));
ref_lat = ref_llh(1);
ref_long = ref_llh(2);
ref_h = ref_llh(3);

for idx = 1 : size(llh,1)
    % Lat
    nem_lat = enu(idx,2);
    den_lat = M + ref_h;
    llh(idx, 1) = rad2deg(nem_lat/den_lat) + ref_lat;
    
    % Long
    nem_long = enu(idx, 1);
    den_long = (N + ref_h)*cosd(ref_lat);
    llh(idx, 2) = rad2deg(nem_long/den_long) + ref_long;
    % H
    llh(idx, 3) = enu(idx,3) + ref_h;
end

end

