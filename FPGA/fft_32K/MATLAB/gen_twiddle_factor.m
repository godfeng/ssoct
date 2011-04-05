function [coshex, sinhex, twiddle] = gen_twiddle_factor(N, bit_width);


coshex_val = zeros(N,1);
sinhex_val = zeros(N,1);
coshex = zeros(N,1);
sinhex = zeros(N,1);

for i=1:N
    coshex_val(i) = cos((2*pi/N)*(i-1));
    sinhex_val(i) = -sin((2*pi/N)*(i-1));
end

%scaled version of the twiddle factors based on bit width

scaling_factor = 2^(bit_width -1 ) -1


for i=1:N
    coshex(i) = round(coshex_val(i) * scaling_factor);
    sinhex(i) = round(sinhex_val(i) * scaling_factor);
    twiddle(i) = coshex(i) + sinhex(i)*j;
end



k=1;
for i=1:N/8
    for t=1:8
        if (k<=32767)
        coshex_c(i,t)=coshex(k);
        sinhex_c(i,t)=sinhex(k+1);
        k=k+1;   
        end
    end
end
