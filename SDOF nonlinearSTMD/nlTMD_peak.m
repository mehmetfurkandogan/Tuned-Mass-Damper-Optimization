function p = nlTMD_peak(k2c,c2)
w = 0.7:0.01:1.2;
a = zeros(size(w));
for i = 1:size(w,2)
    a(i) = nlTMDamp(w(i),k2c,c2);
end
p = max(a);