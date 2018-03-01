% Matlab m-file for ECE 214 Lab #5 - Oscillator
addpath('C:\CppSim\CppSimShared\HspiceToolbox');
clear variables;
hspc_filename = 'ECE214_2018_Oscillator.hspc';

%% Define variables, specify NGspice control statement, and run NGspice
hspc_addline('.tran 1u 2m', hspc_filename);
ngsim(hspc_filename); % run NGspice

%% load simulation results and extract time, Vout, and Vin
data = loadsig('simrun.raw');
Vout1 = evalsig(data,'vout1');
Vout2 = evalsig(data, 'vout2');
time = evalsig(data, 'TIME');

%% plot Vout1 as a function of time
fs = 16; % define font size
lw = 1.5; % define linewidth

Fig1 = figure('Position', [200, 75, 850, 600]); % figure size and location
plot(time, Vout1,'linewidth',lw);
hold on
set(gca, 'fontsize', fs); % set font size
ylabel('Output Voltage (V)', 'fontsize', fs); % label y-axis
xlabel('Time (s)', 'fontsize', fs); % label x-axis
title('ECE 214: Lab 5 - Oscillator'); % title
grid on; % add grid

%% Plot Vout2
plot(time, Vout2, 'linewidth',lw);
%% end of M file
