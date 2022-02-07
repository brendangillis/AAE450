function planetRadius = getPlanetRadius(name)

if name == "mercury"
    D = 4879;
elseif name == "venus"
    D = 12014;
elseif name == "earth"
    D = 12756;
elseif name == "moon"
    D = 3475;
elseif name == "mars"
    D = 6792;
elseif name == "jupiter"
    D = 142984;
elseif name == "saturn"
    D = 120536;
elseif name == "uranus"
    D = 51118;
elseif name == "neptune"
    D = 49528;
elseif name == "pluto"
    D = 2376;
end
planetRadius = D/2;

end