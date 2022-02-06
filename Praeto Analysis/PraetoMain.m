% AAE 450 Praeto Analysis
% PraetoMain.m
% Author: Josh O'Meara
% Assigns the praeto scores to each architecture

combinations = generateCombinations();

ca(length(combinations),1) = struct('arch', [], 'cost', [], 'science', [], 'reliability', []);

for i = (1:length(combinations))
    structure = struct('arch', combinations(i), 'cost', 0, 'science', 0, 'reliability', 0);
    
    structure.cost = getCost(structure.arch);
    structure.science = getScience(structure.arch);
    structure.reliability = getReliability(structure.arch);
    
    ca(i) = structure;
end