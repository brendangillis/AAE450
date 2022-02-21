function [v] = GetPlanetVec(planetName,mew)

a_Jup = get_a(planetName);
e_Jup = 0;
r = a_Jup; % Circular Radius
muSun = 1327e8;

v_Scal = sqrt(muSun/r); % Circular Velocity
% FPA = acosd(sqrt(mew*a_Jup*(1-e_Jup^2))/(r*v_Scal)); %For non-circular orbits
FPA = 0;
v = [0 v_Scal 0];
end