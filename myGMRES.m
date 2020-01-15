% Generalized Minimal Residual method to solve Ax=b
% See https://en.wikipedia.org/wiki/Generalized_minimal_residual_method 
% for mathematical details

function x=myGMRES(m,k)

% Set up to solve tridiagonal system for class (easily changed)
A=tridia(m);
x_true(m,1);
b=A*x_true;
H=zeros(k+1,k);
Q=zeros(m,k+1);
Q(:,1)=b/norm(b);

for n=1:k
   v=A*Q(:,n);
   for i=1:n
       H(i,n)=(Q(:,i))'*v; v=v-H(i,n)*Q(:,i);
   end
   
   H(n+1,n)=norm(v);
  
   if H(n+1,n)==0 
       e1=zeros(n,1);
       e1(1)=1;
       y=H(1:n,1:n)\(norm(b)*e1);
       x=Q(1:n,1:n)*y;
       break 
       
   else 
       e1=zeros(n+1,1);
       e1(1)=1;
       [Qhat,Rhat]=qr(H(1:n+1,1:n),0);
       y=Rhat\((Qhat)'*norm(b)*e1);
       x=(Q(:,1:n))*y;
   end 
   
   %Print norm every 5 iterations
   if rem(n,5)==0
      res=norm(x-x_true);
      fprintf('The normed difference for n= %i is %1.4e \n',n,res)
   end 
     Q(:,n+1)=v/H(n+1,n); 
end 
end 
