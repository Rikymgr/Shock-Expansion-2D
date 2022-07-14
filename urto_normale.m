function [p2,T2,M2] = urto_normale(p1,T1,M1,gamma)
% Questa function risolve il flusso in un urto normale, flusso adiabatico,
% stazionario, gas ideale ecc...

if M1 < 1
    msg = 'Numero di Mach minore di 1; non può avvenire alcun urto';
    error(msg)
end

% Relazioni di Rankine
M2 = sqrt(1 -((gamma+1)./2 *(M1.^2 -1))./(gamma *M1.^2 -(gamma -1)./2));
p2 = p1 .*(1 +(2*gamma/(gamma +1)) .*(M1.^2-1));
T2 = T1 .*(1 +(2*gamma/(gamma +1)) .*(M1.^2-1)) .*((2 +(gamma-1).*M1.^2)/(M1.^2.*(gamma+1)));
end

