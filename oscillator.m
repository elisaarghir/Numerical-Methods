function x = oscillator(freq, fs, dur, A, D, S, R)
  %Pasul 1: creez vectorul de timp t de la 0 la dur cu pasul 1/fs
  t = (0:1/fs:dur - 1/fs)';

  %Pasul 2: Creez semnalul sinusoidal formula sin(2*pi*frequency*t)
  sine_wave = sin(2 * pi * freq * t);

  %Pasul 3: Calculez nr de sample-uri cu floor, conform cerintei
  attack = floor(A * fs);
  decay   = floor(D * fs);
  release = floor(R * fs);
  sustain = length(t) - attack - decay - release;

  %Calculez faza de attack, cu cresterea de la 0 la 1
  attack_env = zeros(attack, 1);
  for i = 1:attack
    attack_env(i) = (i - 1) / (attack - 1);
  end

  %Calculez faza de decay, cu scadere de la 1 la S
  decay_env = zeros(decay, 1);
  for i = 1:decay
    decay_env(i) = 1 - ((i - 1) * (1 - S) / (decay - 1));
  end

  %Calculez faza de sustain, care este egala cu nivelul
  sustain_env = zeros(sustain, 1);
  for i = 1:sustain
    sustain_env(i) = S;
  end

  %Caclulez faza de release, cu scadere de la S la 0
  release_env = zeros(release, 1);
  for i = 1:release
    release_env(i) = S - ((i - 1) * S / (release - 1));
  end

  %Formez envelope-ul final, concatenand toate fazele 
  final_envelope = [attack_env; decay_env; sustain_env; release_env];

  %Aplic envelope peste semnalul sinusoidal 
  x = zeros(length(sine_wave), 1);
  for i = 1:length(sine_wave)
    x(i) = sine_wave(i) * final_envelope(i);
  end

end
