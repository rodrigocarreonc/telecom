% Programa para calcular la Transformada Discreta de Fourier (TDF)

% Datos de la señal
N = 8; % Número de muestras
n = 0:N-1; % Índice temporal
x_n = [0, 0.7071, 1, 0.7071, 0, -0.7071, -1, -0.7071]; % Señal discreta

% Transformada Discreta de Fourier (TDF)
X_k = fft(x_n);

% Gráfica de la señal original
figure;
subplot(2,1,1);
stem(n, x_n, 'filled', 'LineWidth', 1.5);
title('Señal original x[n]');
xlabel('n');
ylabel('x[n]');
grid on;

% Gráfica de la Magnitud de la TDF
subplot(2,1,2);
stem(n, abs(X_k), 'filled', 'LineWidth', 1.5);
title('Magnitud de la TDF |X[k]|');
xlabel('k');
ylabel('|X[k]|');
grid on;
