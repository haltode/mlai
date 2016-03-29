clear;
close all;
clc;


% Step 1 : load data
fprintf('Loading data...\n');
load('data.mat');
% X = features, m = number of examples
m = size(X, 1);

fprintf('Pause. Press ENTER to continue...\n\n');
pause;


% Step 2 : initialize values
K = 3;
max_iters = 10;

centroids = init_centroids(X, K);
prev_centroids = centroids;
index_centroids = zeros(m, 1);


% Step 3 : run K-means algorithm and plot the process
fprintf('Running K-means algorithm...\n\n');

figure;
hold on;

for i=1:max_iters
   fprintf('Iteration %d/%d...\n', i, max_iters);

   % Assign each example in X to it's closest centroid
   index_centroids = find_closest_centroids(X, centroids);

   % Plot progression
   plotProgresskMeans(X, centroids, prev_centroids, index_centroids, K, i);
   prev_centroids = centroids;
   fprintf('Press ENTER to continue...\n');
   pause;

   % Update the centroids
   centroids = get_new_centroids(X, index_centroids, K);
end

hold off;
