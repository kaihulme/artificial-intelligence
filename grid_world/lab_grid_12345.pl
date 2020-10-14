% clear screen
clear :- write('\33\[2J').

% True if A is a possible movement direction
m(A) :- A == 'n' ; A == 's' ;
        A == 'e' ; A == 'w' .

% True if p(X,Y) is on the board
on_board(p(X, Y)) :- ailp_grid_size(N) ,
                    X > 0  , Y > 0 ,
                    X =< N , Y =< N .

% True if p(X1,Y1) is one step in direction M from p(X,Y) (no bounds check)
pos_step(p(X, Y), M, p(X1, Y1)) :- ( M == 'n' , X1 is X   , Y1 is Y-1 ) ;
                                   ( M == 's' , X1 is X   , Y1 is Y+1 ) ;
                                   ( M == 'e' , X1 is X+1 , Y1 is Y ) ;
                                   ( M == 'w' , X1 is X-1 , Y1 is Y ) .


% True if NPos is one step in direction M from Pos (with bounds check)
new_pos(Pos, M, NPos) :- pos_step(Pos,M,NPos) ,
                         on_board(NPos) .

% X2 is the square of X
square_x(X, X2) :- X2 is X*X.

% True if a L has the same length as the number of squares on the board
complete(L) :- ailp_grid_size(N) ,
               square_x(N, N2) ,
               L == N2 .

% Perform a sequence of moves creating a spiral pattern, return the moves as L
spiral(L) :- true.
             % my_agent(A) ,
             % get_agent_position(A, Pos) ,
             % new_pos(Pos, s, NPos),
             % agent_do_moves(A, L) .
