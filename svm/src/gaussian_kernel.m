function similarity = gaussian_kernel(x1, x2, sigma)

% We ensure that x1 and x2 are column vectors
x1 = x1(:);
x2 = x2(:);

numerator = sum((x1 - x2) .^ 2);
denominator = 2 * sigma ^ 2;
similarity = exp(-numerator/denominator);

end
