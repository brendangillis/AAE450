% Author: Aman Chokshi
% Generates the propulsion information needed for Pareto Analysis
function propInfo = getPropInfo(combinations)
% No real data on SLS yet, so had to assume 10% better than Delta IV
propInfo(size(combinations,1),1) = struct("dV",[],"mPay",[],"mInert",[],"mProp",[], "isp",[]);

for i = 1:size(combinations,1)
    if combinations(i).LV == "star"
        propInfo(i).dV = 13; % Starship dV [km/s]
        propInfo(i).isp = 458.7; %Isp [sec]
        propInfo(i).mProp = 3583379.723; %Propellant mass [kg]
    elseif combinations(i).LV == "sls"
        propInfo(i).dV = 11; % SLS dV [km/s]
        propInfo(i).isp = 532.7; %Isp [sec]
        propInfo(i).mProp = 987470.5895; %Propellant mass [kg]
    elseif combinations(i).LV == "div"
        propInfo(i).dV = 9.800; %Delta IV dV [km/s]
        propInfo(i).isp = 412; %Isp [sec]
        propInfo(i).mProp = 200400+27220+200400*2; %Propellant mass [kg]
    elseif combinations(i).LV == "falcon"
        propInfo(i).dV = 9.300; %Falcon Heavy dV [km/s]
        propInfo(i).isp = 311; %Isp [sec]
        propInfo(i).mProp = 395700 + 92670; %Propellant mass [kg]
    end

    % 2x payload mass multiplier to account of unforeseen hardware and masses
    payloadMultiplier = 2;
    inertMultiplier = 10;
    if combinations(i).Payload == "all"
        propInfo(i).mPay = 87.4*payloadMultiplier; %Mass of all payloads [kg]
        propInfo(i).mInert = propInfo(i).mPay * inertMultiplier; %Estimatation of inert mass
    elseif combinations(i).Payload == "partial"
        propInfo(i).mPay = 62.9*payloadMultiplier; %Mass of payloads with partial descoping of ENA & LYA[kg]
        propInfo(i).mInert = propInfo(i).mPay * inertMultiplier; %Estimatation of inert mass
    elseif combinations(i).Payload == "max"
        propInfo(i).mPay = 14.8*payloadMultiplier; %Mass of payloads with partial descoping of ENA, LYA, IDA, PWS, EPS due to weight and objective overlap [kg]
        propInfo(i).mInert = propInfo(i).mPay * inertMultiplier; %Estimatation of inert mass
    end
end
end

