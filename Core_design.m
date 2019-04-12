 
function [Et , Hw , Wc , Ai ] = Core_design(KVA , Phases , Frequency , Primary_voltage , Secondary_voltage , Bm , Ks , Current_Density , Height_width_ratio , Stepping , Transformer_type ,Type)



disp('Core Design \n \n ')


% K for calculating Emf per turn% 
%Emf per turn = K * sqrt(KVA rating )%

K = {' Type ' ,' K value ' ; 'Single phase Shell type' , 1.0 ; 'Single phase core type ' ,   0.75 ;'Three phase Core Distribution type ',  0.45 ; 'Three phase core Power type ' , 0.6} ;

%Stepping Chart%

Step = {'No of steps' , 'Ke' ; 'Square' , 0.45 ; '2 Step' , 0.56 ; '3 Step' , 0.6 ; '4 Step' , 0.62};

%% Calculating EMF per Turn
 
z = Transformer_type + 1 ;

Et =  cell2mat(K(z , 2)).*(sqrt(KVA))

%% Calculating the Area of Core 

Ai = Et/(4.44 * Bm * Frequency)

%% Calculating the Diameter of Circumscribing Circle


d = sqrt(Ai/cell2mat(Step(Stepping + 1 , 2)))

%% Calculating Window Space Factor

Kw = 0;
if KVA< 10
    Kw = 8/(30 + max(Primary_voltage ,Secondary_voltage )/1000 );
elseif KVA < 250
    Kw = 10/(30 + max(Primary_voltage ,Secondary_voltage )/1000 );
else 
    Kw = 12/(30 + max(Primary_voltage ,Secondary_voltage )/1000 );
end    
disp("Kw =")
disp (Kw)


%% Calculating Gross Cross Section Area

Agi = Ai / Ks 

%% Calculating Window Area

if (Transformer_type == 1 || Transformer_type == 2)
    Factor = 2.22;
elseif (Transformer_type == 3)
    Factor = 3.33;
else 
    Factor = 6.66;
end 

Aw = KVA / (Ai * Kw * Frequency * Bm * Current_Density * 1000)


%% Calculating Height Hw and width Ww of the Window

Ww = sqrt(Aw/Height_width_ratio)

Hw = Height_width_ratio * Ww


%% Calculating Area of Yoke (Ay)



if Type == 1
    Ay = 1.15 * Ai
elseif Type == 2
    Ay = Ai
else
    disp("Wrong input")
end


%% Calculating Height of yoke (Hy) and Width of Core (Wc)

if Stepping == 1
    Wc = 0.7 * d
    Hy = 0.7 * d
elseif Stepping == 2
    Wc = 0.85 * d
    Hy = 0.85 * d
else 
    Wc = 0.9 * d
    Hy = 0.9 * d
end



%% Calculating Overall Dimensions of the Transformer 

if Transformer_type == 1
    Width_of_transformer = 2 * Ww + 4 * Wc
    Height_of_transformer = Hw + 2 * Hy
elseif Transformer_type == 2
    Width_of_transformer =  Ww + 2 * Wc
    Height_of_transformer = Hw + 2 * Hy 
elseif Transformer_type == 3 || Transformer_type == 4
    Width_of_transformer = 2 * Ww + 3 * Wc
    Height_of_transformer = Hw + 2 * Hy    
end



 
 
 