function [S f t] = spectrogram(signal, fs, window_size)
	S = 0;
  f = 0;
  t = 0;
  %aflu marimea semnalului si nr de ferestre folosind floor
  l = length(signal)
  nr = floor(l / window_size); %aici am nr de ferestre
  S = zeros(window_size, nr); %initializez matricea S 
  %parcurg fiecare fereastra din semnal 
  for i = 1:nr
    %aplic functia hanning pe fiecare fereastra
    apply_hann = hanning(window_size);
    %calculez pozitia de offset pentru fereastra curenta
    %creez un vector coloana pentru a extrage o bucata de semnal
    offset = (i - 1) * window_size;
    extract = zeros(window_size, 1); 
    %copiez window_size bucati din semnal pentru a analiza 
    %dupa cu FFT 
    for j = 1:window_size
        extract(j) = signal(offset + j);
    end
    %construiesc vectorul window_signal care va contine fiecare bucata
    %din window inmultita cu coeficienul Hann corespunzator
    window_signal = zeros(window_size, 1);
    for j = 1:window_size
        window_signal(j) = extract(j) * apply_hann(j);
    end
    %aplic FFT, ca in cerinta, cu o rezolutie dubla cat marimea
    %ferestrei si pastrez doar frecventele pozitive
    fourier_transform = fft(window_signal, 2 * window_size);
    fourier_transform = fourier_transform(1:window_size);
    %iau amplitutdinea fiecarui element si stochez rezultatul in matricea S
    S(:, i) = abs(fourier_transform);
  end
  %calculez vectorul de frecventa si vectorul cu momentele de timp
  f = zeros(window_size, 1);
  for i = 0:window_size - 1
      f(i + 1) = i * (fs / (2 * window_size));
  end
  t = zeros(nr, 1);
  for i = 0:nr - 1
      t(i + 1) = i * window_size / fs;
  end

  % COMMENTS:
  % PLAIN LOOP - PLAIN SOUND
  %       Prima are un sunet simplu si repetitiv, in spectograma putand sa vizualizez
  %   benzi regulate, in timp ce a-2-a e mai complexa, spectograma fiind mai variata.

  %   PLAIN SOUND - HIGH PASS SOUND 
  %       La a-2-a spectograma nu mai contine partea de jos, deoarece s-au taiat
  %   frecventele joase, pastrandu-se numai sunetele inalte. 

  %   PLAIN SOUND - REVERB SOUND
  %       In Reverb Sound, spectograma are un aspect mai blurat, deoarece fiecare
  %   sunet se intinde pe mai mult timp.
  
end
