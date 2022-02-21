function [a] = get_a(name)
% Semi-Major Axis of Planet around central body in km
if name == "moon"
    a = 384400; % Around Earth
elseif name == "mercury"
    a = 57909101;
elseif name == "venus"
    a = 108207284;
elseif name == "mars"
    a = 227944135;
elseif name == "jupiter"
    a = 778279959;
elseif name == "saturn"
    a = 1427387908;
elseif name == "uranus"
    a = 2870480873;
elseif name == "neptune"
    a = 4498337290;
elseif name == "pluto"
    a = 5907150229;
else
    fprintf('Input a Valid Planet (Not Earth)')
end

end

