function departureV = gravityAssist(planetName, arrivalFPA, arrivalV)
%none, jupiter, 
if planetName == "none"
    departureV = arrivalV;
else
    v_vec = [sind(arrivalFPA) * arrivalV, cosd(arrivalFPA)*arrivalV,0];%r,theta,h
    mu = getMu(planetName);
    planetRadius = getPlanetRadius(planetName);
    rp = planetRadius * 2;
    planetVec = GetPlanetVec(planetName,mu);
    turnAngle = getDelta(rp,v_vec - planetVec,mu);
    vaf = doGrav(v_vec,mu,turnAngle,planetVec);
    departureV = norm(vaf);
end


end
