%Author: Aman Chokshi
%Driver Script for Pareto Analysis
clc; clear; close all;

combinations = generateCombinations;

cost = zeros(size(combinations,1),1);
rel = zeros(size(combinations,1),1);
SV = zeros(size(combinations,1),1);
tHP = zeros(size(combinations,1),1); 



% Gets Cost, Science Value and Reliability for all combinations
for i = 1:size(combinations,1)
    cost(i) = -getCost(combinations(i));
    rel(i) = getReliability(combinations(i));
    SV(i) = getSV(combinations(i));

    propInfo = getPropInfo(combinations(i));
    tHP(i) = timeToHP(combinations(i),propInfo,120);
end

% Makes SV for combinations that take >10 years to reach HP to 0
tHP10 = find(tHP > 10);

for l = 1:length(tHP10)
    SV(tHP10(l)) = 0;
end

Pareto = struct("cost",cost,"reliability",rel,"science",SV);


% %Determined best combinations
 favoredCost = find(Pareto.cost >=390);
 favoredScience = find(Pareto.science > .375);
k = 1;
for j = 1:size(favoredCost,1)
    if ismember(favoredCost(j),favoredScience) > 0
        favoredindices(k) = favoredCost(j);
        k = k+1;
    end
end
favoredCombinationsBot = combinations(favoredindices);

% Plots Results
Plot_Pareto_Analysis(Pareto);
clear i j k favoredCost favoredScience