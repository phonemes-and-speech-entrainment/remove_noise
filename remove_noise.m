%linear regression used to remove noise
function F_pow = remove_noise(Pow,f)

valid = (f > 0) & (Pow > 0);

logf = log(f(valid));
logpow = log(Pow(valid));

H = [ones(length(logf),1), logf];

Astar = H \ logpow;

Ytilde = H * Astar;

L_pow = logpow - Ytilde;

F_pow = exp(L_pow);

end



