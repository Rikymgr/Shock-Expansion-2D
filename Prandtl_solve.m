function [M] = Prandtl_solve(Ni,gamma)
%Function che inverte la relazione di Prandtl-Meyer, non esiste soluzione
%analitica, ma è necessario impiegare il metodo di bisezione; la funzione
%ammette come input anche vettori di ordine 1

M = [];
for j =  [1:length(Ni)]    % iterazioni sulla lunghezza di Ni
    M1 = 1;                %limiti del valore
    M2 = 1e10;

    fun = @(x) sqrt((gamma+1)/(gamma-1)) *atan(sqrt((gamma-1)/(gamma+1) *(x.^2 -1))) -atan(sqrt(x.^2-1)) - Ni(j); %funzione di Prandtl-Meyer

    if sign(fun(M1)) == sign(fun(M2))                      %routine che controlla che Ni sia minore del valore massimo accettabile
        msg = 'Ni maggiore del valore massimo';
        error(msg)
    end

    err = 1;
                                                    % Metodo di bisezione
                                                          
    while norm(err)> 1e-12
        M3 = (M1+M2)/2;
        err = fun(M3);

        if err>0
            M1 = M1;
            M2 = M3;
        else
            M1 = M3;
            M2 = M2;

        end

        M_j = M3;
    end
    M(j) = M_j;
end

