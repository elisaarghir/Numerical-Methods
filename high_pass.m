function signal = high_pass(signal, fs, cutoff_freq)
  
    % 1.realizez tranformata fourier a semnalului x
    signal_x = fft(signal); 
    %rearanjez vectorul ca sa am frecventele dispuse simetric, 
    %pentru a le alinia cu vectorul de frecvente 
    signal_x_shifted = fftshift(signal_x); 

    % initializez vectorul in care voi retine frecventele, de lungimea
    % lui signal_x, pentru a lega fiecare element al tranformatei
    % Fourier de o frecventa
    frequencies = zeros(length(signal), 1);
    
    % 2.Construiesc vectorul f care contine aceste frecvente dispuse simetric
    for i = 1:length(signal)
        frequencies(i) = -fs / 2 + (i - 1) * (fs / (length(signal) - 1));
    end

    % 3. Creez masca cu valorile conform cerintei 
    % 1 pentru valori mai mari decat fc, 0 in caz contrar
    mask = zeros(length(frequencies), 1);
    for i = 1:length(frequencies)
        if abs(frequencies(i)) > cutoff_freq
            mask(i) = 1;
        else
            mask(i) = 0;
        end
    end
    
    % 4. Aplic produsul Hadamard intre signal_x si masca 
    Hadamard_product = signal_x_shifted .* mask;
    %rearanjez spectrul in ordinea intiala, deoarece il filtrasem la pasul initial
    Hadamard_product = ifftshift(Hadamard_product);
    
    % 5. Aplic inversa Tranformatei Fourier pentru a rezulta semnalul filtrat
    signal = ifft(Hadamard_product);

    % 6. Normalizez semnalul
    if max(abs(signal)) ~= 0
        signal = signal / max(abs(signal));
    end
    
end
