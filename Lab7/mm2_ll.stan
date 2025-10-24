

data {
  int<lower=0> N;
  vector<lower=0>[N] x;
  vector<lower=0>[N] y;
  vector[6] hp;
}


parameters {
  real<lower=0> a;
  real<lower=0> b;
  real<lower=0> sigma;
}


model {
  a     ~ normal(hp[1], hp[2]);
  b     ~ normal(hp[3], hp[4]);
  sigma ~ normal(hp[5], hp[6]);
  y ~ normal(a*pow(x,2)./(b + pow(x,2)), sigma);
}


generated quantities {
  vector[N] log_lik;
  for(n in 1:N) 
    log_lik[n] = normal_lpdf(y[n] | a*pow(x[n],2)/(b + pow(x[n],2)), sigma);
}

