function W = initWeights(c, L_in, L_out)
% Randomly initialize the weights of a layer with L_in incoming connections
% and L_out outgoing connections.
% Usage: W = randInitializeWeights(L_in, L_out)

    epsilon_init = 0.12;
    W = rand(L_out, 1 + L_in) * 2 * epsilon_init - epsilon_init;
end
