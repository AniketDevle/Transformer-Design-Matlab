function [Total_Leakage_reactance_referred_primary , Total_resistance_referred_primary ] = Leakage_reactance(Frequency ,Turns_primary , Turns_secondary , Area_of_one_conductor_primary , Area_of_one_conductor_secondary)


disp('Calculation of Leakage_reactance \n \n')

Length_mean_turn_primary = input('Enter Length Mean turn of primary : ');

Length_mean_turn_Secondary = input('Enter Length Mean turn of Secondary : ');

Length_mean_turn_overall = mean([Length_mean_turn_primary ,Length_mean_turn_Secondary ])

Lc = input('Enter Length of coil :  ');

bp = input('Enter Thickness of primary :  ');

bs = input('Enter Thickness of Secondary : ');

a = input('Enter Width of duct');

rho = input('Enter resistivity of winding : ');



%% Calculating Leakage reactance Primary

Leackage_reactance_primary = 2 * pi * Frequency * 4 * pi *(10.^(-7))* Turns_primary * Turns_primary*(Length_mean_turn_overall/Lc) * (bp/3 + a/2)

%% calculating Leakage reactance secondary

Leackage_reactance_secondary = 2 * pi * Frequency * 4 * pi *(10.^(-7))* Turns_secondary * Turns_secondary *(Length_mean_turn_overall/Lc) * (bs/3 + a/2)

%% Calculating Overall Leakage reactance referred to primary 

Total_Leakage_reactance_referred_primary = 2 * pi * Frequency * 4 * pi *(10.^(-7))* Turns_primary * Turns_primary*(Length_mean_turn_overall/Lc) * (bp/3 + a/2 + bs/3)


%% Calculating Resistance of Primary Winding

Resistance_primary = (rho * Turns_primary * Length_mean_turn_primary)/ Area_of_one_conductor_primary ;


%% Calculating Resistance of Secondary Winding 

Resistance_secondary = (rho *Turns_secondary * Length_mean_turn_Secondary ) / Area_of_one_conductor_secondary;


%% Calculating Overall Resistance of Secondary Winding Referred to primary

Total_resistance_referred_primary = Resistance_primary + (Turns_primary/Turns_secondary)^2 * Resistance_secondary; 


