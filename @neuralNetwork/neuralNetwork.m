function classifier = neuralNetwork(input_layer_size, hidden_layer_size, num_labels)
    classifier = struct();
    classifier.('input_layer_size') = input_layer_size;
    classifier.('hidden_layer_size') = hidden_layer_size;
    classifier.('num_labels') = num_labels;
    classifier = class(classifier, 'neuralNetwork');
end