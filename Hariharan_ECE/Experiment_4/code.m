clear;
clc;
close all;

%% PARAMETERS
N_RB = 20;      % Total Resource Blocks
N_users = 5;    % Number of Users

%% Equal Allocation
base = floor(N_RB / N_users);
rem = mod(N_RB, N_users);

alloc_equal = zeros(1, N_RB);
idx = 1;

for u = 1:N_users
    take = base + (u <= rem);
    alloc_equal(idx:idx+take-1) = u;
    idx = idx + take;
end

%% Round-Robin Allocation
alloc_rr = zeros(1, N_RB);

for rb = 1:N_RB
    alloc_rr(rb) = mod(rb-1, N_users) + 1;
end

%% Plot Results
figure;

subplot(2,1,1);
imagesc(alloc_equal);
colormap(parula(N_users));
cb1 = colorbar;
cb1.Ticks = 1:N_users;
cb1.TickLabels = {'U1','U2','U3','U4','U5'};
title('Equal Resource Block Allocation');
xlabel('Resource Block Index');
ylabel('Time Slot');

subplot(2,1,2);
imagesc(alloc_rr);
colormap(parula(N_users));
cb2 = colorbar;
cb2.Ticks = 1:N_users;
cb2.TickLabels = {'U1','U2','U3','U4','U5'};
title('Round-Robin Resource Block Allocation');
xlabel('Resource Block Index');
ylabel('Time Slot');
