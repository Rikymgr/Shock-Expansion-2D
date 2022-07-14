function [p2,T2,M2] = fan_espansione(theta,p1,T1,M1,gamma)
% Function che calcola lo stato del flusso a valle di un ventaglio di
% espansione:   Theta e Mach possono essere vettori, ma non
% contemporaneamente 


if M1 < 1
    msg = 'Numero di Mach minore di 1; non può avvenire alcun urto';
    error(msg)
end

Ni_M1 = Prandtl_Meyer(M1,gamma);
Ni_M2 = theta + Ni_M1;

M2 = Prandtl_solve(Ni_M2,gamma);

[p2,T2] = isoentrop(p1,T1,M1,M2,gamma);


end

