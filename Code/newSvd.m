
function [U,S,V] = newSvd(A)

%Step 1. 
AT = A';         
ATA = AT * A;   

%Step 2.
[eig_vec, eig_val] = eig(ATA);  
[eig_val_sorted, ind] = sort(diag(eig_val), 'descend');   
singular_values = sqrt(eig_val_sorted);

% Step 3.
S = diag(singular_values);
S_inv = diag(1./singular_values);        

%Step 4.
V = eig_vec(:, ind);            
VT = V';                        

%Step 5. 
U = A * V * S_inv;              
A_reconstructed = U * S * VT;   
end
