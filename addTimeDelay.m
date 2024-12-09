function Sig_delay  = addTimeDelay(Sig,delay,fs)
    N = length(Sig);
    t = 0:1/fs:(N-1)/fs;
    f = -fs/2:fs/N:fs/2-fs/N;
    TF = fftshift(fft(Sig));
    output = ifft(TF.*exp(-1j*f*delay));

end