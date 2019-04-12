function [Total_heat_dissipated , Dissipation ,Number_of_tubes] = Tank_design()

Cooling_surface_area = input('Enter the Area of the cooling Surface');

x = input('Enter the value of X ie ratio between \n surface area after inclusion of tubes and Cooling surface area');

length_tube = input('Enter the height of Tube');
%% Cooling Surface will dissipate 

Cooling_surface_dissipate = ( 6 + 6.5 )* Cooling_surface_area;


%% Calculating Tube Surface area

Tube_surface_area = (x-1) * Cooling_surface_area;


%% Total Heat Dissipated = head dissipated because of conduction + head dissipated because of convection

Total_heat_dissipated = Cooling_surface_dissipate + Tube_surface_area * 6.5 * 1.35;


%% Calculating Disspation 

Dissipation = (3.72/x + 8.78);


%% Wall area of each tube 

Wall_area_of_each_tube = pi * 0.050 * length_tube ; 


%% Number of Tubes 
 
Number_of_tubes = Tube_surface_area / Wall_area_of_each_tube ;  