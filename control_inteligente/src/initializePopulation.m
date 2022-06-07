function [population] = initializePopulation(populationNumber,chromosomes)

    genes = zeros(populationNumber,chromosomes);
    health = zeros(populationNumber,1);

    for i=1:populationNumber
        genes(i,:) = rand(1,chromosomes).^2*10;
    end

    population.genes = genes;
    population.health = health;

end