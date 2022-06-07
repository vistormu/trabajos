function [bestPopulation] = differentialEvolution(populationNumber, chromosomes, maxIterations, F, CR)
    
    % Initialize population
    population = initializePopulation(populationNumber, chromosomes);
    bestPopulation.genes = zeros(maxIterations, chromosomes);
    bestPopulation.health = zeros(maxIterations, 1);
    
    disp(['Initalized population of ' num2str(populationNumber) ' members'])
    
    % Calculate health
    for i = 1:populationNumber
        result = simulate(population.genes(i,:));
        health = fitnessFunction(result);
        population.health(i,1) = health;
    end
    
    for iteration = 1:maxIterations
        
        disp('%%%%%')
        disp(['Iteration number ' num2str(iteration)])

        newGeneration = population;

        for individual = 1:populationNumber
            
            % Mutation and crossover
            newIndividual = mutationAndCrossover(individual, population.genes, F, CR);
            
            % Check the performance of the individual
            newResult = simulate(newIndividual);
            newHealth = fitnessFunction(newResult);
            
            % Select the best individual
            if (newHealth < population.health(individual,1))
                newGeneration.genes(individual,:) = newIndividual;
                newGeneration.health(individual,1) = newHealth;
            end
        end
        
        % Discard the worst individuals
        population = discard(newGeneration);

        bestPopulation.genes(iteration,:) = population.genes(1,:);
        bestPopulation.health(iteration,1) = population.health(1);

        disp(['Best individual: Kp=' num2str(population.genes(1,1)) ' Ki=' num2str(population.genes(1,2)) ' Kd=' num2str(population.genes(1,3))])

    end
end