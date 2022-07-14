function [L,D,Cd,Cl] = lastra_supersonica(alpha,p1,T1,M1,gamma,c)
%Function che risolve il flusso 2D su una lastra sottile in reggime
%supersonico senza distaccamento dell'onda d'urto, accetta alpha come
%vettore, ma non Mach

if M1 < 1
    msg = 'Numero di Mach minore di 1; non può avvenire alcun urto';
    error(msg)
end

theta = alpha;
[p3,T3,M3] = urto_obliquo(theta,p1,T1,M1,gamma);
[p2,T2,M2] = fan_espansione(theta,p1,T1,M1,gamma);

F = c.*(p3-p2);
L = F.*cos(alpha);
D = F.*sin(alpha);
Cl = 2/(gamma*M1.^2) *(p3./p1 - p2./p1) .*cos(alpha);
Cd = 2/(gamma*M1.^2) *(p3./p1 - p2./p1) .*sin(alpha);
end

