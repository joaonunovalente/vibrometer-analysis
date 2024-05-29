%------------------------------------------------------------------------
% PhD
% 
% João Nuno Valente - jnvalente@ua.pt
% DEM, UA
%------------------------------------------------------------------------
clear; close all; clc;

%------------------------------------------------------------------------
% Load data
%------------------------------------------------------------------------
S = load("../data/data.mat").data;
field_names = fieldnames(S);

f = linspace(0, 5000, 3201);   % or f = S.N1.f;
N = length(field_names);
n = length(S.N1.f);

%------------------------------------------------------------------------
% Compute data for different angles
%------------------------------------------------------------------------
% Orthogonal direction
NOrthogonal = S.N1.FRF_vibrometer;

% Angle 20 degrees
Ne_real_20 = cosd(70) * real(S.N3.FRF_vibrometer);
Nd_real_20 = cosd(20) * real(S.N7.FRF_vibrometer);
Ne_imag_20 = cosd(70) * imag(S.N3.FRF_vibrometer);
Nd_imag_20 = cosd(20) * imag(S.N7.FRF_vibrometer);
sum_real_20 = Ne_real_20 + Nd_real_20;
sum_imag_20 = Ne_imag_20 + Nd_imag_20;
sum_mag_20 = abs(sum_real_20 + 1i * sum_imag_20);

% Angle 30 degrees
Ne_real_30 = cosd(60) * real(S.N4.FRF_vibrometer);
Nd_real_30 = cosd(30) * real(S.N6.FRF_vibrometer);
Ne_imag_30 = cosd(60) * imag(S.N4.FRF_vibrometer);
Nd_imag_30 = cosd(30) * imag(S.N6.FRF_vibrometer);
sum_real_30 = Ne_real_30 + Nd_real_30;
sum_imag_30 = Ne_imag_30 + Nd_imag_30;
sum_mag_30 = abs(sum_real_30 + 1i * sum_imag_30);

% Angle 45 degrees
Ne_real_45 = cosd(45) * real(S.N2.FRF_vibrometer);
Nd_real_45 = cosd(45) * real(S.N5.FRF_vibrometer);
Ne_imag_45 = cosd(45) * imag(S.N2.FRF_vibrometer);
Nd_imag_45 = cosd(45) * imag(S.N5.FRF_vibrometer);
sum_real_45 = Ne_real_45 + Nd_real_45;
sum_imag_45 = Ne_imag_45 + Nd_imag_45;
sum_mag_45 = abs(sum_real_45 + 1i * sum_imag_45);

% Average sum across all angles
avg_real = (sum_real_20 + sum_real_30 + sum_real_45) / 3;
avg_imag = (sum_imag_20 + sum_imag_30 + sum_imag_45) / 3;
avg_mag = abs(avg_real + 1i * avg_imag);

%------------------------------------------------------------------------
% Visualize data
%------------------------------------------------------------------------
% Magnitude response plot
fig1 = figure('WindowState','maximized');
semilogy(f, abs(NOrthogonal), '--k', 'DisplayName', 'Orthogonal');
hold on;
semilogy(f, sum_mag_20, 'DisplayName', 'Angle 20º');
semilogy(f, sum_mag_30, 'DisplayName', 'Angle 30º');
semilogy(f, sum_mag_45, 'DisplayName', 'Angle 45º');
semilogy(f, avg_mag, 'b', 'DisplayName', 'Average');
hold off;

title("Vibrometer response"); 
xlabel("Frequency [Hz]"); 
ylabel("Magnitude"); 
grid on; legend('show');

% 3D (Real and Imaginary) plot
fig2 = figure('WindowState','maximized');
plot3(f, real(NOrthogonal), imag(NOrthogonal), '--k', 'DisplayName', 'Orthogonal')
hold on;
plot3(f, sum_real_20, sum_imag_20, 'DisplayName', 'Angle 20º')
plot3(f, sum_real_30, sum_imag_30, 'DisplayName', 'Angle 30º')
plot3(f, sum_real_45, sum_imag_45, 'DisplayName', 'Angle 45º')
plot3(f, avg_real, avg_imag, 'b', 'DisplayName', 'Average')
hold off;

title("Vibrometer response | 3D"); 
xlabel("Frequency [Hz]"); 
ylabel("Real part"); 
zlabel("Imaginary part"); 
grid on; legend('show');

% Real part plot
fig3 = figure('WindowState','maximized');
plot(f, real(NOrthogonal), '--k', 'DisplayName', 'Orthogonal');
hold on;
plot(f, sum_real_20, 'DisplayName', 'Angle 20º');
plot(f, sum_real_30, 'DisplayName', 'Angle 30º');
plot(f, sum_real_45, 'DisplayName', 'Angle 45º');
plot(f, avg_real, 'b', 'DisplayName', 'Average');
hold off;

title("Vibrometer response | Real part"); 
xlabel("Frequency [Hz]"); 
ylabel("Real part"); 
grid on; legend('show');

% Imaginary part plot
fig4 = figure('WindowState','maximized');
plot(f, imag(NOrthogonal), '--k', 'DisplayName', 'Orthogonal');
hold on;
plot(f, sum_imag_20, 'DisplayName', 'Angle 20º');
plot(f, sum_imag_30, 'DisplayName', 'Angle 30º');
plot(f, sum_imag_45, 'DisplayName', 'Angle 45º');
plot(f, avg_imag, 'b', 'DisplayName', 'Average');
hold off;

title("Vibrometer response | Imaginary part"); 
xlabel("Frequency [Hz]"); 
ylabel("Imaginary part"); 
grid on; legend('show');

%------------------------------------------------------------------------
% Save results
%------------------------------------------------------------------------
% saveas(fig1,'../results/Orthogonal vs Average - Magnitude.jpg');
% saveas(fig2,'../results/Orthogonal vs Average - 3D plot.jpg');
% saveas(fig3,'../results/Orthogonal vs Average - Real part.jpg');
% saveas(fig4,'../results/Orthogonal vs Average - Imaginary part.jpg');

