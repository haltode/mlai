function centroids = get_new_centroids(X, index_centroids, K)

% For each centroids, compute centroid means to get it's new value
for i=1:K
   centroids_X = X(find(index_centroids == i),:);
   centroids(i,:) = (1 / size(centroids_X, 1)) * sum(centroids_X);
end

end
