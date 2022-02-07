function vaf = doGrav(v_vec,mu,turnAngle,jupVec)
v_rel_minus = v_vec - jupVec;
%vinf = norm(v_rel_minus);
%rotation matrix
A = [cosd(turnAngle) sind(turnAngle) 0; -sind(turnAngle) cosd(turnAngle) 0; 0 0 1];
v_rel_plus = (A*v_rel_minus');
vaf = v_rel_plus + jupVec;
%sind(delta/2) = 1/e
end