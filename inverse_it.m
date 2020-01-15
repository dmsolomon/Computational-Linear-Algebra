% Inverse iteration method to approximate eigenvectors (1 iteration)
% See https://en.wikipedia.org/wiki/Inverse_iteration 
% for mathematical details 

function v=inverse_it(m,j)

T=tridia(m);
% Known eigenvalue for particular problem
mu=4*(sin(j*pi/(2*(m+1))))^2;

v=rand(m,1);
v=v/norm(v);

w=(T-mu*eye(m))\v;
v=w/norm(w);

end
