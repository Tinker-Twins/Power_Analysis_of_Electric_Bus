%% Power Analysis of Electric Bus

% *Authors:* Tanmay Samak and Chinmay Samak
%%
% 
% <<Free_Body_Diagram.PNG>>
% 
%
%%

% Physical Parameters

mass_bus = 16.2E3; % mass of bus (kg)
mass_person = 75; % average mass of each person (kg)
slope_deg = 30; % slope of the hill (deg)
slope = deg2rad(slope_deg); % slope of the hill (rad)
driver_count = 1; % driver count (#)
u = 0.4; % coeff. of friction
r = 0.45; % wheel radius (m)
s = 50; % speed of the bus (km/h)
v = s * (1000/3600); % speed of the bus (m/s)

% Motor Parameters

p = 4; % no. of poles (#)
Ra = 20E3; % armature resistance (ohm)
Ia = 5; % armature current (A)

%% Case 1: No Passengers

passenger_count = 0; % passenger count (#)

% Analysis

m = mass_bus + ((passenger_count + driver_count) * (mass_person)); % total mass (kg)
Fg = m * 9.81; % gravitational force
Fn = Fg * cos(slope); % normal force
Fl = Fg * sin(slope); % load force
Ff = u * Fn; % frictional force
Fm = Ff + Fl; % motor force
T = Fm * r; % torque
W = v/r; % angular velocity
P = T * W; % power
V = P/Ia; % terminal voltage
Eb = V - (Ia * Ra); % back emf
Is = V/Ra; % starting current
Ir = (V - Eb)/Ra; % rated current
Tr = T; % rated torque
k = Tr/Ia; % motor constant (k = p*phi*z/2*pi*A)
Ts = k * Is; % starting torque

if Is < 6 * Ir
    result = 'Starting current is within safe limits.';
else
    result = 'Starting current is NOT within safe limits.';
end
    
fprintf('-------------------------\nCase 1: No Passengers\n-------------------------\nPower = %.2f W\nStarting Current = %.2f A\nStarting Torque = %.2f N-m\nRated Current = %.2f A\nRated Torque = %.2f N-m\n%s\n', P, Is, Ts, Ir, Tr, result);

% Variable Weather Condtitions

u_array = [0.2 0.3 0.4 0.5 0.6 0.7 0.8]; % array of various coeff. of friction for different weather conditions
P_array = zeros(1,7); % empty array for power

for i=1:7
    m = mass_bus + ((passenger_count + driver_count) * (mass_person)); % total mass (kg)
    Fg = m * 9.81; % gravitational force
    Fn = Fg * cos(slope); % normal force
    Fl = Fg * sin(slope); % load force
    Ff = u_array(i) * Fn; % frictional force
    Fm = Ff + Fl; % motor force
    T = Fm * r; % torque
    W = v/r; % angular velocity
    P_array(i) = T * W; % power
end

figure('Name','Weather - Power Relation for Case 1','NumberTitle','off');
plot(u_array,P_array,'o -');
title('Weather - Power Relation for Case 1');
xlabel('Coeff. of Friction');
ylabel('Power (W)');

% Variable Wheel Radius

r_array = [0.35 0.4 0.45 0.5]; % array of various wheel radii (m)
P_array = zeros(1,4); % empty array for power

for i=1:4
    m = mass_bus + ((passenger_count + driver_count) * (mass_person)); % total mass (kg)
    Fg = m * 9.81; % gravitational force
    Fn = Fg * cos(slope); % normal force
    Fl = Fg * sin(slope); % load force
    Ff = u * Fn; % frictional force
    Fm = Ff + Fl; % motor force
    T = Fm * r_array(i); % torque
    W = v/r_array(i); % angular velocity
    P_array(i) = T * W; % power
end

figure('Name','Wheel Radius - Power Relation for Case 1','NumberTitle','off');
plot(r_array,P_array,'o -');
title('Wheel Radius - Power Relation for Case 1');
xlabel('Wheel Radius (m)');
ylabel('Power (W)');

% Variable Vehicle Speed

s_array = [30 40 50 60]; % array of various vehicle speeds (km/h)
v_array = s_array * (1000/3600); % array of various vehicle speeds (m/s)
P_array = zeros(1,4); % empty array for power

for i=1:4
    m = mass_bus + ((passenger_count + driver_count) * (mass_person)); % total mass (kg)
    Fg = m * 9.81; % gravitational force
    Fn = Fg * cos(slope); % normal force
    Fl = Fg * sin(slope); % load force
    Ff = u * Fn; % frictional force
    Fm = Ff + Fl; % motor force
    T = Fm * r; % torque
    W = v_array(i)/r; % angular velocity
    P_array(i) = T * W; % power
end

figure('Name','Vehicle Speed - Power Relation for Case 1','NumberTitle','off');
plot(s_array,P_array,'o -');
title('Vehicle Speed - Power Relation for Case 1');
xlabel('Vehicle Speed (km/h)');
ylabel('Power (W)');

%% Case 2: Half Passengers

passenger_count = 25; % passenger count (#)

% Analysis

m = mass_bus + ((passenger_count + driver_count) * (mass_person)); % total mass (kg)
Fg = m * 9.81; % gravitational force
Fn = Fg * cos(slope); % normal force
Fl = Fg * sin(slope); % load force
Ff = u * Fn; % frictional force
Fm = Ff + Fl; % motor force
T = Fm * r; % torque
W = v/r; % angular velocity
P = T * W; % power
V = P/Ia; % terminal voltage
Eb = V - (Ia * Ra); % back emf
Is = V/Ra; % starting current
Ir = (V - Eb)/Ra; % rated current
Tr = T; % rated torque
k = Tr/Ia; % motor constant (k = p*phi*z/2*pi*A)
Ts = k * Is; % starting torque

if Is < 6 * Ir
    result = 'Starting current is within safe limits.';
else
    result = 'Starting current is NOT within safe limits.';
end
    
fprintf('-------------------------\nCase 2: Half Passengers\n-------------------------\nPower = %.2f W\nStarting Current = %.2f A\nStarting Torque = %.2f N-m\nRated Current = %.2f A\nRated Torque = %.2f N-m\n%s\n', P, Is, Ts, Ir, Tr, result);

% Variable Weather Condtitions

u_array = [0.2 0.3 0.4 0.5 0.6 0.7 0.8]; % array of various coeff. of friction for different weather conditions
P_array = zeros(1,7); % empty array for power

for i=1:7
    m = mass_bus + ((passenger_count + driver_count) * (mass_person)); % total mass (kg)
    Fg = m * 9.81; % gravitational force
    Fn = Fg * cos(slope); % normal force
    Fl = Fg * sin(slope); % load force
    Ff = u_array(i) * Fn; % frictional force
    Fm = Ff + Fl; % motor force
    T = Fm * r; % torque
    W = v/r; % angular velocity
    P_array(i) = T * W; % power
end

figure('Name','Weather - Power Relation for Case 2','NumberTitle','off');
plot(u_array,P_array,'o -');
title('Weather - Power Relation for Case 2');
xlabel('Coeff. of Friction');
ylabel('Power (W)');

% Variable Wheel Radius

r_array = [0.35 0.4 0.45 0.5]; % array of various wheel radii (m)
P_array = zeros(1,4); % empty array for power

for i=1:4
    m = mass_bus + ((passenger_count + driver_count) * (mass_person)); % total mass (kg)
    Fg = m * 9.81; % gravitational force
    Fn = Fg * cos(slope); % normal force
    Fl = Fg * sin(slope); % load force
    Ff = u * Fn; % frictional force
    Fm = Ff + Fl; % motor force
    T = Fm * r_array(i); % torque
    W = v/r_array(i); % angular velocity
    P_array(i) = T * W; % power
end

figure('Name','Wheel Radius - Power Relation for Case 2','NumberTitle','off');
plot(r_array,P_array,'o -');
title('Wheel Radius - Power Relation for Case 2');
xlabel('Wheel Radius (m)');
ylabel('Power (W)');

% Variable Vehicle Speed

s_array = [30 40 50 60]; % array of various vehicle speeds (km/h)
v_array = s_array * (1000/3600); % array of various vehicle speeds (m/s)
P_array = zeros(1,4); % empty array for power

for i=1:4
    m = mass_bus + ((passenger_count + driver_count) * (mass_person)); % total mass (kg)
    Fg = m * 9.81; % gravitational force
    Fn = Fg * cos(slope); % normal force
    Fl = Fg * sin(slope); % load force
    Ff = u * Fn; % frictional force
    Fm = Ff + Fl; % motor force
    T = Fm * r; % torque
    W = v_array(i)/r; % angular velocity
    P_array(i) = T * W; % power
end

figure('Name','Vehicle Speed - Power Relation for Case 2','NumberTitle','off');
plot(s_array,P_array,'o -');
title('Vehicle Speed - Power Relation for Case 2');
xlabel('Vehicle Speed (km/h)');
ylabel('Power (W)');

%% Case 3: All Passengers

passenger_count = 50; % passenger count (#)

% Analysis

m = mass_bus + ((passenger_count + driver_count) * (mass_person)); % total mass (kg)
Fg = m * 9.81; % gravitational force
Fn = Fg * cos(slope); % normal force
Fl = Fg * sin(slope); % load force
Ff = u * Fn; % frictional force
Fm = Ff + Fl; % motor force
T = Fm * r; % torque
W = v/r; % angular velocity
P = T * W; % power
V = P/Ia; % terminal voltage
Eb = V - (Ia * Ra); % back emf
Is = V/Ra; % starting current
Ir = (V - Eb)/Ra; % rated current
Tr = T; % rated torque
k = Tr/Ia; % motor constant (k = p*phi*z/2*pi*A)
Ts = k * Is; % starting torque

if Is < 6 * Ir
    result = 'Starting current is within safe limits.';
else
    result = 'Starting current is NOT within safe limits.';
end
    
fprintf('-------------------------\nCase 3: All Passengers\n-------------------------\nPower = %.2f W\nStarting Current = %.2f A\nStarting Torque = %.2f N-m\nRated Current = %.2f A\nRated Torque = %.2f N-m\n%s\n', P, Is, Ts, Ir, Tr, result);

% Variable Weather Condtitions

u_array = [0.2 0.3 0.4 0.5 0.6 0.7 0.8]; % array of various coeff. of friction for different weather conditions
P_array = zeros(1,7); % empty array for power

for i=1:7
    m = mass_bus + ((passenger_count + driver_count) * (mass_person)); % total mass (kg)
    Fg = m * 9.81; % gravitational force
    Fn = Fg * cos(slope); % normal force
    Fl = Fg * sin(slope); % load force
    Ff = u_array(i) * Fn; % frictional force
    Fm = Ff + Fl; % motor force
    T = Fm * r; % torque
    W = v/r; % angular velocity
    P_array(i) = T * W; % power
end

figure('Name','Weather - Power Relation for Case 3','NumberTitle','off');
plot(u_array,P_array,'o -');
title('Weather - Power Relation for Case 3');
xlabel('Coeff. of Friction');
ylabel('Power (W)');

% Variable Wheel Radius

r_array = [0.35 0.4 0.45 0.5]; % array of various wheel radii (m)
P_array = zeros(1,4); % empty array for power

for i=1:4
    m = mass_bus + ((passenger_count + driver_count) * (mass_person)); % total mass (kg)
    Fg = m * 9.81; % gravitational force
    Fn = Fg * cos(slope); % normal force
    Fl = Fg * sin(slope); % load force
    Ff = u * Fn; % frictional force
    Fm = Ff + Fl; % motor force
    T = Fm * r_array(i); % torque
    W = v/r_array(i); % angular velocity
    P_array(i) = T * W; % power
end

figure('Name','Wheel Radius - Power Relation for Case 3','NumberTitle','off');
plot(r_array,P_array,'o -');
title('Wheel Radius - Power Relation for Case 3');
xlabel('Wheel Radius (m)');
ylabel('Power (W)');

% Variable Vehicle Speed

s_array = [30 40 50 60]; % array of various vehicle speeds (km/h)
v_array = s_array * (1000/3600); % array of various vehicle speeds (m/s)
P_array = zeros(1,4); % empty array for power

for i=1:4
    m = mass_bus + ((passenger_count + driver_count) * (mass_person)); % total mass (kg)
    Fg = m * 9.81; % gravitational force
    Fn = Fg * cos(slope); % normal force
    Fl = Fg * sin(slope); % load force
    Ff = u * Fn; % frictional force
    Fm = Ff + Fl; % motor force
    T = Fm * r; % torque
    W = v_array(i)/r; % angular velocity
    P_array(i) = T * W; % power
end

figure('Name','Vehicle Speed - Power Relation for Case 3','NumberTitle','off');
plot(s_array,P_array,'o -');
title('Vehicle Speed - Power Relation for Case 3');
xlabel('Vehicle Speed (km/h)');
ylabel('Power (W)');