% myDiffusion.m - Diffusion routines

function img = myDiffusion(img, K, iterate)

img = double(img);

[m,n] = size(img);

%lambda = 0.250;
lambda = .125;

rowC = [1:m]; rowN = [1 1:m-1]; rowS = [2:m m];
colC = [1:n]; colE = [2:n n]; colW = [1 1:n-1];

for i = 1:iterate
    deltaN = img(rowN,colC) - img(rowC,colC);
    deltaS = img(rowS,colC) - img(rowC,colC);
    deltaE = img(rowC,colE) - img(rowC,colC);
    deltaW = img(rowC,colW) - img(rowC,colC);

    fluxN = deltaN .* (1 ./ (1+sqrt(deltaN.^2)/K));
    fluxS = deltaS .* (1 ./ (1+sqrt(deltaS.^2)/K));
    fluxE = deltaE .* (1 ./ (1+sqrt(deltaE.^2)/K));
    fluxW = deltaW .* (1 ./ (1+sqrt(deltaW.^2)/K));
    img = img + lambda*(fluxN +fluxS + fluxE + fluxW);   
end

img = mat2gray(img);