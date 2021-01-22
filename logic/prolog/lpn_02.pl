%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% Learn Prolog Now! Chapter 2 Exercises %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 2.1: Which of the following pairs of terms unify? Where relevant, give the 
%% variable instantiations that lead to successful unification.

%% bread = bread
%% ’Bread’ = bread
%% ’bread’ = bread
%% Bread = bread
%% bread = sausage
%% food(bread) = bread
%% food(bread) = X
%% food(X) = food(bread)
%% food(bread, X) = food(Y, sausage)
%% food(bread, X, beer) = food(Y, sausage,X)
%% food(bread, X, beer) = food(Y, kahuna_burger)
%% food(X) = X
%% meal(food(bread), drink(beer)) = meal(X, Y)
%% meal(food(bread), X) = meal(X, drink(beer))

% true
% false
% true
% Bread = bread
% false
% false
% X = food(bread)
% X = bread
% X = sausage, Y = bread
% false
% false
% X = food(X)
% X = food(bread), Y = drink(beer)
% false

%% 2.2: We are working with the following knowledge base.

house_elf(dobby) .
witch(hermione) .
witch('McGonagall') .
witch(rita_skeeter) .
magic(X):- house_elf(X) .
magic(X):- wizard(X) .
magic(X):- witch(X) .

%% Which of the following queries are satisfied? Where relevant, give all the 
%% variable instantiations that lead to success.

%% ?- magic(house_elf) .
%% ?- wizard(harry) .
%% ?- magic(wizard) .
%% ?- magic(’McGonagall’) .
%% ?- magic(Hermione) .

% false
% false
% false
% true
% Hermione = dobby, Hermione = hermione, ...
% ... Hermione = 'McGonagall', Hermione = rita_skeeter

%% Draw the search tree for the query:

%% magic(Hermione) .

% ?- magic(Hermione).
% |
% +------------------------+----------------------.
% |                        |                      |
% ?- house_elf(Hermione).  ?- wizard(Hermione).   ?- witch(Hermione).
% |                        |                      |
% +-------------------.    #                      +----------------------+--------------------------+--------------------------.
% |                   |                           |                      |                          |                          |
% []                  #                           []                     []                         []                         #
% {Hermione = dobby}                              {Hermione = hermione}  {Hermione = 'McGonagall'}  {Hermione = rita_skeeter}

%% 2.3: Here is a tiny lexicon (that is, information about individual words) 
%% and  a mini grammar consisting of one syntactic rule (which defines a 
%% sentence to be an entity consisting of five words in the following order: a 
%% determiner, a noun, a verb, a determiner, a noun). 

word(determiner, a) .
word(determiner, every) .
word(noun, criminal).
word(noun, 'big kahuna burger') .
word(verb, eats) .
word(verb, likes) .

sentence(Word1, Word2, Word3, Word4, Word5):- word(determiner, Word1) ,
                                              word(noun, Word2) ,
                                              word(verb, Word3) ,
                                              word(determiner, Word4) ,
                                              word(noun, Word5) .

%% What query do you have to pose in order to find out which sentences the 
%% grammar can generate? List all sentences that this grammar can generate in 
%% the order that Prolog will generate them in.

% sentence(W1, W2, W3, W4, W5), 
% format("~w ~w ~w ~w ~w", [W1, W2, W3, W4, W5]).

%% 2.4: Here are six Italian words: astante, astoria, baratto, cobalto, pistola,
%% statale. They are to be arranged, crossword puzzle fashion 
%% (lpn.crossword.png). The following knowledge base represents a lexicon 
%% containing these words:

word(astante, a, s, t, a, n, t, e) .
word(astoria, a, s, t, o, r, i, a) .
word(baratto, b, a, r, a, t, t, o) .
word(cobalto, c, o, b, a, l, t, o) .
word(pistola, p, i, s, t, o, l, a) .
word(statale, s, t, a, t, a, l, e) .

%% Write a predicate crossword/6 that tells us how to fill in the grid. The 
%% first three  arguments should be the vertical words from left to right, and 
%% the last three arguments the horizontal words from top to bottom.

crossword(V1, V2, V3, H1, H2, H3):- 

    word(V1, V11, V12H12, V13, V14H22, V15, V16H32, V17) ,
    word(V2, V21, V22H14, V23, V24H24, V25, V26H34, V27) ,
    word(V3, V31, V32H16, V33, V34H26, V35, V36H36, V37) ,
    word(H1, H11, V12H12, H13, V22H14, H15, V32H16, H17) ,
    word(H2, H21, V14H22, H23, V24H24, H25, V34H26, H27) ,
    word(H3, H31, V16H32, H33, V26H34, H35, V36H36, H37) ,
    \+ member(V1, [V2, V3, H1, H2, H3]) ,

    format("    .---.   .---.   .---.\n") , flush_output ,
    format("    | ~w |   | ~w |   | ~w |    \n", [V11, V21, V31]) , flush_output ,
    format(".---+---+---+---+---+---+---.\n") , flush_output ,
    format("| ~w | ~w | ~w | ~w | ~w | ~w | ~w |\n", [H11, V12H12, H13, V22H14, H15, V32H16, H17]) , flush_output ,
    format("'---+---+---+---+---+---+---'\n") , flush_output ,
    format("    | ~w |   | ~w |   | ~w |    \n", [V13, V23, V33]) , flush_output ,
    format(".---+---+---+---+---+---+---.\n") , flush_output ,
    format("| ~w | ~w | ~w | ~w | ~w | ~w | ~w |\n", [H21, V14H22, H23, V24H24, H25, V34H26, H27]) , flush_output ,
    format("'---+---+---+---+---+---+---'\n") , flush_output ,
    format("    | ~w |   | ~w |   | ~w |    \n", [V15, V25, V35]) , flush_output ,
    format(".---+---+---+---+---+---+---.\n") , flush_output ,
    format("| ~w | ~w | ~w | ~w | ~w | ~w | ~w |\n", [H31, V16H32, H33, V26H34, H35, V36H36, H37]) , flush_output ,
    format("'---+---+---+---+---+---+---'\n") , flush_output ,
    format("    | ~w |   | ~w |   | ~w |    \n", [V17, V27, V37]) ,flush_output ,
    format("    '---'   '---'   '---'\n") , flush_output .