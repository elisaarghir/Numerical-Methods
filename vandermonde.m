function coef = vandermonde(x, y)
    % x = [x0, x1, ..., xn]'
    % y = [y0, y1, ..., yn]'
    % coef = [a0, a1, a2, ..., an]'

    % TODO: Calculate the Vandermonde coefficients
    %transpun vectorii x si y deoarece sunt coloane
    x = x';
    y = y';
    %determin dimensiunea lui Vandermonde_matrix
    Vandermonde_matrix = zeros(length(x), length(x));
    %initializez prima coloana a matricei V, cu 1 
    Vandermonde_matrix(:, 1) = 1;
    %completez restul coloanelor din matricea V cu puteri ale lui x
    for j = 2:length(x)
        Vandermonde_matrix(:, j) = power(x, j - 1);
    end
    %rezolv sistemul din cerinta, V * coef = y, prin inversarea lui V
    coef = inv(Vandermonde_matrix) * y;
endfunction
