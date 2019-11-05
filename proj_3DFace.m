clear all;
clc;
% x = 2 : 6;
% y = (3 : 8)';
% X = ones(size(y)) * x;
% Y = y * ones(size(x));
% plot(X,Y, 'ro');
% grid on;
% axis([0, 10, 0 , 10]);

% x = 1 : 10;
% y = 2 : 9;
% [X, Y] = meshgrid(x,y);
% plot(X, Y, 'ro');

% row = 4;
% col = 3;
% x = 1 : row;
% y = 1 : col;
% [X, Y] = meshgrid(x, y);
% plot(X, Y, 'ro');
% axis([0, row + 1, 0, col + 1]);
% grid on;

% t = -2 : 0.2 : 2;
% [X, Y] = meshgrid(t);
% Z = X .* exp(-X^2 - Y.^2);
% subplot(1,3,1);mesh(X,Y,Z);
% subplot(1,3,2);surf(X,Y,Z);
% subplot(1,3,3);plot3(X,Y,Z);
% grid on;

% t = -2 : 0.2 : 2;
% [X, Y] = meshgrid(t);
% Z = X .* exp(-X^2 - Y.^2);
% subplot(2,2,1);meshc(X,Y,Z);
% subplot(2,2,2);meshz(X,Y,Z);
% subplot(2,2,3);surfc(X,Y,Z);
% subplot(2,2,4);surfl(X,Y,Z);
% grid on;

% [x,y,z] = sphere();
% subplot(1,3,1);
    % mesh(x,y,z);
    % grid on;
    % axis equal;
% subplot(1,3,2);
    % surf(x,y,z);
    % grid on;
    % axis equal;
% subplot(1,3,3);
    % plot3(x,y,z);
    % grid on;
    % axis equal;

% subplot(1,3,1);
% [x, y, z] = cylinder;
% surf(x, y, z);
% subplot(1,3,2);
% t = linspace(0, 2 * pi, 40);
% [x, y, z] = cylinder(2 + cos(t), 30);
% surf(x, y, z);
% subplot(1,3,3);
% [x, y, z] = cylinder(0 : 0.2 : 2, 30);
% surf(x, y, z);

% [x, y, z] = cylinder(1, 500);
% z = [-1 * z(2,:); z(2,:)];
% plot3(x, y, z);
% hold on;
% plot3(y, z, x);
% axis equal;

% u = linspace(-5, 5, 1000);
% v = linspace(-5, -2, 1000);
% funx = u.*sin(v);
% funy = -u.*cos(v);
% funz = v;
% plot3(funx, funy, funz);


