%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% Learn Prolog Now! Chapter 4 Exercises %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 4.1: How does Prolog respond to the following queries?

%% [a, b, c, d] = [a, [b, c, d]] .
%% [a, b, c, d] = [a| [b, c, d]] .
%% [a, b, c, d] = [a, b, [c, d]] .
%% [a, b, c, d] = [a, b | [c, d]] .
%% [a, b, c, d] = [a, b, c, [d]] .
%% [a, b, c, d] = [a, b, c | [d]] .
%% [a, b, c, d] = [a, b, c, d, []] .
%% [a, b, c, d] = [a, b, c, d | []] .
%% [] = _ .
%% [] = [_] .
%% [] = [_ | []] .

% false
% true
% false
% true
% false
% true
% false
% true
% true
% false
% false

%% 4.2: Which of the following are syntactically correct lists? If the 
%% representation is correct, how many elements does the list have?

%% [1 | [2, 3, 4]]
%% [1, 2, 3 | []]
%% [1 | 2, 3, 4]
%% [1 | [2 | [3 | [4]]]]
%% [1, 2, 3, 4 | []]
%% [[] | []]
%% [[1, 2] | 4]
%% [[1, 2], [3, 4] | [5, 6, 7]]

% [1, 2, 3, 4], length = 4
% [1, 2, 3], length = 3
% incorrect
% [1, 2, 3, 4], length = 4
% [1, 2, 3, 4], length = 4
% [[]], length = 1
% incorrect
% [[1, 2], [3, 4], 5, 6, 7], length = 5

%% 4.3: Write a predicate second(X,List) which checks whether X is the second 
%% element of List.

second(X, List):- List = [_, X | _] .

%% 4.4: Write a predicate swap12(List1,List2) which checks whether List1 is 
%% identical to List2, except that the first two elements are exchanged.

swap12(List1, List2):- List1 = [A, B | L] ,
                       List2 = [B, A | L] .

%% 4.5: Suppose we are given a knowledge base with the following facts:

tran(eins, one) .
tran(zwei, two) .
tran(drei, three) .
tran(vier, four) .
tran(fuenf, five) .
tran(sechs, six) .
tran(sieben, seven) .
tran(acht, eight) .
tran(neun, nine) .

%% Write a predicate listtran(G,E) which translates a list of German number 
%% words to the corresponding list of English number words. For example: 

%% listtran([eins, neun, zwei], X) .
%% X = [one, nine, two] .

%% Your program should also work in the other direction. For example:

%% listtran(X, [one, seven, six, two]) .
%% X = [eins, sieben, sechs, zwei] .

%% (Hint: to answer this question, first ask yourself “How do I translate the 
%% empty list of number words?”. That’s the base case. For non-empty lists, 
%% first translate the head of the list, then use recursion to translate 
%% the tail.)

listtran([], []) .
listtran([GH | GT], [EH | ET]) :- tran(GH, EH) ,
                                  listtran(GT, ET) .

%% 4.6: Write a predicate twice(In,Out) whose left argument is a list, and 
%% whose right argument is a list consisting of every element in the left list 
%% written twice. For example:

%% twice([a, 4, buggle], X) .
%% X = [a, a, 4, 4, buggle, buggle]) .

%% twice([1, 2, 1, 1], X) .
%% X = [1, 1, 2, 2, 1, 1, 1, 1] .

%% (Hint: to answer this question, first ask yourself “What should happen when 
%% the first argument is the empty list?”. That’s the base case. For non-empty 
%% lists, think about what you should do with the head, and use recursion to 
%% handle the tail.)

twice([], []) .
twice([H | T], [H, H | OT]):- twice(T, OT) .

% 4.7: Draw the search trees for the following three queries:

%% ?- member(a, [c, b, a, y]).

% ?- member(a, [c, b, a, y]) .
% |
% ?- member(a, [b, a, y]) .
% |
% ?- member(a, [a, y]) .
% |
% []

%% ?- member(x, [a, b, c]) .

% ?- member(x, [a, b, c]) .
% |
% ?- member(x, [a, b]) .
% |
% ?- member(x, [a]) .
% |
% ?- member(x, []) .
% |
% #

%% ?- member(X, [a, b, c]) .

%         ?- member(X, [a, b, c]) .
%         |
% .-------+-------.
% |               |
% []              ?- member(X, [b, c]) .
% {X / a}         |
%         .-------+-------.
%         |               |
%         []              ?- member(X, [c]) .
%         {X / b}         |
%                 .-------+-------.
%                 |               |
%                 []              ?- member(X, []) .
%                 {X / c}         |
%                                 #