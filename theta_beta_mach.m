function [beta] = theta_beta_mach(theta,M,gamma)
% Function che calcola il valore di beta nella reazione theta - beta - Mach
% utilizza un metodo iterativo a bisezione. Ammette theta come vettore, ma
% non Mach

if M < 1
    msg = 'Numero di Mach minore di 1; non può avvenire alcun urto';
    error(msg)
end

if norm(double(theta>0.78)) > 0
     msg = 'Theta maggiore del valore massimo';
    error(msg)
end

beta = [];
for j = [1:length(theta)]
    
    fun = @(x) 2.*cot(x).*(M.^2.*sin(x).^2 -1)./(M.^2.*(gamma+cos(2.*x))+2) - tan(theta(j));


    beta1 = 0.0001;
    beta_v = linspace(1.12,1.18,100);
    [~,i] = max(fun(beta_v));
    beta2 = beta_v(i);
    err = 1;
    
    if sign(fun(beta1)) == sign(fun(beta2))
        msg = 'Theta maggiore del valore massimo';
        error(msg)
    end

    while norm(err)> 1e-12
        beta3 = (beta1+beta2)/2;
        err = fun(beta3);

        if err>0
            beta1 = beta1;
            beta2 = beta3;
        else
            beta1 = beta3;
            beta2 = beta2;

        end

        beta_j = beta3;
    end
    beta(j) = beta_j;
end
end


