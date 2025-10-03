# Numerical-Methods
The project includes audio signal processing, interpolation methods and preprocessing

# Numerical_Music functions

# STEREO_TO_MONO
- Uses mean to compute the arithmetic mean across each row, then normalizes the result.

# OSCILLATOR
- Creates a time vector t with step 1/fs.
- Generates a sinusoidal signal sine_wave using the formula.
- Computes the number of samples for attack, decay, sustain, and release using floor.
- Constructs each envelope phase in a loop according to the instructions and stores them in vectors.
- Concatenates all phases into final_envelope.
- Applies the envelope to the sinusoidal signal via Hadamard (element-wise) multiplication.

# HIGHPASS

- Computes the Fourier transform signal_x of the input x.
- Applies fftshift to center frequencies symmetrically.
- Creates a symmetric frequency vector.
- Builds a mask with 1 for frequencies above cutoff_freq and 0 otherwise (using absolute value for negative frequencies).
- Applies the mask via Hadamard product, shifts back, and computes the inverse Fourier transform.
- Normalizes the resulting signal.

# REVERB

- Converts impulse_response to mono using stereo_to_mono.

Performs convolution between the input signal and the impulse using fftconv.

Normalizes the resulting signal.
