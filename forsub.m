%Function to solve lower triangular system Lx=b

function x=forsub(L,b)

n=length(L);
x=zeros(n,1);

x(1)=b(1)/L(1,1);

for i=2:n
    
    x(i)=(b(i)-L(i,1:i-1)*x(1:i-1))/L(i,i);
    
end 
