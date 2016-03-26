function [C, sigma] = select_params(X, y, Xval, yval)

C_best = 0;
sigma_best = 0;
err_min = 1000000000;

values = [0.01 0.03 0.1 0.3 1 3 10 30]';
nb_val = length(values);

count = 1;
nb_total = nb_val ^ 2;

% Try each possible 'values' for C and sigma, and pick the best one
for i=1:nb_val
   C = values(i);
   for j=1:nb_val
      sigma = values(j);

      fprintf('%d/%d\n', count, nb_total);
      model = svmTrain(X, y, C, @(x1, x2) gaussian_kernel(x1, x2, sigma));
      predictions = svmPredict(model, Xval);
      err = mean(double(predictions ~= yval));

		if(err < err_min)
         err_min = err;
         C_best = C;
         sigma_best = sigma;
      end

      count = count + 1;
   end
end

C = C_best;
sigma = sigma_best;

end
