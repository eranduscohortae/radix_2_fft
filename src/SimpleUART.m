% Kodierung (encode-Methode)
% 
% Die encode-Methode nimmt ein Array von komplexen Zahlen entgegen.
% Jede komplexe Zahl besteht aus einem Real- und einem Imaginärteil.
% Der Kodierungsprozess erfolgt in mehreren Schritten für jedes Sample:


% Extraktion von Real- und Imaginärteil:
% Für jede komplexe Zahl im Eingabe-Array werden der Realteil und der Imaginärteil
% separat extrahiert. Dies geschieht mit den Funktionen real(samples(i)) für
% den Realteil und imag(samples(i)) für den Imaginärteil.

% Umwandlung in single-Format: Der Real- und Imaginärteil jeder komplexen Zahl
% wird von ihrem Standard-Datentyp (häufig double) in den single-Datentyp
% umgewandelt. Dies reduziert den Speicherbedarf für jedes Sample und passt
% zum üblichen Format für eingebettete und Kommunikationssysteme.
% 
% Typumwandlung in uint8: Der single-Datentyp wird in einen Array von uint8-Werten
% umgewandelt, wobei typecast verwendet wird. Dieser Schritt ist notwendig,
% weil die Daten in einem Format gesendet werden müssen, das byte-weise übertragen
% werden kann. Eine single-Zahl wird also in vier uint8-Bytes aufgeteilt.

% Zusammenfügen der Bytes: Die uint8-Bytes für den Real- und Imaginärteil
% werden nacheinander in einem Array zusammengefügt. Dieses Array stellt die
% kodierten Daten dar, die übertragen werden sollen.

classdef SimpleUART
    methods(Static)
        function encodedData = encode(samples)
            % Konvertiert die Samples in ein kodiertes Format
            encodedData = [];
            for i = 1:length(samples)
                realPart = typecast(single(real(samples(i))), 'uint8');
                imagPart = typecast(single(imag(samples(i))), 'uint8');
                encodedData = [encodedData; realPart; imagPart];
            end
        end

        function samples = decode(encodedData)
            % Dekodiert die Daten zurück in Samples
            samples = [];
            for i = 1:8:length(encodedData)-7
                realPart = typecast(uint8(encodedData(i:i+3)), 'single');
                imagPart = typecast(uint8(encodedData(i+4:i+7)), 'single');
                samples(end+1) = complex(realPart, imagPart);
            end
        end
    end
end
