function octave_example_simple()
    more off;
    
    HOST = "localhost";
    PORT = 4223;
    UID = "nmr"; % Change to your UID

    ipcon = java_new("com.tinkerforge.IPConnection"); % Create IP connection
    t = java_new("com.tinkerforge.BrickletTemperature", UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Get current temperature (unit is °C/100)
    temperature = str2num(t.getTemperature().toString());
    fprintf("Temperature: %g°C\n", temperature/100.0);

    input("Press any key to exit...\n", "s");
    ipcon.disconnect();
end
