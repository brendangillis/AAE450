% AAE 450 Praeto Analysis
% getCost.m
% Author: Josh O'Meara
% Assigns the cost scores to each architecture

function cost = getCost(arch)
cost = 0;

%STAGING
if (arch.Staging == "none")
    cost = cost + 20;
elseif (arch.Staging == "single")
    cost = cost + 0;
elseif (arch.Staging == "mult")
    cost = cost - 40;
end

% PROPULSION
if (arch.Prop == "chem")
    cost = cost + 0;
elseif (arch.Prop == "sail")
%     cost = cost - 145;
   cost = cost + 1.5;
elseif (arch.Prop == "elec")
    cost = cost + 1.5;
elseif (arch.Prop == "nuc")
%     cost = cost - 595;
    cost = cost - 5.95;
end

% GRAVITY
if (arch.Gravity == "none")
    cost = cost - 100;
elseif (arch.Gravity == "jupiter")
    cost = cost + 1.6;
end

% COM
if (arch.Com == "laser")
    cost = cost - 10;
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
      cost = cost - 10;
elseif (arch.Power == "nuc")
%     cost = cost - 65;
      cost = cost + 2;
elseif (arch.Power == "both")
%     cost = cost - 65.0175;
     cost = cost - 12;
end

% PAYLOAD
if (arch.Payload == "all")
    cost = cost + 0;
elseif (arch.Payload == "partial")
    cost = cost + 43.61;
elseif (arch.Payload == "max")
    cost = cost + 112.05;
end

cost = cost;
end
