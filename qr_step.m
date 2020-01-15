% QR algorithm for eigenvalues

function [T]=qr_step(m,iterations)

T=tridia(m);
for k=1:iterations
    
   [Q,R]=qr(T);
   T=R*Q;
   
   % Print every 10 iterations
   if rem(k,10)==0
       fprintf('For k= %i our matrix is: \n',k)
       disp(T)
   end 
   
end 
end
