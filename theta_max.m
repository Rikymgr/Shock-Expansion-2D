function [theta] = theta_max(M,gamma)
%Function che trova il massimo valore ammissibile di theta nella relazione
%Theta Beta Mach; la funzione ammette M come vettore 

theta =[];

for i = [1:length(M)]
    beta = linspace(0,pi/2,100000);
    fun = @(x) atan(2.*cot(x).*(M(i).^2.*sin(x).^2 -1)./(M(i).^2.*(gamma+cos(2.*x))+2));
    theta_vec = fun(beta);
    theta(i) = max(theta_vec);
end

end

