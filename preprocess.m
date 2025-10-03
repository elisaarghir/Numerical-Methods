function reduced_mat = preprocess(mat, min_reviews)
  # TODO: Remove all user rows from `mat` that have strictly less then `min_reviews` reviews.

  [m, n] = size(mat);

  %parcurg matricea de la final la inceput pentru a nu mi se schimba
  %indicii liniilor dupa ce ii sterg 

  %cu count_reviews numar cate recenzii sunt bune pe fiecare linie 
  for i = m:-1:1  
    count_reviews = 0;
    for j = 1:n
      if mat(i, j) > 0
        count_reviews = count_reviews + 1;
      end
    end

    %daca count_reviews e mai mic decat min_reviews, sterg randul din matrice
    if count_reviews < min_reviews
      mat(i, :) = [];  
    end
  end

  reduced_mat = mat;

end
