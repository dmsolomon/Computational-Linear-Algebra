% Preconditioned conjugate gradient method 
% https://en.wikipedia.org/wiki/Conjugate_gradient_method
% #The_preconditioned_conjugate_gradient_method

function x=PCG(m,k)

A=tridia(m);
M=tridia2(m);
x_true=ones(m,1);
b=A*x_true;
x=zeros(m,1);
r=b;
z=M\r;
p=z;

for n=1:k
    if r==zeros(m,1)
        fprintf('DONE')
        break 
        
    else 
        A_p=A*p;
        z_r=z'*r;
        alpha=z_r/(p'*A_p); x=x+alpha*p;
        r=r-alpha*A_p; z=M\r;
        beta=z'*r/z_r;
        p=z+beta*p;
    end 
    
   x_norm=sqrt((x_true-x)'*A*(x_true-x));
   fprintf('The normed difference with respect to A for n= %i is %1.4e \n',n,x_norm)
end 
end 
