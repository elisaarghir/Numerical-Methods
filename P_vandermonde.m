function y_interp = P_vandermonde (coef, x_interp)
	% P_vandermonde(x) = a0 + a1 * x + a2 * x^2 + ... + an * x^n
	% coef = [a0, a1, a2, ..., an]'
	% y_interp(i) = P_vandermonde(x_interp(i)), i = 0 : length(x_interp) - 1
	
	% TODO: Calcualte y_interp using the Vandermonde coefficients

	%creez vectorul y_interp, care are acelasi nr de elemente ca x_interp
	y_interp = zeros(length(x_interp), 1); 

	%parcurg fiecare element din x_interp 
	for i = 1:length(x_interp)
		%parcurg fiecare coeficient al polinomului si adaug la 
		%y_interp termenul respectiv, cu puterile lui x
		for j = 1:length(coef)
			y_interp(i) = y_interp(i) + coef(j) * power(x_interp(i), j - 1);
		end
	end 
end
