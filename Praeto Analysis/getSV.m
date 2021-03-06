% Author: Aman Chokshi
% Generates the science values for given combinations

function SV = getSV(combinations)

payloads = struct("MAG",[0, 505, 13/19],"PLS",[0 1000 14/19],"PUI",[0 3000 13/19],"EPS",[0 500 9/19],"CRS",[0 500 8/19],"PWS",[0 50 11/19],"ENA",[250 1500 3/19],"IDA",[0 50 1/19],"NMS",[0 1 5/19],"LYA",[300 300 3/19]);

if combinations.Spin == "no"
    payloads.MAG(2) = 0;
    payloads.PLS(2) = 0;
    payloads.PUI(2) = 0;
    payloads.EPS(2) = 0;
    payloads.CRS(2) = 0;
    payloads.ENA(2) = 0;
    payloads.LYA(2) = 0;
end

returnRate = 1; %Return rate standard
DL = 50; %Design Life years

propInfo = getPropInfo(combinations); %Determines propulsion information

timeTo250 = timeToHP(combinations,propInfo,250);
timeTo300= timeToHP(combinations,propInfo,300);
timeTo120 = timeToHP(combinations,propInfo,120);

    if combinations.Payload == "all"
        totalAcquisition = 7406; %Data Acquisition Rate of all Payloads [bps]
        %Determines Science Value for combination
        SV = (returnRate/totalAcquisition)*(payloads.MAG(2)*payloads.MAG(3)*(DL-timeTo120)/DL+payloads.PLS(2)*payloads.PLS(3)*(DL-timeTo120)/DL+payloads.PUI(2)*payloads.PUI(3)*(DL-timeTo120)/DL+payloads.EPS(2)*payloads.EPS(3)*(DL-timeTo120)/DL+payloads.CRS(2)*payloads.CRS(3)*(DL-timeTo120)/DL+payloads.PWS(2)*payloads.PWS(3)*(DL-timeTo120)/DL+payloads.ENA(2)*payloads.ENA(3)*(DL-timeTo250)/DL+payloads.IDA(2)*payloads.IDA(3)*(DL-timeTo120)/DL+payloads.NMS(2)*payloads.NMS(3)*(DL-timeTo120)/DL+payloads.LYA(2)*payloads.LYA(3)*(DL-timeTo300)/DL);
    elseif combinations.Payload == "partial"
%         totalAcquisition = 5606; %Data Acquisition Rate of all ENA/LYA descope [bps]
 totalAcquisition = 7406; %Data Acquisition Rate of all Payloads [bps]        
%Determines Science Value for combination
        SV = (returnRate/totalAcquisition)*(payloads.MAG(2)*payloads.MAG(3)*(DL-timeTo120)/DL+payloads.PLS(2)*payloads.PLS(3)*(DL-timeTo120)/DL+payloads.PUI(2)*payloads.PUI(3)*(DL-timeTo120)/DL+payloads.EPS(2)*payloads.EPS(3)*(DL-timeTo120)/DL+payloads.CRS(2)*payloads.CRS(3)*(DL-timeTo120)/DL+payloads.PWS(2)*payloads.PWS(3)*(DL-timeTo120)/DL+payloads.IDA(2)*payloads.IDA(3)*(DL-timeTo120)/DL+payloads.NMS(2)*payloads.NMS(3)*(DL-timeTo120)/DL);
    elseif combinations.Payload == "max"
%         totalAcquisition = 5006; %Data Acquisition Rate with partial descoping of ENA, LYA, IDA, PWS, EPS due to weight and objective overlap [bps]
         totalAcquisition = 7406; %Data Acquisition Rate of all Payloads [bps]        
%Determines Science Value for combination
        SV = (returnRate/totalAcquisition)*(payloads.MAG(2)*payloads.MAG(3)*(DL-timeTo120)/DL+payloads.PLS(2)*payloads.PLS(3)*(DL-timeTo120)/DL+payloads.PUI(2)*payloads.PUI(3)*(DL-timeTo120)/DL+payloads.CRS(2)*payloads.CRS(3)*(DL-timeTo120)/DL+payloads.NMS(2)*payloads.NMS(3)*(DL-timeTo120)/DL);
    end


end