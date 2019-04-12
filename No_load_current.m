function [Io ,Magnetic_VA ] = No_load_current(Bm , Ai ,Turns_primary , Phases , phase_voltage_primary , Frequency)

disp('No Load Current Calculation \n \n' );

li = input('Enter the Length of iron : ' );

density = input ('Enter the density of the iron ');

Loss_per_kg = input('Enter loss per kg of iron ');

ATo = (li * Bm * Ai)/(4 * pi * 10^(-7) * Ai) 

%% Calculating Magnetizing Current Im 

Im = ATo /(sqrt(2) * Turns_primary)


%% Calculating weight of iron 

Weight_of_iron = Ai * li * density;

%% Calculating  Pi

Pi = Weight_of_iron * Loss_per_kg ;

%% Calculating Loss Component IL

if Phases == 3
    IL = Pi/(3 * phase_voltage_primary);
else 
    IL = Pi/phase_voltage_primary;
end

%% Calculating No load Current

Io = sqrt(Im ^ 2 + IL ^2 )

%% calculating Magnetic VA

Magnetic_VA = 4.44 * Frequency * Bm *Ai * ATo / (sqrt(2))
    
