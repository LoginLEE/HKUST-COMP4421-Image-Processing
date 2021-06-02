function f = Gaussian(M, N, sig)
if(mod(M,2) == 0)
    cM = floor(M/2) + 0.5;
else
    cM = floor(M/2) + 1;
end;
if(mod(N,2) == 0)
    cN = floor(N/2) + 0.5;
else
    cN = floor(N/2) + 1;
end;
a = [1:M];
b = [1:N];
A = repmat(a',1,N);
B = repmat(b,M,1);
A = (A-cM).^2;
B = (B-cN).^2;
f = exp(-(A+B)./(2*sig^2));