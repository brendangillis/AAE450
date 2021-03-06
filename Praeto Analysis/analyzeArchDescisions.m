% AAE 450 Praeto Analysis
% analyzeArchDescisions.m
% Author: Josh O'Meara
% Analyses the effect of the various architechture decisions

function results = analyzeArchDescisions(archs)
numDecisions = length(archs(1).arch);
numArch = length(archs);

results(1:numDecisions) = struct('decision', [], 'costEffect', [], 'scienceEffect', [], 'relEffect', []);

%STAGING
cost = [0 0 0];
science = [0 0 0];
rel = [0 0 0];
for i = (1:numArch)
    if archs(i).arch.Staging == "none"
        cost(1) = cost(1) + archs(i).cost;
        science(1) = science(1) + archs(i).science;
        rel(1) = rel(1) + archs(i).reliability;
    elseif archs(i).arch.Staging == "single"
        cost(2) = cost(2) + archs(i).cost;
        science(2) = science(2) + archs(i).science;
        rel(2) = rel(2) + archs(i).reliability;
    elseif archs(i).arch.Staging == "mult"
        cost(3) = cost(3) + archs(i).cost;
        science(3) = science(3) + archs(i).science;
        rel(3) = rel(3) + archs(i).reliability;
    end
end 
refOption = 2;
numArchPerChoice = numArch / length(cost);
result = struct('decision', [], 'costEffect', [], 'scienceEffect', [], 'relEffect', []);
result.decision = "Staging";
result.costEffect = (cost-cost(refOption)) / numArchPerChoice;
result.scienceEffect = (science-science(refOption)) / numArchPerChoice;
result.relEffect = (rel-rel(refOption)) / numArchPerChoice;
results(1) = result;

%PROP
cost = [0 0 0 0];
science = [0 0 0 0];
rel = [0 0 0 0];
for i = (1:numArch)
    if archs(i).arch.Prop == "chem"
        cost(1) = cost(1) + archs(i).cost;
        science(1) = science(1) + archs(i).science;
        rel(1) = rel(1) + archs(i).reliability;
    elseif archs(i).arch.Prop == "sail"
        cost(2) = cost(2) + archs(i).cost;
        science(2) = science(2) + archs(i).science;
        rel(2) = rel(2) + archs(i).reliability;
    elseif archs(i).arch.Prop == "elec"
        cost(3) = cost(3) + archs(i).cost;
        science(3) = science(3) + archs(i).science;
        rel(3) = rel(3) + archs(i).reliability;
    elseif archs(i).arch.Prop == "nuc"
        cost(4) = cost(4) + archs(i).cost;
        science(4) = science(4) + archs(i).science;
        rel(4) = rel(4) + archs(i).reliability;
    end
end 
refOption = 1;
numArchPerChoice = numArch / length(cost);
result = struct('decision', [], 'costEffect', [], 'scienceEffect', [], 'relEffect', []);
result.decision = "Prop";
result.costEffect = (cost-cost(refOption)) / numArchPerChoice;
result.scienceEffect = (science-science(refOption)) / numArchPerChoice;
result.relEffect = (rel-rel(refOption)) / numArchPerChoice;
results(2) = result;

%GRAVITY
cost = [0 0];
science = [0 0];
rel = [0 0];
for i = (1:numArch)
    if archs(i).arch.Gravity == "none"
        cost(1) = cost(1) + archs(i).cost;
        science(1) = science(1) + archs(i).science;
        rel(1) = rel(1) + archs(i).reliability;
    elseif archs(i).arch.Gravity == "jupiter"
        cost(2) = cost(2) + archs(i).cost;
        science(2) = science(2) + archs(i).science;
        rel(2) = rel(2) + archs(i).reliability;
    end
end
refOption = 1;
numArchPerChoice = numArch / length(cost);
result = struct('decision', [], 'costEffect', [], 'scienceEffect', [], 'relEffect', []);
result.decision = "Gravity";
result.costEffect = (cost-cost(refOption)) / numArchPerChoice;
result.scienceEffect = (science-science(refOption)) / numArchPerChoice;
result.relEffect = (rel-rel(refOption)) / numArchPerChoice;
results(3) = result;

%COM
cost = [0 0 0];
science = [0 0 0];
rel = [0 0 0];
for i = (1:numArch)
    if archs(i).arch.Com == "laser"
        cost(1) = cost(1) + archs(i).cost;
        science(1) = science(1) + archs(i).science;
        rel(1) = rel(1) + archs(i).reliability;
    elseif archs(i).arch.Com == "X"
        cost(2) = cost(2) + archs(i).cost;
        science(2) = science(2) + archs(i).science;
        rel(2) = rel(2) + archs(i).reliability;
    elseif archs(i).arch.Com == "Ka"
        cost(3) = cost(3) + archs(i).cost;
        science(3) = science(3) + archs(i).science;
        rel(3) = rel(3) + archs(i).reliability;
    end
end 
refOption = 3;
numArchPerChoice = numArch / length(cost);
result = struct('decision', [], 'costEffect', [], 'scienceEffect', [], 'relEffect', []);
result.decision = "Com";
result.costEffect = (cost-cost(refOption)) / numArchPerChoice;
result.scienceEffect = (science-science(refOption)) / numArchPerChoice;
result.relEffect = (rel-rel(refOption)) / numArchPerChoice;
results(4) = result;

%SPIN
cost = [0 0 0];
science = [0 0 0];
rel = [0 0 0];
for i = (1:numArch)
    if archs(i).arch.Spin == "no"
        cost(1) = cost(1) + archs(i).cost;
        science(1) = science(1) + archs(i).science;
        rel(1) = rel(1) + archs(i).reliability;
    elseif archs(i).arch.Spin == "yes"
        cost(2) = cost(2) + archs(i).cost;
        science(2) = science(2) + archs(i).science;
        rel(2) = rel(2) + archs(i).reliability;
    elseif archs(i).arch.Spin == "both"
        cost(3) = cost(3) + archs(i).cost;
        science(3) = science(3) + archs(i).science;
        rel(3) = rel(3) + archs(i).reliability;
    end
end 
refOption = 2;
numArchPerChoice = numArch / length(cost);
result = struct('decision', [], 'costEffect', [], 'scienceEffect', [], 'relEffect', []);
result.decision = "Spin";
result.costEffect = (cost-cost(refOption)) / numArchPerChoice;
result.scienceEffect = (science-science(refOption)) / numArchPerChoice;
result.relEffect = (rel-rel(refOption)) / numArchPerChoice;
results(5) = result;

%LV
cost = [0 0 0 0];
science = [0 0 0 0];
rel = [0 0 0 0];
for i = (1:numArch)
    if archs(i).arch.LV == "star"
        cost(1) = cost(1) + archs(i).cost;
        science(1) = science(1) + archs(i).science;
        rel(1) = rel(1) + archs(i).reliability;
    elseif archs(i).arch.LV == "sls"
        cost(2) = cost(2) + archs(i).cost;
        science(2) = science(2) + archs(i).science;
        rel(2) = rel(2) + archs(i).reliability;
    elseif archs(i).arch.LV == "div"
        cost(3) = cost(3) + archs(i).cost;
        science(3) = science(3) + archs(i).science;
        rel(3) = rel(3) + archs(i).reliability;
    elseif archs(i).arch.LV == "falcon"
        cost(4) = cost(4) + archs(i).cost;
        science(4) = science(4) + archs(i).science;
        rel(4) = rel(4) + archs(i).reliability;
    end
end 
refOption = 3;
numArchPerChoice = numArch / length(cost);
result = struct('decision', [], 'costEffect', [], 'scienceEffect', [], 'relEffect', []);
result.decision = "LV";
result.costEffect = (cost-cost(refOption)) / numArchPerChoice;
result.scienceEffect = (science-science(refOption)) / numArchPerChoice;
result.relEffect = (rel-rel(refOption)) / numArchPerChoice;
results(6) = result;

%POWER
cost = [0 0 0];
science = [0 0 0];
rel = [0 0 0];
for i = (1:numArch)
    if archs(i).arch.Power == "solar"
        cost(1) = cost(1) + archs(i).cost;
        science(1) = science(1) + archs(i).science;
        rel(1) = rel(1) + archs(i).reliability;
    elseif archs(i).arch.Power == "nuc"
        cost(2) = cost(2) + archs(i).cost;
        science(2) = science(2) + archs(i).science;
        rel(2) = rel(2) + archs(i).reliability;
    elseif archs(i).arch.Power == "both"
        cost(3) = cost(3) + archs(i).cost;
        science(3) = science(3) + archs(i).science;
        rel(3) = rel(3) + archs(i).reliability;
    end
end 
refOption = 1;
numArchPerChoice = numArch / length(cost);
result = struct('decision', [], 'costEffect', [], 'scienceEffect', [], 'relEffect', []);
result.decision = "Power";
result.costEffect = (cost-cost(refOption)) / numArchPerChoice;
result.scienceEffect = (science-science(refOption)) / numArchPerChoice;
result.relEffect = (rel-rel(refOption)) / numArchPerChoice;
results(7) = result;

%PAYLOAD
cost = [0 0 0];
science = [0 0 0];
rel = [0 0 0];
for i = (1:numArch)
    if archs(i).arch.Payload == "all"
        cost(1) = cost(1) + archs(i).cost;
        science(1) = science(1) + archs(i).science;
        rel(1) = rel(1) + archs(i).reliability;
    elseif archs(i).arch.Payload == "partial"
        cost(2) = cost(2) + archs(i).cost;
        science(2) = science(2) + archs(i).science;
        rel(2) = rel(2) + archs(i).reliability;
    elseif archs(i).arch.Payload == "max"
        cost(3) = cost(3) + archs(i).cost;
        science(3) = science(3) + archs(i).science;
        rel(3) = rel(3) + archs(i).reliability;
    end
end 
refOption = 1;
numArchPerChoice = numArch / length(cost);
result = struct('decision', [], 'costEffect', [], 'scienceEffect', [], 'relEffect', []);
result.decision = "Payload";
result.costEffect = (cost-cost(refOption)) / numArchPerChoice;
result.scienceEffect = (science-science(refOption)) / numArchPerChoice;
result.relEffect = (rel-rel(refOption)) / numArchPerChoice;
results(8) = result;
end