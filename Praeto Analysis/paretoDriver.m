clc; clear;
combinations = generateCombinations;

cost = zeros(size(combinations,1),1);
rel = zeros(size(combinations,1),1);
SV = zeros(size(combinations,1),1);

for i = 1:size(combinations,1)
    cost(i) = getCost(combinations(i));
    rel(i) = getReliability(combinations(i));
    SV(i) = getSV(combinations(i));
end

Pareto = struct("cost",cost,"reliability",rel,"science",SV);

fig = Plot_Pareto_Analysis(Pareto)