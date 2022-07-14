function [Ni] = Prandtl_Meyer(M,gamma)
% Function che valuta la funzione di Prandtl-Meyer


if M < 1  % la funzione di Prandtl Meyer è valida solo per M > 1
    msg = 'Numero di Mach minore di 1; non può avvenire alcun urto';
    error(msg)
end

Ni = sqrt((gamma+1)/(gamma-1)) *atan(sqrt((gamma-1)/(gamma+1) *(M.^2 -1))) -atan(sqrt(M.^2-1));   % funzione di Prandtl-Meyer
end

