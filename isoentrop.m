function [p2,T2] = isoentrop(p1,T1,M1,M2,gamma)
%Function che risolve il flusso isoentropico dati il mach di inizio e fine:

p01_p1 = (1 +(gamma-1)/2 *M1.^2).^(gamma/(gamma-1));   % rapporto tra pressione totale e statica punto 1
p2_p02 = (1 +(gamma-1)/2 *M2.^2).^(gamma/(-gamma+1));  % rapporto tra pressione totale e statica punto 2
T01_T1 = (1 +(gamma-1)/2 *M1.^2);                      % rapporto tra temperatura totale e statica punto 1
T2_T02 = 1./(1 +(gamma-1)/2 *M2.^2);                   % rapporto tra temperatura totale e statica punto 2

p2 = p2_p02 .* p01_p1 .* p1;               % pressione punto 2
T2 = T2_T02 .* T01_T1 .* T1;               % Temperatura punto 2

end

