function enu = Wgs84ToEnu(llh,ref_llh)
enu = zeros(size(llh));

%% Todo

for idx = 1 : size(llh,1)
    enu(idx, 1) = 0.0;
    enu(idx, 2) = 0.0;
    enu(idx, 3) = 0.0;
end

end

