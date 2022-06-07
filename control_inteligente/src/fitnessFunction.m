function health = fitnessFunction(result)

    negativeError = -result.error(result.error<0);
    positiveError = result.error(result.error>=0);
    
    health = sum(positiveError)/length(positiveError) +...
        2*sum(negativeError)/length(negativeError);

end