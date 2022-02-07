% AAE 450 Praeto Analysis
% PraetoMain.m
% Author: Josh O'Meara
% Assigns the praeto scores to each architecture

combinations = generateCombinations();

ca(length(combinations),1) = struct('arch', [], 'cost', [], 'science', [], 'reliability', []);

costs = getCost(combinations);
sciences = getSV(combinations);
reliabilities = getReliability(coombinations);

for i = (1:length(combinations))
    structure = struct('arch', combinations(i), 'cost', 0, 'science', 0, 'reliability', 0);
    
    structure.cost = costs(i);
    structure.science = sciences(i);
    structure.reliability = reliabilities(i);
    
    ca(i) = structure;
end