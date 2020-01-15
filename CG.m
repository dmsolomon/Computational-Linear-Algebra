%Function to numerically solve positive semi-definite system Ax=b

function x=CG(m,k)

% Call tridia function (doesn't need to be tri diagonal)
% See https://en.wikipedia.org/wiki/Conjugate_gradient_method 
% for mathematical details of the method

A=tridia(m);
x_true=ones(m,1);
b=A*x_true;
x=zeros(m,1);
r=b;
p=r;

for n=1:k
    if r==zeros(m,1)
        fprintf('DONE')
        break 
    
    else 
        A_p=A*p;
        r_r=r'*r;
        alpha=r_r/(p'*A_p); x=x+alpha*p;
        r=r-alpha*A_p;
        beta=r'*r/r_r;
        p=r+beta*p;
    end
    
    % Print the "A" norm of the difference every 5 iterations
    if rem(n,5)==0
        x_norm=sqrt((x_true-x)'*A*(x_true-x));
        fprintf('The normed difference with respect to A for n= %i is %1.4e \n',n,x_norm)
    end 
end
end 
