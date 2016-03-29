function centroids = init_centroids(X, K)

m = size(X, 1);

% Permute element's index in X, to shuffle them and choose K of them
rand_index = randperm(m);
centroids = X(rand_index(1:K),:);

end
