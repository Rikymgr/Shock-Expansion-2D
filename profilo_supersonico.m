function [L,D,Cl,Cd] = profilo_supersonico(alpha,epsilon,p1,T1,M1,gamma,c)
% Function che restituisce il flusso inviscido attorno ad un profilo
% supersonico 2D

if M1 < 1
    msg = 'Numero di Mach minore di 1; non può avvenire alcun urto';
    error(msg)
end

l = c./(2.*cos(epsilon));

theta2 = alpha -epsilon;
[p2,T2,M2] = fan_espansione(theta2,p1,T1,M1,gamma);

theta2_ = alpha +epsilon;
[p2_,T2_,M2_] = urto_obliquo(theta2_,p1,T1,M1,gamma);

theta3 = 2.*epsilon;
[p3,T3,M3] = fan_espansione(theta3,p2,T2,M2,gamma);

theta3_ = 2.*epsilon;
[p3_,T3_,M3_] = fan_espansione(theta3_,p2_,T2_,M2_,gamma);

L = l.*p1.*(cos(alpha+epsilon).*(p2_./p1 - p3./p1) + cos(alpha-epsilon).*(p3_./p1 - p2./p1));
D = l.*p1.*(sin(alpha+epsilon).*(p2_./p1 - p3./p1) + sin(alpha-epsilon).*(p3_./p1 - p2./p1));
Cl = 2./(gamma.*M1.^2) *(l./c) *(cos(alpha+epsilon).*(p2_./p1 - p3./p1) + cos(alpha-epsilon).*(p3_./p1 - p2./p1));
Cd = 2./(gamma.*M1.^2) *(l./c) *(sin(alpha+epsilon).*(p2_./p1 - p3./p1) + sin(alpha-epsilon).*(p3_./p1 - p2./p1));
end

