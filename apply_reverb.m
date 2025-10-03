function signal = apply_reverb(signal, impulse_response)

  %ma asigur ca impulse response e mono 
  impulse_response = stereo_to_mono(impulse_response);
  %fac convolutia dintre semnal si impuls, cu ffftconv, ca in cerinta
  convolution = fftconv(signal, impulse_response);
  signal = convolution;
  %normalizez semnalul rezultat
  signal = signal / max(abs(signal));
end
