% AAE 450 Praeto Analysis
% generateCombinations.m
% Author: Josh O'Meara
% Generates the combinations for the praeto analysis

function combinations = generateCombinations()
    Staging = ["none", "single", "mult"];
    Prop = ["chem", "sail", "elec", "nuc"];
    Gravity = ["none", "jupiter"];
    Com = ["laser", "Ka", "X"];
    Spin = ["no", "yes", "both"];
    LV = ["star", "sls", "div", "falcon"];
    Power = ["solar", "nuc", "both"];
    Payload = ["all", "partial", "max"];
    
    num_combinations = length(Staging) * length(Prop) * length(Gravity) * length(Com) * length(Spin) * length(LV) * length(Power) * length(Payload);
    combinations(num_combinations, 1) = struct("Staging", [], "Prop", [], "Gravity", [],...
                                               "Com", [], "LV", [], "Power", [], "Payload", []);
    num = 1;
    
    for s = (1:length(Staging))
        for pr = (1:length(Prop))
            for g = (1:length(Gravity))
                for c = (1:length(Com))
                    for sp = (1:length(Spin))
                        for lv = (1:length(LV))
                            for pw = (1:length(Power))
                                for pl = (1:length(Payload))
                                    arch = struct("Staging", Staging(s), "Prop", Prop(pr), "Gravity", Gravity(g),...
                                                  "Com", Com(c), "LV", LV(lv), "Power", Power(pw), "Payload", Payload(pl));
                                    combinations(num) = arch;
                                    num = num + 1;
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end