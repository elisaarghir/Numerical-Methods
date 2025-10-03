function mat = read_mat(path)
  # TODO: Parse the .csv file and return the matrix of values (without row and column headers).

  %citesc datele din matrice, fara primul rand si prima coloana
  mat = csvread(path, 1, 1);
end
