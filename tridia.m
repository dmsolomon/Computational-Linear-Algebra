%Function to build tridiagonal matrix of size m

function A=tridia(m)

A=zeros(m,m);

for i=1:m
    A(i,i)=2+1/100;
end 

% off diagonal elements 

for i=1:m-1
    A(i,i+1)=-1;
    A(i+1,i)=-1;    
end   
end
