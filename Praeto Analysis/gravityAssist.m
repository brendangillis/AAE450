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

function turnAngle = getDelta(rp,v_vec,mu)

vinf = norm(v_vec);
a = -mu/2/vinf^2;
e = 1 - rp/a;
turnAngle = 2*asind(1/e)
%sind(delta/2) = 1/e

end


function vaf = doGrav(v_vec,mu,turnAngle,jupVec)
v_rel_minus = v_vec - jupVec;
%vinf = norm(v_rel_minus);
%rotation matrix
A = [cosd(turnAngle) sind(turnAngle) 0; -sind(turnAngle) cosd(turnAngle) 0; 0 0 1];
v_rel_plus = (A*v_rel_minus');
vaf = v_rel_plus + jupVec;
%sind(delta/2) = 1/e
end

function mu = getMu(name)

if name == "Earth"
    mu = 3.986e5;%km^3/s^2
elseif name == "Sun"
    mu = 1.327e11;
elseif name == "Jupiter"
    mu = 1.26686e8;
elseif name == "Pluto"
    mu = 8.71e2;
elseif name == "Venus"
    mu = 3.248e5;
elseif name == "Mercury"
    mu = 2.203e4;
elseif name == "Moon"
    mu = 4.905e3;
elseif name == "Mars"
    mu = 4.282e4;
elseif name == "Saturn"
    mu = 3.793e7;
elseif name == "Uranus"
    mu = 5.7939e6;
elseif name == "Neptune"
    mu = 6.836e6;
end

end

function planetRadius = getPlanetRadius(name)

if name == "Mercury"
    D = 4879;
elseif name == "Venus"
    D = 12014;
elseif name == "Earth"
    D = 12756;
elseif name == "Moon"
    D = 3475;
elseif name == "Mars"
    D = 6792;
elseif name == "Jupiter"
    D = 142984;
elseif name == "Saturn"
    D = 120536;
elseif name == "Uranus"
    D = 51118;
elseif name == "Neptune"
    D = 49528;
elseif name == "Pluto"
    D = 2376;
end
planetRadius = D/2;

end

function [v] = GetPlanetVec(planetName,mew)

a_Jup = get_a(planetName);
e_Jup = 0;
r = a_Jup; % Circular Radius
muSun = 1327e8;

v_Scal = sqrt(muSun/r); % Circular Velocity
FPA = acosd(sqrt(mew*a_Jup*(1-e_Jup^2))/(r*v_Scal));
FPA = 0;
v = [0 v_Scal 0];
end
