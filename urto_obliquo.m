function [p2,T2,M2] = urto_obliquo(theta,p1,T1,M1,gamma)
% Function Matlab che trova le condizioni a monte di un urto obliquo
% attaccato

if M1 < 1
    msg = 'Numero di Mach minore di 1; non può avvenire alcun urto';
    error(msg)
end

beta = theta_beta_mach(theta,M1,gamma);       % funzione theta - beta - Mach 
Mn1 = M1.* sin(beta);
[p2,T2,Mn2] = urto_normale(p1,T1,Mn1,gamma);
M2 = Mn2./sin(beta-theta);

end