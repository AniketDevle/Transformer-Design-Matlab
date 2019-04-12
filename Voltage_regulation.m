function[Voltage_reg] = Voltage_regulation (Current_primary , phase_voltage_primary  , Total_Leakage_reactance_referred_primary , Total_resistance_referred_primary )

disp('Voltage Regulation Calculation \n \n');

cos_theta = input('Enter the valuw of power factor');

sin_theta = sqrt(1-cos_theta^2);

%% Calculating Er

Er = (Current_primary *  Total_resistance_referred_primary ) / phase_voltage_primary ;

%% Calculating Ex

Ex = ( Current_primary * Total_Leakage_reactance_referred_primary ) / phase_voltage_primary;


%% Calculating Voltage Regulation 


Voltage_reg = Er * cos_theta + Ex * sin_theta ;


