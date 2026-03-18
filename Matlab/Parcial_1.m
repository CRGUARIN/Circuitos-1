% Definimos el vector de tiempo (con buena resolución para que se vea suave)
t = -5:0.01:5;

% Funciones singulares básicas
u = @(t) 1.0 * (t >= 0);          % Escalón unitario
r = @(t) t .* (t >= 0);           % Rampa unitaria

% Tu ecuación para x(t)
x = @(t) -2*r(t+3) + 2*u(t+2) + 3*r(t+2) - r(t+1) - 2*u(t) + ...
          r(t-1) + 2*u(t-2) - 3*r(t-2) + 2*r(t-3);

% Calculamos las transformaciones
x_original = x(t);
x_reflejada = x(-t);              % Reflexión en el tiempo
x1_t = 2 * x(-t);                 % Reflexión + Escalamiento en amplitud

% --- Gráficas ---
figure;

% 1. Señal original x(t)
subplot(3,1,1);
plot(t, x_original, 'b', 'LineWidth', 2);
grid on;
title('Señal original x(t)');
xlabel('Tiempo (s)'); ylabel('Amplitud');
axis([-5 5 -3 3]);

% 2. Señal con reflexión x(-t)
subplot(3,1,2);
plot(t, x_reflejada, 'g', 'LineWidth', 2);
grid on;
title('Reflexión en el tiempo: x(-t)');
xlabel('Tiempo (s)'); ylabel('Amplitud');
axis([-5 5 -3 3]);

% 3. Señal final x_1(t) = 2x(-t)
subplot(3,1,3);
plot(t, x1_t, 'r', 'LineWidth', 2);
grid on;
title('Señal final x_1(t) = 2x(-t)');
xlabel('Tiempo (s)'); ylabel('Amplitud');
axis([-5 5 -5 5]); % Ampliamos el eje Y porque la amplitud se duplica

% Vector de tiempo con muy buena resolución para que los saltos se vean verticales
t = -5:0.001:5;

% Función escalón unitario estándar
u = @(t) 1.0 * (t >= 0);

% 1. Parte continua de x_2(t): Los bloques (escalones)
% Estos representan las pendientes que tenía x_1(t)
x2_escalones = 4*u(t+3) - 6*u(t+2) + 2*u(t+1) - 2*u(t-1) + 6*u(t-2) - 4*u(t-3);

% 2. Parte impulsiva de x_2(t): Los deltas de Dirac
% Estos representan los saltos verticales que tenía x_1(t)
t_deltas = [-2, 0, 2];      % Ubicación en el tiempo de los impulsos
peso_deltas = [-4, 4, -4];  % "Tamaño" o área de cada impulso

% --- Creación de la gráfica ---
figure;
hold on; grid on;

% Graficamos los escalones en azul
plot(t, x2_escalones, 'b', 'LineWidth', 2);

% Graficamos los impulsos en rojo usando 'stem' (parecerán flechas)
stem(t_deltas, peso_deltas, 'r', 'LineWidth', 2, 'Marker', '^', 'MarkerFaceColor', 'r');

% Línea negra gruesa para resaltar el eje horizontal (cero)
yline(0, 'k', 'LineWidth', 1.5); 

% Ajustes visuales
title('Derivada x_2(t) = x''_1(t)');
xlabel('Tiempo (segundos)'); 
ylabel('Amplitud');
axis([-4 4 -6 6]); % Ajustamos los ejes para que se vea todo claro

% Agregamos texto para indicar el "peso" de los impulsos en la gráfica
text(-2.2, -4.5, '(-4)', 'Color', 'r', 'FontWeight', 'bold');
text(0.2, 4.5, '(4)', 'Color', 'r', 'FontWeight', 'bold');
text(1.8, -4.5, '(-4)', 'Color', 'r', 'FontWeight', 'bold');

legend('Escalones (Pendientes de x_1)', 'Impulsos \delta (Saltos de x_1)', 'Location', 'best');
hold off;