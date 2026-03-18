%heavyside -> escalón unitario

%Creando un vector para graficar entre -3 y 3
t = linspace(-3, 3, 100000);

%Creando la primera función
x1 = (t+2).*heaviside(t+2);

%Dibujando la primer función
plot(t, x1);

