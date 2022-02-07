function mu = getMu(name)

if name == "earth"
    mu = 3.986e5;%km^3/s^2
elseif name == "sun"
    mu = 1.327e11;
elseif name == "jupiter"
    mu = 1.26686e8;
elseif name == "pluto"
    mu = 8.71e2;
elseif name == "venus"
    mu = 3.248e5;
elseif name == "mercury"
    mu = 2.203e4;
elseif name == "moon"
    mu = 4.905e3;
elseif name == "mars"
    mu = 4.282e4;
elseif name == "saturn"
    mu = 3.793e7;
elseif name == "uranus"
    mu = 5.7939e6;
elseif name == "neptune"
    mu = 6.836e6;
end