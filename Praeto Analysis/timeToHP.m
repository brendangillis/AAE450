function timeToHP(candidateArchitecture, propinfo, distance)
    Vinf = getC3(candidateArchitecture, propinfo);
    jupiter_dist = 588000000;
    desire_dist = distance*1.496e8;
    if(candidateArchitecture.Prop == "chem" && cadidateArchitecture.Gravity == "none")
        tHP = Vinf/desire_dist;
    elseif(candidateArchitecture.Prop == "chem" && cadidateArchitecture.Gravity == "jupiter")
        tJ = Vinf/jupiter_dist;
        vAfter = gravityAssist(candidateArchitecture.Gravity, arrivalFPA, arrivalV);
        tAfter = vAfter/desire_dist;
        tHP = tJ + tAfter;
    elseif(candidateArchitecture.Prop == "sail" && candidateArchitecture.Gravity == "none")
        vSail = 70; %Estimation based on "Penn State GPL Paper"
        tHP = vSail/desire_dist;
    elseif(candidateArchitecture.Prop == "sail" && candidateArchitecture.Gravity == "jupiter")
        vSail = 70; %Estimation based on "Penn State GPL Paper"
        tJ = vSail/jupiter_dist;
        vAfter = gravityAssist(candidateArchitecture.Gravity, arrivalFPA, arrivalV);
        tAfter = vAfter/desire_dist;
        tHP = tJ + tAfter;
    elseif(candidateArchitecture.Prop == "elec" && candidateArchitecture.Gravity == "none")
        vElec = 11.5; %Estimation based on Dawn spacecraft (From Wikipedia)
        tHP = vElec/desire_dist;
    elseif(candidateArchitecture.Prop == "elec" && candidateArchitecture.Gravity == "jupiter")
        vElec = 11.5; %Estimation based on Dawn spacecraft (From Wikipedia)
        tJ = vElec/jupiter_dist;
        vAfter = gravityAssist(candidateArchitecture.Gravity, arrivalFPA, arrivalV);
        tAfter = vAfter/desire_dist;
        tHP = tJ + tAfter;
    elseif(candidateArchitecture.Prop == "nuc" && candidateArchitecture.Gravity == "none")
        vNuc = 15; %Estimation based on delta V values from chemical and electric
        tHP = vNuc/desire_dist;
    elseif(candidateArchitecture.Prop == "nuc" && candidateArchitecture.Gravity == "jupiter")
        vNuc = 15; %Estimation based on delta V values from chemical and electric
        tJ = vNuc/jupiter_dist;
        vAfter = gravityAssist(candidateArchitecture.Gravity, arrivalFPA, arrivalV);
        tAfter = vAfter/desire_dist;
        tHP = tJ + tAfter;
    end
end
        
        
        
        