function mono = stereo_to_mono(stereo)
  mono = stereo;

  % Normalize
  %folosindu-ma de mono fac media aritemtica a elementelor din matrice
  mono = mean(stereo, 2);
  mono = mono / max(abs(mono));
end
