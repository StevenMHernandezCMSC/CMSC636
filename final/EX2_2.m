A1 = [1 1 1 1,1 0 0 1,1 0 0 1,1 1 1 1,];
B1 = [1 1 1, 0 1 0, 0 1 0];

A2 = [0 0 0 0,1 1 1 1,0 0 0 0, 0 0 0 0];
B2 = [0 1 0, 1 1 1, 0 1 0];

A3 = [1 1 1 1,1 0 0 1,1 1 1 1,1 0 0 1,];
B3 = [1 1 1, 1 0 0, 1 1 1,];

W = (A1' * B1) + (A2' * B2) + (A3' * B3)


% Optimal
A1 = [0 0];
B1 = [1 0]; 

A2 = [1 0];
B2 = [0 1];

A3 = [0 1];
B3 = [1 1];

W = (A1' * B1) + (A2' * B2) + (A3' * B3)