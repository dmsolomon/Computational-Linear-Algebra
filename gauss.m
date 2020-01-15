% LU factorization of matrix A using Gaussian elimination 

function [L,U]=gauss(A)

[m,n]=size(A);
U=A; 
L=eye(m);

for k=1:m-1
    for i=k+1:m
        
        L(i,k)=U(i,k)/U(k,k);
        U(i,k:m)=U(i,k:m)-L(i,k)*U(k,k:m);
        
    end 
end 
end    
