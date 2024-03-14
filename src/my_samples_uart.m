samples = [ 4.875 - 5.625*1i, 4.6875 + 4.875*1i, -6.375 + 5.875*1i, 13.5 + 9.625*1i, -8.875 + 14.375*1i, 6.4375 + 3.75*1i, 3.625 + 7.5*1i, 6.375 + 3.25*1i];


% Kodieren
encodedData = SimpleUART.encode(samples);
disp('kodierte Werte:');
disp( encodedData);

% Dekodieren
decodedSamples = SimpleUART.decode(encodedData);

% Überprüfung
disp('Überprüfung:');
disp(decodedSamples);