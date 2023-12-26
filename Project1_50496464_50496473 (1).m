clc;        close all;       clear all;

%% Method A
N = 10000; % Total number of iteration 
Y = zeros(N,4); 
Z = zeros(N,1); 

for i=1:N
    Ball = [1 1 0 0]; % 1 - White & 0 - Black
    for select=4:-1:2 % Selecting 3 balls from the 4 balls.
        id = randi([1 select],1); 
        Ball(id) = []; 
    end
    Y(i, 2:4) = [0 0 0]; % Painting the selected balls to black.
    Y(i, 1) = Ball; 
    id = randi([1 4],1); % Friend to choose a ball from the new bowl.
    Z(i) = Y(i,id); 
end
result = sum(Z)/N; % Probability that the ball is white.


%% Method B

Y2 = zeros(N,4);
Z2 = zeros(N,1);

for i=1:N
    Ball = [1 1 0 0]; % 1 - White & 0 - Black
    for select=4:-1:2 % Selecting 3 balls from the 4 balls.
        id = randi([1 select],1);
        if select == 4
            remember = Ball(id);
        end
        Ball(id) = [];
    end
    Y2(i, 2:4) = [remember remember remember]; % Painting all the ball same colour as the first ball that is picked.
    Y2(i, 1) = Ball;
    id = randi([1 4],1); % Friend to choose a ball from the new bowl.
    Z2(i) = Y2(i,id);
end
result2 = sum(Z2)/N;  % Probability that the ball is white.

%% Method C

Y3 = zeros(N,4);
Z3 = zeros(N,1);

for i=1:N
    Ball = [1 1 0 0]; % 1 - White & 0 - Black
    black = 0; % Keep a count of number of black balls picked.
    white = 0; % Keep a count of number of white balls picked.
    remember = 0;
    for select=4:-1:2 
        id = randi([1 select],1); % Selecting 3 balls from the 4 balls.
        if Ball(id) == 0
            black = black + 1;
        else
            white = white + 1;
        end
        Ball(id) = [];
    end
    if white > black % Checking the max colour of balls picked.
        remember = 1;
    end
    Y3(i, 2:4) = [remember remember remember]; % Painting all the ball same colour as the max colour picked.
    Y3(i, 1) = Ball;
    id = randi([1 4],1); % Friend to choose a ball from the new bowl.
    Z3(i) = Y3(i,id);
end
result3 = sum(Z3)/N; % Probability that the ball is white.