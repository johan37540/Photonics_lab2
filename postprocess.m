%% Spectrometer
data = ["A10.csv"; "A20.csv"; "A30.csv"; "A40.csv"; "A50.csv"; "A60.csv"; "A70.csv"; "A80.csv"; "A90.csv"; "A100.csv"];
N = size(data);

fig1 = figure(1);
ax1 = axes('Parent', fig1);

for i=1:N(1)
    M = readtable(data(i));
    plot(ax1, M.wavelength, M.A);
    if i<N(1)
        hold on;
    end
end

legend(ax1, "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%")
title(ax1, 'Spectrometer')
xlabel(ax1, '\lambda [\mu m]')
ylabel(ax1, 'Intensity (a.u.)')


%% OSA

data_OSA = ["OSA_A0.CSV"; "OSA_A10.CSV"; "OSA_A20.CSV"; "OSA_A30.CSV"; "OSA_A40.CSV"; "OSA_A50.CSV"; "OSA_A60.CSV"; "OSA_A70.CSV"; "OSA_A80.CSV"; "OSA_A90.CSV"; "OSA_A100.CSV"];
N1 = size(data_OSA);

p = readtable('parameter_OSA.csv');

fig2 = figure(2);
ax2 = axes('Parent', fig2);

Noise = readtable(data_OSA(1));
for i=2:N1(1)
    M = readtable(data_OSA(i));
    plot(ax2, p.START+(p.STOP-p.START)/size(M,1) *M.INDEX , M.A - Noise.A);
    hold on;
end
xlabel(ax2, 'wavelength');
ylabel(ax2, 'Intensity [DBm]');
title(ax2, 'OSA')



    
    


