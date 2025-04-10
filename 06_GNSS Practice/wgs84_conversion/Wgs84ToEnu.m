function enu = Wgs84ToEnu(llh,ref_llh)
enu = zeros(size(llh));
ELLIPSE_A = 6378137;
ELLIPSE_B = 6356752.314;
% ELLIPSE_F = 298.2572236;

ref_latt = ref_llh(1);
ref_logt = ref_llh(2);
ref_hight = ref_llh(3);

M = ((ELLIPSE_A * ELLIPSE_B)^2) / ((ELLIPSE_A * cosd(ref_latt))^2 + (ELLIPSE_B * sind(ref_latt))^2)^(3/2);
N = (ELLIPSE_A^2) / sqrt((ELLIPSE_A * cosd(ref_latt))^2 + (ELLIPSE_B * sind(ref_latt))^2);

%% Todo

for idx = 1 : size(llh,1)
    h = llh(idx, 3);
    d_latt = (llh(idx, 1) - ref_latt) * pi /180;
    d_logt = (llh(idx, 2) - ref_logt) * pi /180;
    d_h = h -ref_hight;

    d_N = (M + ref_hight) * d_latt;
    d_E = (N + ref_hight) * cosd(ref_latt) * d_logt;

    enu(idx, 1) = d_E;
    enu(idx, 2) = d_N;
    enu(idx, 3) = d_h;
end

end

