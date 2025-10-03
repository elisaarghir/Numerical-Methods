function coef = spline_c2 (x, y)
	% Remember that the indexes in Matlab start from 1, not 0

	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3
	% si'(x)  =      bi         + 2ci(x - xi)  + 3di(x - xi)^2
	% si''(x) =                   2ci          + 6di(x - xi)

    l = length(x) - 1;         % număr de intervale              
    b = zeros(4 * l, 1);         % vectorul termenilor liberi
	system_matrix = zeros(4 * l, 4 * l);

    % TODO 1: si(xi) = yi, i = 0 : n - 1
	% Inițializez variabila pos pentru a indica poziția coeficientului a(i) 
	% în vectorul coeficientilor
    pos = 1;  
	for i = 1:l
		system_matrix(i, pos) = 1;
		b(i) = y(i);
		%trec la pozitia urmatorului coeficient, care este la 4 pozitii distanta
		pos = pos + 4; 
	end

	a_pos = 1:4:4*l;   % pozițiile coeficienților a_i
	b_pos = 2:4:4*l;   % pozițiile coeficienților b_i
	c_pos = 3:4:4*l;   % pozițiile coeficienților c_i
	d_pos = 4:4:4*l;   % pozițiile coeficienților d_i

    % TODO 2: s_n-1(xn) = yn
	system_matrix(l + 1, a_pos(i)) = 1;
	h = diff(x);
	system_matrix(l + 1, b_pos(i)) = h(l);
	system_matrix(l + 1, c_pos(i)) = h(l)^2;
	system_matrix(l + 1, d_pos(i)) = h(l)^3;
	b(l + 1) = y(l + 1);

    % TODO 3: si(x_i+1) = s_i+1(x_i+1), i = 0 : n - 1
    for i = 1:l-1                 
		system_matrix(l + 1 + i, a_pos(i)) = 1;
		system_matrix(l + 1 + i, b_pos(i)) = h(i);
		system_matrix(l + 1 + i, c_pos(i)) = h(i)^2;
		system_matrix(l + 1 + i, d_pos(i)) = h(i)^3;
		system_matrix(l + 1 + i, a_pos(i + 1)) = -1;
	end

    % TODO 4: si'(x_i+1) = s_i+1'(x_i+1), i = 0 : n - 1
    for i = 1:l-1                  
		system_matrix(2 * l + i, b_pos(i)) = 1;         
		system_matrix(2 * l + i, c_pos(i)) = 2 * h(i);    
		system_matrix(2 * l + i, d_pos(i)) = 3 * h(i)^2;    
		system_matrix(2 * l + i, b_pos(i + 1)) = -1;         
	end

    % TODO 5: si''(x_i+1) = s_i+1''(x_i+1), i = 0 : n - 1
    for i = 1:l-1                  
		system_matrix(3 * l - 1 + i, c_pos(i)) = 2;         
		system_matrix(3 * l - 1 + i, d_pos(i)) = 6 * h(i);   
		system_matrix(3 * l - 1 + i, c_pos(i + 1)) = -2;       
	end

    % TODO 6: s0''(x0) = 0
    system_matrix(4*l - 1, 3) = 2;

    % TODO 7: s_n-1''(x_n) = 0                             
	system_matrix(4 * l, c_pos(l)) = 2;     
	system_matrix(4 * l, d_pos(l)) = 6 * h(l);   

    % Solve the system of equations
	system_matrix = sparse(system_matrix);
    coef = system_matrix \ b;
end
