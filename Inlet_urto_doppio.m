function [pi_inlet] = Inlet_urto_doppio(theta1,theta2,p1,T1,M1,gamma)

% Function che calcola la perdita di pressione in un diffusore supersonico
% con un doppio urto obliquo ed un urto normale in serie


[p2,T2,M2] = urto_obliquo(theta1,p1,T1,M1,gamma);
[p3,T3,M3] = urto_obliquo(theta2,p2,T2,M2,gamma);
[p4,T4,M4] = urto_normale(p3,T3,M3,gamma);
[p04,T04] = isoentrop(p4,T4,M4,0,gamma);
[p01,T01] = isoentrop(p1,T1,M1,0,gamma);

pi_inlet = p04./p01;


end
