function [x, y] = parse_data(filename)
    % file input format:
    % n
    % x0 x1 ... xn
    % y0 y1 ... yn

    % TODO 1: Open the file for reading
    f = fopen(filename, 'r');

    % TODO 2: Read n, x, y from the file
    line = fgets(f);
    dimensions = sscanf(line, '%d');
    n = dimensions(1);

    %initializez vectorii coloana x si y cu n+1 elemente 
    x = zeros(n + 1, 1);
    y = zeros(n + 1, 1)

    %cu str2num tranform sirul de caractere in vector de numere
    line = fgets(f);
    x = str2num(line);

    line = fgets(f);
    y = str2num(line);

    % TODO 3: Close the file
    fclose(f);
end