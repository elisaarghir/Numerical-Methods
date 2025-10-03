# Numerical-Methods
The project includes audio signal processing, interpolation methods and preprocessing
# Robotzii functions

# PARSE_DATA
- Opens the file, reads the first line to get n via dimensions(1), initializes vectors x and y, then reads the remaining lines, converts them to numeric values, and stores them in x and y.

# SPLINE_C2
- Constructs a natural cubic spline: initializes the system matrix and RHS vector, handles the left-end interpolation while updating pos, builds four vectors to store coefficient positions, follows all steps in the instructions, and solves the system of equations.

# P_SPLINE
- Loops over all x_interp points: for each, determines the number of x values ≤ x_interp(i) (clipped to the maximum allowed), calculates the start position in coef for the interval, and computes the spline value at x_interp(i) using the four consecutive coefficients.

# PLOT_VANERMONDE
- Builds the Vandermonde matrix (1 in the first column, powers of x in the remaining columns), then solves the system using matrix inversion.

# P_VANDERMONDE
- Loops over each element of x_interp; for each, multiplies polynomial coefficients with powers of x_interp to compute y_interp.
