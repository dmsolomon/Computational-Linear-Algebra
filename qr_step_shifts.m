% QR algorithm for eigenvalues with Wilkinson shifts 

function [T]=qr_step_shift(m,iterations)

T=tridia(m);
for k=1:iterations 
    
    z1= (T(m-1,m-1)+T(m,m))/2 + sqrt(((T(m-1,m-1)-T(m,m))/2)^2+(T(m-1,m))^2);
    z2= (T(m-1,m-1)+T(m,m))/2 - sqrt(((T(m-1,m-1)-T(m,m))/2)^2+(T(m-1,m))^2);
    
    if T(m-1,m-1) < T(m,m)
        mu=z1;
    else 
        mu=z2;
    end
    
   [Q,R]=qr(T-mu*eye(m));
   T=R*Q+mu*eye(m);
   disp('Our matrix is:')
   disp(T)
   
end 
end
