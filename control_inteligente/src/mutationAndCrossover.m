function newIndividual = mutationAndCrossover(individual, population, F, CR)
    
    populationNumber = size(population,1);
    chromosomeNumber = size(population,2);

    newIndividual = population(individual,:);
        
    % Select random individuals apart from oneself
    randomPopulation = randperm(populationNumber);
    randomIndividuals = randomPopulation(randomPopulation~=individual);
    
    % Mutate chromosomes
    for chromosome = 1:chromosomeNumber
        if (rand(1) < CR)
            newIndividual(1,chromosome) =...
                population(randomIndividuals(3), chromosome)...
                + F*(population(randomIndividuals(1), chromosome)...
                -population(randomIndividuals(2), chromosome));
        end
        if (newIndividual(1,chromosome) < 0)
            newIndividual(1,chromosome) = 0;
        end
    end       
end