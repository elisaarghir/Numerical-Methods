function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
  # TODO: Get the best `num_recoms` recommandations similar with 'liked_theme'.

  %extrag matricea si elimin utilizatorii care au mai putin de
  %min_reviews recenzii, dupa care o stochez eficient
  mat = read_mat(path);
  reduced_mat = preprocess(mat, min_reviews);
  reduced_mat = sparse(reduced_mat);

  %aplic forma SVD redusa
  [U, S, V] = svds(reduced_mat, num_features);
  V = V';

  %extrag vectorul caracteristic al temei preferate
  A = V(:, liked_theme);
  similarities = zeros(1, size(V, 2));

  %caclulez similaritatea pentru fiecare tema, fata de tema preferata
  %size(V, 2) imi da nr de coloane din V
  for i = 1:size(V, 2)
    B = V(:, i);
    similarities(i) = cosine_similarity(A, B);
  end

  %sortez temele dupa similaritate
  [sorted_values, indices] = sort(-similarities); %sortez descrescator
  sorted_indices = indices;

  %creez vectorul cu cele mai similare num_recoms teme, excluzand liked_theme
  recoms = sorted_indices(sorted_indices != liked_theme)(1:num_recoms);

end
