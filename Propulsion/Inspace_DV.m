% Braden Grossfeld
% AAE 450
% DV vs MASS

% all units in SI


% Starting factors:
satM1 = 1000; % satalite dry mass
satM2 = 2000;
satM3 = 3000;
g = 9.81;


%Ion (DAWN as baseline):

ispI = 3100;
mdotI = 3.25e-6; %kg
mpropI = 0:1:1000; 
DVIs1 = ispI * g * log((satM1+mpropI)/satM1);
DVIs2 = ispI * g * log((satM2+mpropI)/satM2);
DVIs3 = ispI * g * log((satM3+mpropI)/satM3);
IM1 = satM1 + mpropI;
IM2 = satM2 + mpropI;
IM3 = satM3 + mpropI;
btimeI = 1000/mdotI; %Assume 1000 kg of prop
DVI_sec = max(DVIs2) / btimeI;
timeI = 0:10000000:btimeI;
DVI_psec = DVI_sec * timeI;



% Chemical
ispC = 329;
mdotC = 556 / (ispC *g);
mpropC = 0:1:1000; %kg/s
DVCs1 = ispC * g * log((satM1+mpropC)/satM1);
DVCs2 = ispC * g * log((satM2+mpropC)/satM2);
DVCs3 = ispC * g * log((satM3+mpropC)/satM3);
CM1 = satM1 + mpropC;
CM2 = satM2 + mpropC;
CM3 = satM3 + mpropC;
btimeC = 1000/mdotC; %Assume 1000 kg of prop
DVC_sec = max(DVCs2) / btimeC;
timeC = 0:100:btimeC;
DVC_psec = DVC_sec * timeC;




% solar sail

R = 1; % 100%
D = 1; % start % AU
theta = 90;
step = 100; %time step in seconds
stop = 60*60*24*365*10; % 10 years
V = 9800; %start velocity m/s
d = 1.496e+11;


%M1000
index = 1;
for L = 100:100:675
    A = L^2;
    sailM = .0025 * A;
    MS1(index) = satM1 + sailM; 
    i = 1;
    R = 1; % 100%
    D = 1; % start % AU
    theta = 90;
    step = 100; %time step in seconds
    stop = 60*60*24*365*10; % 10 years
    V = 9800; %start velocity m/s
    d = 1.496e+11;
    for time =0:step:stop
        F = 9.113*10^-6 * R *A / D^2 * sind(theta)^2;
        a = F / MS1(index);
        V = V + a*step;
        d = d + V*step;
        D = d / 1.496e+11;
        i = i+1;
    end
    DVSs1(index) = (V - 9800);
    index = index +1;
end

%M2000
index = 1;
for L = 100:100:675
    A = L^2;
    sailM = .0025 * A;
    MS2(index) = satM2 + sailM; 
    i = 1;
    R = 1; % 100%
    D = 1; % start % AU
    theta = 90;
    step = 100; %time step in seconds
    stop = 60*60*24*365*10; % 10 years
    V = 9800; %start velocity m/s
    d = 1.496e+11;
    for time =0:step:stop
        F = 9.113*10^-6 * R *A / D^2 * sind(theta)^2;
        a = F / MS2(index);
        V = V + a*step;
        d = d + V*step;
        D = d / 1.496e+11;
        DVSS_time(i,index) = (V - 9800);
        i = i+1;
    end
    DVSs2(index) = (V - 9800);
    index = index +1;
end


%M3000
index = 1;
for L = 100:100:675
    A = L^2;
    sailM = .0025 * A;
    MS3(index) = satM3 + sailM; 
    i = 1;
    R = 1; % 100%
    D = 1; % start % AU
    theta = 90;
    step = 100; %time step in seconds
    stop = 60*60*24*365*10; % 10 years
    V = 9800; %start velocity m/s
    d = 1.496e+11;
    for time =0:step:stop
        F = 9.113*10^-6 * R *A / D^2 * sind(theta)^2;
        a = F / MS3(index);
        V = V + a*step;
        d = d + V*step;
        D = d / 1.496e+11;
        i = i+1;
    end
    DVSs3(index) = (V - 9800);
    index = index +1;
end







t =0:step:stop;

% PLOTS 

figure(1)
plot(IM1, DVIs1)
hold on
plot(MS1, DVSs1)
plot(CM1, DVCs1)
xlabel('Mass (kg)')
ylabel('DV m/s')
legend('Ion engine','Solar Sail', 'Chemical')
title('1000 kg dry')
hold off

figure(2)
plot(IM2, DVIs2)
hold on
plot(MS2, DVSs2)
plot(CM2, DVCs2)
xlabel('Mass (kg)')
ylabel('DV m/s')
legend('Ion engine','Solar Sail', 'Chemical')
title('2000 kg dry')
hold off


figure(3)
plot(IM3, DVIs3)
hold on
plot(MS3, DVSs3)
plot(CM3, DVCs3)
xlabel('Mass (kg)')
ylabel('DV m/s')
legend('Ion engine','Solar Sail', 'Chemical')
title('3000 kg dry')
hold off

figure(4)
plot(timeI, DVI_psec)
hold on
xlabel('time (sec)')
ylabel('DV m/s')
title('Ion time vs dv')
hold off

figure(5)
plot(timeC, DVC_psec)
hold on
xlabel('time (sec)')
ylabel('DV m/s')
title('Chemical time vs dv')
hold off


figure(6)
plot(t, DVSS_time(:,1))
hold on
xlabel('time (sec)')
ylabel('DV m/s')
title('SS time vs dv')
hold off