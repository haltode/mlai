function index_centroids = find_closest_centroids(X, centroids)

m = size(X, 1);
K = size(centroids, 1);

% For each example, find the closest centroids to it and store it's index
for i=1:m
   min_dist = Inf;
   for j=1:K
      dist = sum((X(i,:) - centroids(j,:)) .^ 2);
      if dist < min_dist
         min_dist = dist;
         index_centroids(i) = j;
      end
   end
end

end
