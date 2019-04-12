%%main file 

KVA  = (input("Enter KVA Rating :"));
Phases = (input("Enter number of phases :"));
Frequency  = (input("Enter frequency of machine :"));
Primary_voltage = (input("Enter primary Voltage of Transformer :"));
Secondary_voltage = (input ("Enter Secondary Voltage of Transformer :"));

Bm = input("Enter the value of maximum flux Density :");

Ks = input("Enter the stacking factor");

Current_Density = input("Eneter the Current Density Value");

Height_width_ratio = input ("Enter the Height to width ratio of transformer");

Stepping = input(" Press 1 for Square stepping \nPress 2 for 2 Step \nPress 3 for 3 Step \nPress 4 for 4 Steps :")

Transformer_type = input ("Choose 1 for Single phase Shell type \nChoose 2 for Single phase core type \nChoose 3 for Three phase Core Distribution type \nChoose 4 for Three phase core Power type :" );

Type = input("Press 1 for HRC \nPress 2 for CRGO");



%% we want the values of turns ratio , height of window , Width of core for LV and HV Design 
[Et , Hw , Wc  , Ai] = Core_design(KVA , Phases , Frequency , Primary_voltage , Secondary_voltage , Bm , Ks , Current_Density , Height_width_ratio , Stepping , Transformer_type ,Type);


%% we want the values of Turns of primary and secondary for calculating the leakage reactance of the 
[ Turns_primary , Turns_secondary , Area_of_one_conductor_primary , Area_of_one_conductor_secondary , Current_primary ,Current_secondary ,phase_voltage_primary , phase_voltage_secondary ] = LV_HV_Design(  KVA ,  Current_Density , Primary_voltage , Secondary_voltage , Phases , Et , Hw , Wc );


%%  we want Total leackage reactance and resistance for calculating the Voltage regulation
[Total_Leakage_reactance_referred_primary , Total_resistance_referred_primary ] = Leakage_reactance(Frequency ,Turns_primary , Turns_secondary , Area_of_one_conductor_primary , Area_of_one_conductor_secondary) 


%% Calculating Voltage Regulation 

 Voltage_reg = Voltage_regulation (Current_primary , phase_voltage_primary  , Total_Leakage_reactance_referred_primary , Total_resistance_referred_primary )

%% No Load Current Calculation 

[Io ,Magnetic_VA ] = No_load_current(Bm , Ai ,Turns_primary , Phases , phase_voltage_primary , Frequency)




