# Numerical-Methods
The project includes audio signal processing, interpolation methods and preprocessing

# Recommendations functions

#  PREPROCESS
- Traverses the matrix in reverse order to avoid index issues when deleting rows. Counts reviews per row and removes rows with fewer reviews than the required minimum.

# COSINE_SIMILARITY
- Calculates cosine similarity using the formula: transposes vector A to get a scalar, then divides by the product of norms.

# RECOMMENDATIONS

- Extracts the matrix with read_mat, preprocesses it to remove sparse rows, and stores it efficiently as a sparse matrix.
- Performs reduced SVD using svds. Transposes V so that column V(:, i) corresponds to topic i.
- Computes similarities between the preferred topic vector A and all other topics, storing them in similarities.
- Loops through all topics to calculate cosine similarity, sorts topics in descending order of similarity.
- Removes the preferred topic and selects the top num_recoms most similar topics for recoms.
