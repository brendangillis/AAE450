% Author: Aman Chokshi
% Generates the science values for given combinations

function SV = getSV(combinations)

SV = zeros(size(combinations,1),1); %Initialize Science Value
timeTo250 = zeros(size(combinations,1),1); %Initialize time to given AU
timeTo300 = zeros(size(combinations,1),1); %Initialize time to given AU
timeTo120 = zeros(size(combinations,1),1); %Initialize time to given AU

payloads = struct("MAG",[0, 505, 13/19],"PLS",[0 1000 14/19],"PUI",[0 3000 13/19],"EPS",[0 500 9/19],"CRS",[0 500 8/19],"PWS",[0 50 11/19],"ENA",[250 1500 3/19],"IDA",[0 50 1/19],"NMS",[0 1 5/19],"LYA",[300 300 3/19]);
returnRate = 150; %Return rate of 150 bps of Voyager
DL = 50; %Design Life in Years

propInfo = getPropInfo(combinations); %Determines propulsion information

for i = 1:size(combinations,1)
    timeTo250(i) = timeToHP(combinations(i),propInfo(i),250);
    timeTo300(i)= timeToHP(combinations(i),propInfo(i),300);
    timeTo120(i) = timeToHP(combinations(i),propInfo(i),120);
    if combinations(i).Payload == "all"
        totalAcquisition = 7406; %Data Acquisition Rate of all Payloads [bps]
        %Determines Science Value for combination
        SV(i) = (returnRate/totalAcquisition)*(payloads.MAG(2)*payloads.MAG(3)*(DL-timeTo120(i))+payloads.PLS(2)*payloads.PLS(3)*(DL-timeTo120(i))+payloads.PUI(2)*payloads.PUI(3)*(DL-timeTo120(i))+payloads.EPS(2)*payloads.EPS(3)*(DL-timeTo120(i))+payloads.CRS(2)*payloads.CRS(3)*(DL-timeTo120(i))+payloads.PWS(2)*payloads.PWS(3)*(DL-timeTo120(i))+payloads.ENA(2)*payloads.ENA(3)*(DL-timeTo250)+payloads.IDA(2)*payloads.IDA(3)*(DL-timeTo120(i))+payloads.NMS(2)*payloads.NMS(3)*(DL-timeTo120(i))+payloads.LYA(2)*payloads.LYA(3)*(DL-timeTo300));
    elseif combinations(i).Payload == "partial"
        totalAcquisition = 5606; %Data Acquisition Rate of all ENA/LYA descope [bps]
        %Determines Science Value for combination
        SV(i) = (returnRate/totalAcquisition)*(payloads.MAG(2)*payloads.MAG(3)*(DL-timeTo120(i))+payloads.PLS(2)*payloads.PLS(3)*(DL-timeTo120(i))+payloads.PUI(2)*payloads.PUI(3)*(DL-timeTo120(i))+payloads.EPS(2)*payloads.EPS(3)*(DL-timeTo120(i))+payloads.CRS(2)*payloads.CRS(3)*(DL-timeTo120(i))+payloads.PWS(2)*payloads.PWS(3)*(DL-timeTo120(i))+payloads.IDA(2)*payloads.IDA(3)*(DL-timeTo120(i))+payloads.NMS(2)*payloads.NMS(3)*(DL-timeTo120(i)));
    elseif combinations(i).Payload == "max"
        totalAcquisition = 5006; %Data Acquisition Rate with partial descoping of ENA, LYA, IDA, PWS, EPS due to weight and objective overlap [bps]
        %Determines Science Value for combination
        SV(i) = (returnRate/totalAcquisition)*(payloads.MAG(2)*payloads.MAG(3)*(DL-timeTo120(i))+payloads.PLS(2)*payloads.PLS(3)*(DL-timeTo120(i))+payloads.PUI(2)*payloads.PUI(3)*(DL-timeTo120(i))+payloads.CRS(2)*payloads.CRS(3)*(DL-timeTo120(i))+payloads.NMS(2)*payloads.NMS(3)*(DL-timeTo120(i)));
    end
end


end