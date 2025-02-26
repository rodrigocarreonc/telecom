clc; clear; close all;

% Parámetros de la simulación
num_bits = 1000;  % Número de bits transmitidos
snr = 10;         % Relación señal-ruido en dB

% Generación de datos binarios aleatorios (0s y 1s)
data = randi([0 1], 1, num_bits);

% Modulación BPSK (0 ? -1, 1 ? +1)
tx_signal = 2*data - 1;

% Canal con ruido AWGN
rx_signal = awgn(tx_signal, snr, 'measured');

% Decodificación: Se decide por 1 si la señal recibida es positiva, 0 si es negativa
received_data = rx_signal > 0;

% Cálculo de la tasa de error de bit (BER)
num_errors = sum(data ~= received_data);
ber = num_errors / num_bits;

% Visualización de resultados
subplot(3,1,1);
stem(data(1:50), 'filled'); title('Bits Transmitidos'); xlabel('Índice'); ylabel('Valor');
ylim([-0.5,1.5]);

subplot(3,1,2);
plot(rx_signal(1:50), 'o-'); title('Señal Recibida con Ruido'); xlabel('Índice'); ylabel('Amplitud');

subplot(3,1,3);
stem(received_data(1:50), 'filled'); title('Bits Recibidos Después del Canal'); xlabel('Índice'); ylabel('Valor');
ylim([-0.5,1.5]);

% Mostrar tasa de error de bit
fprintf('Número de errores: %d\n', num_errors);
fprintf('Tasa de error de bit (BER): %f\n', ber);