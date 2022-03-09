%Author: Leila Yanni

diameter = 8.5; %antenna diameter in meters

eta = 0.55;
lambda_a = 299792458 / (32 * 10^9);
lambda_v = 299792458 / (8.4 * 10^9);

S_a_final = 123 * 1.496 * 10^11;
S_v = 130 * 1.496 * 10^11;

Gr_a = (pi^2 * diameter^2 * eta) / (lambda_a^2);
Gr_a = (pi^2 * diameter^2 * eta) / (lambda_a^2);
Gr_v = 10^(48/10); %gain of voyager

Ls_v = lambda_v^2 / (16 * pi^2 * S_v^2);
Rv = 160; %bps - data rate of voyager

data_rates_22 = [];
distances = [120:220];
for S_a = distances
    S_a = S_a * 1.496 * 10^11;
    Ls_a = lambda_a^2 / (16 * pi^2 * S_a^2);
    R = (Gr_a * Ls_a * Rv) / (Gr_v * Ls_v); %data rate
    data_rates_22 = [data_rates_22 R];
end

data_rates_1500 = data_rates_22 * 1500/22;
data_rates_2000 = data_rates_22 * 2000/22;
data_rates_2500 = data_rates_22 * 2500/22;

hold on
plot(distances, data_rates_1500, 'b', 'LineWidth', 1.5)
plot(distances, data_rates_2000, 'r', 'LineWidth', 1.5)
plot(distances, data_rates_2500, 'g', 'LineWidth', 1.5)
xlabel('Distance from Earth (AU)'); ylabel('Data Rate (bps)')
title('Data Rate versus Distance from Earth')
legend('1500 W', '2000 W', '2500 W')
