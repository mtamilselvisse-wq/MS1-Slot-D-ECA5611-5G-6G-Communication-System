clear;
clc;
close all;

%% 5G NR Parameters
BW = 100e6;                  % Bandwidth (100 MHz)
subcarrierSpacing = 30e3;    % 30 kHz Subcarrier Spacing
Nsub = BW / subcarrierSpacing; % Total subcarriers
codeRate = 0.85;             % Coding rate
MIMO_layers = 4;             % 4x4 MIMO

%% Modulation Schemes & Bits per Symbol
mod_scheme = {'QPSK','16QAM','64QAM','256QAM'};
bits_per_symbol = [2 4 6 8];

%% Throughput Calculation

throughput = zeros(1,length(bits_per_symbol));

for i = 1:length(bits_per_symbol)

    bps = bits_per_symbol(i);

    % Throughput Formula
    % T = Bits per Symbol × Number of Subcarriers × Coding Rate × MIMO Layers
    T = bps * Nsub * codeRate * MIMO_layers;

    throughput(i) = T / 1e6;    % Convert to Mbps

end

%% Plot Throughput

figure;

bar(throughput,0.6);

set(gca,...
    'XTickLabel',mod_scheme,...
    'FontSize',12,...
    'FontWeight','bold');

xlabel('Modulation Scheme');
ylabel('Throughput (Mbps)');
title('5G NR Throughput for QPSK to 256QAM');
grid on;
