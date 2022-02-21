% AAE 450 Praeto Analysis
% getCost.m
% Author: Josh O'Meara
% Assigns the cost scores to each architecture

function cost = getCost(arch)
cost = 0;

%STAGING
if (arch.Staging == "none")
    cost = cost - 7.5;
elseif (arch.Staging == "single")
    cost = cost + 0;
elseif (arch.Staging == "mult")
    cost = cost + 7.5;
end

% PROPULSION
if (arch.Prop == "chem")
    cost = cost + 0;
elseif (arch.Prop == "sail")
   cost = cost - 6.69742095;
elseif (arch.Prop == "elec")
    cost = cost - 14;
elseif (arch.Prop == "nuc")
    cost = cost + 11.986;
end

% GRAVITY
if (arch.Gravity == "none")
    cost = cost + 0;
elseif (arch.Gravity == "jupiter")
    cost = cost -.515;
end

% COM
if (arch.Com == "laser")
    cost = cost + 30;
elseif (arch.Com == "Ka")
    cost = cost + 0;
elseif (arch.Com == "X")
    cost = cost + 0;
end

% SPIN
if (arch.Spin == "no")
    cost = cost + 116;
elseif (arch.Spin == "yes")
    cost = cost + 0;
elseif (arch.Spin == "both")
    cost = cost + 0;
end

% LV
if (arch.LV == "star")
    cost = cost + 0;
elseif (arch.LV == "sls")
    cost = cost + 0;
elseif (arch.LV == "div")
    cost = cost + 0;
elseif (arch.LV == "falcon")
    cost = cost + 0;
end

% POWER
if (arch.Power == "solar")
%     cost = cost+ 1;
      cost = cost + 0;
elseif (arch.Power == "nuc")
%     cost = cost - 65;
      cost = cost - 235;
elseif (arch.Power == "both")
%     cost = cost - 65.0175;
     cost = cost + 140;
end

% PAYLOAD
if (arch.Payload == "all")
    cost = cost + 0;
elseif (arch.Payload == "partial")
    cost = cost - 64.608;
elseif (arch.Payload == "max")
    cost = cost - 150.173;
end

cost = cost;
end