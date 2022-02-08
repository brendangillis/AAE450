%Author: Aman Chokshi
%Driver Script for Pareto Analysis
clc; clear;

combinations = generateCombinations;

costs = zeros(size(combinations,1),1);
rels = zeros(size(combinations,1),1);
SVs = zeros(size(combinations,1),1);
archs(1:length(combinations)) = struct('arch', [], 'cost', [], 'science', [], 'reliability', []);

% Gets Cost, Science Value and Reliability for all combinations
for i = 1:length(combinations)
    cost = getCost(combinations(i));
    rel = getReliability(combinations(i));
    SV = getSV(combinations(i));
    
    archs(i).arch = combinations(i);
    archs(i).cost = cost;
    archs(i).reliability = rel;
    archs(i).science = SV;
    
    costs(i) = cost;
    rels(i) = rel;
    SVs(i) = SV;
end

Pareto = struct("cost",costs,"reliability",rels,"science",SVs);

%Determined best combinations
maxFavCost = -50;
minFavScience = .38;
% maxFavScience = .4; %Purely for trying to isolate specific architectures. Doesn't factor into pareto
minFavReliability = .9;

favoredArch(1:length(combinations)) = struct('arch', [], 'cost', 0, 'science', 0, 'reliability', 0);
numFavArch = 1;
for j = 1:length(archs)
    if (archs(j).cost < maxFavCost && archs(j).science > minFavScience && archs(j).reliability > minFavReliability)
%     if (archs(j).cost < maxFavCost && archs(j).science > minFavScience && archs(j).reliability > minFavReliability && archs(j).science < maxFavScience)
        favoredArch(numFavArch).arch = archs(j).arch;
        favoredArch(numFavArch).cost = archs(j).cost;
        favoredArch(numFavArch).science = archs(j).science;
        favoredArch(numFavArch).reliability = archs(j).reliability;
        numFavArch = numFavArch + 1;
    end
end
favoredArch = favoredArch(1:numFavArch-1);

% Plots Results
Plot_Pareto_Analysis(Pareto);
clear i j k favoredCost favoredScience

%Calculates how much each decision influences the cost, science, and rel
analysis = analyzeArchDescisions(archs);

%Calculates the average change in cost, science, and rel for each decision
costEffects = zeros(8);
scienceEffects = zeros(8);
relEffects = zeros(8);
for i = (1:length(analysis))
    numOptions = length(analysis(i).costEffect);
    costEffects(i) = sum(abs(analysis(i).costEffect)) / (numOptions - 1);
    scienceEffects(i) = sum(abs(analysis(i).scienceEffect)) / (numOptions - 1);
    relEffects(i) = sum(abs(analysis(i).relEffect)) / (numOptions - 1);
end

%Normalizes the above effects by the max, turning them into percentages
costEffects = costEffects / max(costEffects);
scienceEffects = scienceEffects / max(scienceEffects);
relEffects = relEffects / max(relEffects);

figure(4)
t = tiledlayout(1,3,'Padding','compact', 'TileSpacing', 'compact');
labels = {'Staging', 'Propulsion', 'Gravity', 'Com', 'Spin', 'LV', 'Power', 'Payload'};
explode = [1,1,1,1,1,1,1,1];
t.Title.String = "Influence of Decisions on Pareto Values";

t1 = nexttile;
t1.Colormap = colormap(jet(8));
pie(t1, costEffects, explode);
t2 = nexttile;
t2.Colormap = colormap(jet(8));
p2 = pie(t2, scienceEffects, explode);
lgd = legend(labels);
lgd.Location = 'south';
lgd.Orientation = 'horizontal';
t3 = nexttile;
t3.Colormap = colormap(jet(8));
pie(t3, relEffects, explode);