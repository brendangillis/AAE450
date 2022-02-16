% Author: Aman Chokshi
% Generates the propulsion information needed for Pareto Analysis
function propInfo = getPropInfo(combinations)
% No real data on SLS yet, so had to assume 10% better than Delta IV
% C3 values from starship used exiosting data with extra features removed. Rest values for C3 from NASA
propInfo(size(combinations,1),1) = struct("dV",[],"mPay",[],"mInert",[],"mProp",[], "isp",[]);

for i = 1:size(combinations,1)
    if combinations(i).LV == "star"
        propInfo(i).dV = 11.2+11.4; % Starship dV [km/s]
        propInfo(i).isp = 380; %Isp [sec]
        propInfo(i).mProp = 1200000; %Propellant mass [kg]
        propInfo(i)c3 = 97; % km^2/s^2
    elseif combinations(i).LV == "sls"
        propInfo(i).dV = 11.2+10; % SLS dV [km/s]
        propInfo(i).isp = 453; %Isp [sec]
        propInfo(i)c3 = 90; % km^2/s^2
    elseif combinations(i).LV == "div"
        propInfo(i).dV = 11.2+8.9; %Delta IV dV [km/s]
        propInfo(i).isp = 435; %Isp [sec]
        propInfo(i)c3 = 130; % km^2/s^2
        propInfo(i)c3 = 80; % km^2/s^2    - No kick stages
    elseif combinations(i).LV == "falcon"
        propInfo(i).dV = 11.2+8.9; %Falcon Heavy dV [km/s]
        propInfo(i).isp = 363; %Isp [sec]
        propInfo(i).mProp = 395700 + 92670; %Propellant mass [kg]
        propInfo(i)c3 = 80; % km^2/s^2   - No kick stages
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

