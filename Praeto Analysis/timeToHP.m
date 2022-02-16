function tHP = timeToHP(candidateArchitecture, propinfo, distance)
    Vinf = getC3(propinfo);

   if candidateArchitecture.Staging == "single"
        Vinf = Vinf + 8;
   elseif candidateArchitecture.Staging == "mult"
       Vinf = Vinf+10;
   end

    jupiter_dist = 588000000;
    desire_dist = distance*1.496e8;
    arrivalFPA = 10; %ArrivalFPA in degrees
       if(candidateArchitecture.Prop == "chem" && candidateArchitecture.Gravity == "none")
        tHP = 1/(Vinf/desire_dist);
    elseif(candidateArchitecture.Prop == "chem" && candidateArchitecture.Gravity == "jupiter")
        vChem = 10;%Estimation based on Falcon second stage Upper stage
        tJ = 1/(Vinf/jupiter_dist);
        arrivalV = Vinf + vChem;
        vAfter = gravityAssist(candidateArchitecture.Gravity, arrivalFPA, arrivalV);
        tAfter = 1/(vAfter/desire_dist);
        tHP = tJ + tAfter;
    elseif(candidateArchitecture.Prop == "sail" && candidateArchitecture.Gravity == "none")
        vSail = 14; %Estimation based on "Penn State GPL Paper"
        tHP = 1/(vSail/desire_dist);
    elseif(candidateArchitecture.Prop == "sail" && candidateArchitecture.Gravity == "jupiter")
        vSail = 14; %Estimation based on "Penn State GPL Paper"
        tJ = 1/((vSail/4)/jupiter_dist);
        arrivalV = Vinf + vSail/4;
        vAfter = gravityAssist(candidateArchitecture.Gravity, arrivalFPA, arrivalV);
        tAfter = 1/(vAfter/desire_dist);
        tHP = tJ + tAfter;
    elseif(candidateArchitecture.Prop == "elec" && candidateArchitecture.Gravity == "none")
        vElec = 13; %Estimation based on Dawn spacecraft (From Wikipedia) +more prop
        tHP = 1/(vElec/desire_dist);
    elseif(candidateArchitecture.Prop == "elec" && candidateArchitecture.Gravity == "jupiter")
        vElec = 13; %Estimation based on Dawn spacecraft (From Wikipedia) +more prop
        tJ = 1/(vElec/jupiter_dist);
        arrivalV = Vinf + vElec;
        vAfter = gravityAssist(candidateArchitecture.Gravity, arrivalFPA, arrivalV);
        tAfter = 1/(vAfter/desire_dist);
        tHP = tJ + tAfter;
    elseif(candidateArchitecture.Prop == "nuc" && candidateArchitecture.Gravity == "none")
        vNuc = 15; %Estimation based on delta V values from chemical and electric
        tHP = 1/(vNuc/desire_dist);
    elseif(candidateArchitecture.Prop == "nuc" && candidateArchitecture.Gravity == "jupiter")
        vNuc = 15; %Estimation based on delta V values from chemical and electric
        tJ = 1/(vNuc/jupiter_dist);
        arrivalV = Vinf + vNuc;
        vAfter = gravityAssist(candidateArchitecture.Gravity, arrivalFPA, arrivalV);
        tAfter = 1/(vAfter/desire_dist);
        tHP = tJ + tAfter;
    end

     tHP = tHP/3.154e+7; %Time to Heliopause [years]
end
         
