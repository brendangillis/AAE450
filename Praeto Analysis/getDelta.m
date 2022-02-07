function turnAngle = getDelta(rp,v_vec,mu)
vinf = norm(v_vec);
a = -mu/2/vinf^2;
e = 1 - rp/a;
turnAngle = 2*asind(1/e);
%sind(delta/2) = 1/e
end