function [discardedPopulation] = discard(population)
    
    populationNumber = length(population.genes);

    % Sort population by health
    populationExt = [population.health population.genes];
    populationExtSorted = sortrows(populationExt,1);

    newPopulation = populationExtSorted;

    % Discard 5% of worst individuals
    discardNumber = round(populationNumber*0.05);

    for i = 1:discardNumber

        % Substitute with one random individual from the upper half
        randomIndividuals = randperm(round(populationNumber/2));
        newPopulation(end+1-i,:) = populationExtSorted(randomIndividuals(i),:);
    end

    discardedPopulation.genes = newPopulation(:,2:end);
    discardedPopulation.health = newPopulation(:,1);

end