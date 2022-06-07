addpath('src/')

clear

% Differential Evolution algorithm
populationNumber = 5;
chromosomes = 3;
maxIterations = 50;
F = 0.7;
CR = 0.5;

bestPopulation = differentialEvolution(populationNumber,chromosomes,maxIterations, F, CR);

% Simulate system with the best individual
results = simulate(bestPopulation.genes(end,:));

%% Plot results

% Colors
jet = [46 47 47]/255;
chestnut = [182 69 69]/255;
pantone = [63, 173, 80]/255;
orangePeel = [255, 159, 28]/255;
blueCrayola = [62, 146, 204]/255;

% Pressure
pressureGraphic = figure;
hold on
plot(results.time, results.pressure,'LineWidth',2,'Color',blueCrayola)
plot(results.time, ones(length(results.time))*30,'LineStyle','-','Color',chestnut)
plot(results.time, ones(length(results.time))*10,'LineStyle','-','Color',chestnut)
ylabel('pressure (mbar)')
xlabel('time (s)')
yticks([10,30])
yticklabels({'PEEP', 'plateau'})
title('Pressure')
hold off

% Health
healthGraphic = figure;
plot(1:maxIterations,bestPopulation.health,'LineWidth',2,'Color',orangePeel)
ylabel('cost')
xlabel('iterations')
title('Cost')

% PID
pidGraphic = figure;
hold on
subplot(3,1,1); plot(1:maxIterations,bestPopulation.genes(:,1),'LineWidth',2,'Color',jet)
ylabel('Kp')
xlabel('iterations')
title('Kp')

subplot(3,1,2); plot(1:maxIterations,bestPopulation.genes(:,2),'LineWidth',2,'Color',chestnut)
ylabel('Ki')
xlabel('iterations')
title('Ki')

subplot(3,1,3); plot(1:maxIterations,bestPopulation.genes(:,3),'LineWidth',2,'Color',pantone)
ylabel('Kd')
xlabel('iterations')
title('Kd')
hold off

%% Print to PDF

% Pressure
set(pressureGraphic,'PaperSize',[20 15]); 
print(pressureGraphic,'pressure','-dpdf')

% Cost
set(healthGraphic,'PaperSize',[20 15]); 
print(healthGraphic,'health','-dpdf')

% PID
set(pidGraphic,'PaperSize',[20 15]); 
print(pidGraphic,'pid','-dpdf')