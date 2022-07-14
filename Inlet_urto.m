function [pi_inlet] = Inlet_urto(theta,p1,T1,M1,gamma)

% Function che calcola la perdita di pressione in un diffusore supersonico
% con un signolo urto obliquo e un urto normale in serie

[p2,T2,M2] = urto_obliquo(theta,p1,T1,M1,gamma);
[p3,T3,M3] = urto_normale(p2,T2,M2,gamma);
[p03,T03] = isoentrop(p3,T3,M3,0,gamma);
[p01,T01] = isoentrop(p1,T1,M1,0,gamma);

pi_inlet = p03./p01;

end