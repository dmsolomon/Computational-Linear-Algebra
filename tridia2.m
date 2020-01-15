% Another tridia function, used in PCG

function M=tridia2(m)
M=zeros(m,m);

for i=1:m
    M(i,i)=2;
end 

for i=1:m-1
    M(i,i+1)=-1;
    M(i+1,i)=-1;
end     
end
