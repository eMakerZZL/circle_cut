clear all;
clc;
% vector plot
% x = [2.5 3.5 4   5];
% y = [1.5 2.0 1 1.5];
% plot(x, y);

% x = 1 : 10;
% y = [1 : 10; 11 : 20];
% plot(x, y);

% x = 1 : 10;
% y = [x.', x.' + 10];
% plot(x, y);

% x = linspace(0, 2 * pi, 100);
% y = [sin(x); sin(2 * x); sin(0.5 * x);];
% plot(x, y);

% t = 0 : 0.01 : 2 * pi;
% t1 = t';
% x = [t1, t1, t1];
% y = [sin(t1), sin(2 * t1), sin(0.5 * t1)];
% plot(x, y);

% t1 = linspace(0, 2 * pi, 10);
% t2 = linspace(0, 2 * pi, 20);
% t3 = linspace(0, 2 * pi, 100);
% plot(t1, sin(t1), t2, sin(t2) + 1, t3, sin(t3) + 2);

% fplot(@(x) sin(1./x),[0, 0.2], 'b');

% x = @(t) t .* sin(t);
% y = @(t) t .* cos(t);
% fplot(x,[0, 10 * pi], 'r');
% fplot(y,[0, 10 * pi], 'b');

% x = @(t) t .* sin(t);
% y = @(t) t .* cos(t);
% t = linspace(0, 10 * pi, 1000);
% A = x(t);
% B = y(t);
% plot(A,B);

