% AAE 450 Praeto Analysis
% getReliability.m
% Author: Josh O'Meara
% Assigns the reliability scores to each architecture

function reliability = getReliability(arch)
reliability = 1;

%STAGING
if (arch.Staging == "none")
    reliability = reliability * 1;
elseif (arch.Staging == "single")
    reliability = reliability * .99;
elseif (arch.Staging == "mult")
    reliability = reliability * .98;
end

% PROPULSION
if (arch.Prop == "chem")
    reliability = reliability * .99;
elseif (arch.Prop == "sail")
    reliability = reliability * .99;
elseif (arch.Prop == "elec")
    reliability = reliability * .998;
elseif (arch.Prop == "nuc")
    reliability = reliability * .939;
end

% GRAVITY
if (arch.Gravity == "none")
    reliability = reliability * 1;
elseif (arch.Gravity == "jupiter")
    reliability = reliability * .98;
end

% COM
if (arch.Com == "laser")
    reliability = reliability * .99;
elseif (arch.Com == "Ka")
    reliability = reliability * .999;
elseif (arch.Com == "X")
    reliability = reliability * .996;
end

% SPIN
if (arch.Spin == "no")
    reliability = reliability * 0;
elseif (arch.Spin == "yes")
    reliability = reliability * .99;
elseif (arch.Spin == "both")
    reliability = reliability * .9801;
end

% LV
if (arch.LV == "star")
    reliability = reliability * .92;
elseif (arch.LV == "sls")
    reliability = reliability * .9231;
elseif (arch.LV == "div")
    reliability = reliability * .923;
elseif (arch.LV == "falcon")
    reliability = reliability * 1;
end

% POWER
if (arch.Power == "solar")
    reliability = reliability * .995;
elseif (arch.Power == "nuc")
    reliability = reliability * .997;
elseif (arch.Power == "both")
    reliability = reliability * .999985;
end

% PAYLOAD
if (arch.Payload == "all")
    reliability = reliability * 1;
elseif (arch.Payload == "partial")
    reliability = reliability * 1;
elseif (arch.Payload == "max")
    reliability = reliability * 1;
end
end
