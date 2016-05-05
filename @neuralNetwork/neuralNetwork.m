function classifier = neuralNetwork(hidden_layer_size)
    classifier = struct();
    classifier.('hidden_layer_size') = hidden_layer_size;
    classifier = class(classifier, 'neuralNetwork');
end