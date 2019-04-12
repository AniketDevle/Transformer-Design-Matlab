function [ Turns_primary , Turns_secondary , Area_of_one_conductor_primary , Area_of_one_conductor_secondary  ,Current_primary ,Current_secondary , phase_voltage_primary , phase_voltage_secondary ] = LV_HV_Design(  KVA ,  Current_Density , Primary_voltage , Secondary_voltage , Phases , Et , Hw , Wc )



disp(' Lv & HV winding Design \n\n')


 LV = min(Primary_voltage , Secondary_voltage)
 HV = max(Primary_voltage , Secondary_voltage)

 
 
 %% Calculating  Phase Voltage of LV and HV
 
 if (Phases == 3)
        LV_type = input("Press 1 if LV Winding is Star\nPress 2 if LV Winding is Delta :")
        HV_type = input("Press 1 if HV Winding is Star\nPress 2 if HV Winding is Delta : ")
        if (LV_type == 1)
            LV_phase = LV/sqrt(3)
        elseif (LV_type == 2)
            LV_phase = LV
        end    
 
        if (HV_type == 1)
            HV_phase = HV/sqrt(3)
        elseif (HV_type == 2)
            HV_phase = HV
        end    
 else
     LV_phase = LV
     HV_phase = HV
 end
 
 %% Lv DESIGN
 
 % here I have considered that the input of lv and Hv winding will be given seperately

  Turns_LV = LV_phase / Et
  
  Current_LV = KVA /(3 *  LV_phase)
  
  Area_of_one_conductor_LV = Current_LV / Current_Density

  Area_of_conductor_LV = 2*Area_of_one_conductor_LV * Turns_LV
  
  %Considering the gap between the yoke and the Lv Winding to be 7.5mm
  
  Length_of_LV_winding = Hw - 0.015 
  
  Width_of_LV_winding = Area_of_conductor_LV /(2* Length_of_LV_winding)
  
  %considering the distance between the core and the LV winding to be 12mm 
  
  Inner_Distance_between_LV = Wc + 2*0.012
  
  Outer_Distance_between_LV = Wc + 2*0.012 + 2* Width_of_LV_winding
  
  
  %% HV DESIGN
  
  Turns_HV = HV_phase / Et
  
  Current_HV = KVA /(3 *  HV_phase)
  
  Area_of_one_conductor_HV = Current_HV / Current_Density
  
  Area_of_conductor_HV = 2 * Area_of_one_conductor_HV * Turns_HV
  
  
  %% turns  primary and secondary 
  % Here we want to check whether the Lv winding is a primary winding or
  % secondary winding and same for Hv winding as the calculation of the all
  % other components are in primary and secondary format and not Lv and Hv
  % format.
  
  if(LV == Primary_voltage)
      Turns_primary   = Turns_LV;
      Turns_secondary = Turns_HV;
      Area_of_one_conductor_primary =  Area_of_one_conductor_LV;
      Area_of_one_conductor_secondary =  Area_of_one_conductor_HV;
      Current_primary = Current_LV;
      Current_secondary = Current_HV;
      phase_voltage_primary = LV_phase;
      phase_voltage_secondary = HV_phase;
  else 
      Turns_primary   = Turns_HV;
      Turns_secondary = Turns_LV;
      Area_of_one_conductor_primary =  Area_of_one_conductor_HV;
      Area_of_one_conductor_secondary =  Area_of_one_conductor_LV;
      Current_primary = Current_HV;
      Current_secondary = Current_LV;
      phase_voltage_primary = HV_phase;
      phase_voltage_secondary = LV_phase;
  end 
  