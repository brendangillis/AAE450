function v_inf = getC3(propinfo)

% inputs: Propinfo
% propinfo.mPay = Payload mass (kg)
% propinfo.mProp = Propellant mass (kg)
% propinfo.mInert = inert mass (kg)
% propinfo.isp = Specific Impulse (seconds)

% output: 
% v_inf = Ending velocity of spacecraft after (km/s)

g = 0.00981; % gravitational constant of earth (km/s^2)
mu = 3.896 * 10^5; % Gravitational parameter of earth (km^3 / s^-2)
r = 500 + 6378.1; % Radius of the earth plus the desired low earth orbit altitude (km)

mi  = propinfo.mPay + propinfo.mInert + propinfo.mProp; % Initial mass calculation prior to burn maneuver (kg)
mf = propinfo.mInert + propinfo.mPay; % Final mass calculation after burn maneuver (kg)

dv = g * propinfo.isp * log(mi / mf); % Delta V calculation for candidate architecture

v_esc = sqrt(2 * mu / r); % Escape velocity 

v = dv + v_esc; % total velocity calculation (km/s)

C3 = v^2 - 2 * mu / r; % Characteristic energy calulation 

v_inf = sqrt(C3); % Velocity at infinite radius calculation (km/s)
end
