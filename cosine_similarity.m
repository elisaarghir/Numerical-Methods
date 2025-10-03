function similarity = cosine_similarity(A, B)
  # TODO: Compute the cosine similarity between two column vectors.

 %calculez similaritatea dupa formula data
 %fac A transpus inmultit cu B pentru ca sunt 2 vectori coloana
 %si rezultatul inmultirii trebuie sa fie un scalar
 similarity = (A' * B) / (norm(A, 2) * norm(B, 2));
end
