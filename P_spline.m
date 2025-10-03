function y_interp = P_spline (coef, x, x_interp)
	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3, i = 0 : n - 1
	% coef = [a0, b0, c0, d0, a1, b1, c1, d1, ..., an-1, bn-1, cn-1, dn-1]
	% x = [x0, x1, ..., xn]
	% y_interp(i) = P_spline(x_interp(i)), i = 0 : length(x_interp) - 1
	% Be careful! Indexes in Matlab start from 1, not 0

	% TODO: Calculate y_interp using the Spline coefficients

	%in acest for, parcurg fiecare element din x_interp pentru care 
	%realizez spline-ul
    for i = 1:length(x_interp)
		%numar cate elemente din x sunt <= x_interp(i)
		j = sum(x <= x_interp(i));
		%verific daca j a iesit in afara ultimului interval 
		%in caz afirmativ, il aduc inapoi la limita maxima 
		if j > length(x) - 1
			j = length(x) - 1;
		end
		%caclulez pozitia de start din coef pentru intervalul j
        first_coef_pos = 4 * (j - 1) + 1;
		%creez vectorul cu pozitiile coeficientilor din intervalul respectiv 
		position = first_coef_pos : first_coef_pos + 3;
		%iau coeficientii corespunzatori intervalului curent 
		%astfel, s va fi un vector de 4 elemente 
		s = coef(position);
		%caclulez valoarea spline-ului in punctul x_interp(i)
		y_interp(i) = s(1) + s(2) * (x_interp(i) - x(j));
		y_interp(i) = y_interp(i) +  s(3) * (x_interp(i) - x(j)) ^2;
		y_interp(i) = y_interp(i) + s(4) * (x_interp(i) - x(j))^3;
    end
end
