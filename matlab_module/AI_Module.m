% Simple AI Decision Logic for Aircraft Environmental Control System (ECS)
% Author: Erick Sandrea
% Last updated: July 2025

%% Simulated Sensor Data (temperature in °C, CO2 in ppm)
temperature = [22, 23, 24, 25, 30, 35, 40]; % Cabin temps
co2 = [400, 420, 450, 500, 700, 1000, 2000]; % CO₂ levels

%% Thresholds
max_temp = 30;      % Max safe cabin temperature
max_co2 = 1000;     % Max safe CO₂ in ppm

%% AI Decision Logic
n = length(temperature);
alert_log = strings(n,1);  % Preallocate string array

for i = 1:n
    temp = temperature(i);
    gas = co2(i);

    if temp > max_temp && gas > max_co2
        alert_level = "CRITICAL";
        alert_log(i) = "CRITICAL: Temp and CO₂ too high!";
    elseif temp > max_temp
        alert_level = "HIGH TEMP";
        alert_log(i) = "WARNING: High Temp!";
    elseif gas > max_co2
        alert_level = "HIGH CO₂";
        alert_log(i) = "WARNING: High CO₂!";
    else
        alert_level = "NORMAL";
        alert_log(i) = "Normal conditions.";
    end

    % Print alert
    fprintf("Reading %d — Temp: %d°C, CO₂: %d ppm → %s\n", ...
        i, temp, gas, alert_log(i));
end

%% Visual Output
figure;
subplot(2,1,1)
plot(1:n, temperature, '-o', 'LineWidth', 2); hold on;
yline(max_temp, '--r', 'Max Temp');
title('Cabin Temperature');
xlabel('Reading #');
ylabel('Temp (°C)');
grid on;

subplot(2,1,2)
plot(1:n, co2, '-o', 'LineWidth', 2); hold on;
yline(max_co2, '--r', 'Max CO₂');
title('Cabin CO₂ Levels');
xlabel('Reading #');
ylabel('CO₂ (ppm)');
grid on;