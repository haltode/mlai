function W = rand_init_weights(L_in, L_out)

epsilon = 0.12;
W = rand(L_out, 1 + L_in) * 2 * epsilon - epsilon;

end
