function enu = Wgs84ToEnu(llh,ref_llh)
enu = zeros(size(llh));

%% Todo
M = MeridionalRadius(ref_llh(1));
N = NormalRadius(ref_llh(1));
ref_lat = ref_llh(1);
ref_long = ref_llh(2);
ref_h = ref_llh(3);

for idx = 1 : size(llh,1)
    d_lat = -deg2rad(ref_lat - llh(idx,1));
    d_long = -deg2rad(ref_long - llh(idx,2));
    d_h = llh(idx,3)-ref_h;

    % E
    enu(idx, 1) = (N+ref_h)*cosd(ref_lat)*d_long;
    % N
    enu(idx, 2) = (M+ref_h)*d_lat;
    % H
    enu(idx, 3) = d_h;
end

end

