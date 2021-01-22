%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% Learn Prolog Now! Chapter 1 Exercises %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 1.1: Which of the following sequences of characters are atoms, which are
%% variables, and which are neither?

%% vINCENT
%% Footmassage
%% variable23
%% Variable2000
%% big_kahuna_burger
%% 'big kahuna burger'
%% big kahuna burger
%% 'Jules'
%% _Jules
%% '_Jules'

% atom
% var
% atom
% var
% atom
% atom
% neither
% atom
% var
% atom

%% 1.2: Which of the following sequences of characters are atoms, which are 
%% variables, which are complex terms, and which are not terms at all? Give the
%% functor and arity of each complex term.

%% loves(Vincent,mia)
%% 'loves(Vincent,mia)'
%% Butch(boxer)
%% boxer(Butch)
%% and(big(burger),kahuna(burger))
%% and(big(X),kahuna(X))
%% _and(big(X),kahuna(X)) 
%% (Butch kills Vincent)
%% kills(Butch Vincent)
%% kills(Butch,Vincent

% complex term: functor=loves, arity=2
% atom
% not a term
% complex term: functor=boxer, arity=1
% complex term: functor=and, arity=2
% complex term: functor=_and, arity=2
% not a term
% not a term
% not a term
% not a term

%% 1.3: How many facts, rules, clauses, and predicates are there in the
%% following knowledge base?

woman(vincent) .
woman(mia) .
man(jules) .
person(X):- man(X); woman(X) .
loves(X, Y):- father(X, Y) .
father(Y, Z):- man(Y), son(Z, Y) .
father(Y, Z):- man(Y), daughter(Z, Y) .  

% 1-3 are facts (3 facts)
% 4-7 are rules (4 rules)
% 1-7 are clauses (7 clauses)
% woman, man, person, loves, father, son, daughter are predicates (7)

%% What are the heads of the rules, and what are the goals they contain?

% HEAD          GOAL
% person(X)     man(x), woman(x)
% loves(X, Y)   father(X, Y)
% father(Y, Z)  man(Y), son(Z, Y)
% father(Y, Z)  man(Y), daughter(Z, Y)

%% 1.4: Represent the following in Prolog:

%% Butch is a killer.
%% Mia and Marsellus are married.
%% Zed is dead.
%% Marsellus kills everyone who gives Mia a footmassage.
%% Mia loves everyone who is a good dancer.
%% Jules eats anything that is nutritious or tasty.

% ?- killer(butch) .
% ?- married(Mia, Marsellus) .
% ?- dead(Zed) .
% ?- kills(Marsellus, X):- footmassage(X, Mia) .
% ?- loves(Mia, X):- gooddancer(X) .
% ?- eats(Jules, X):- nutritious(X) ; tasty(X) .

%% 1.5: Suppose we are working with the following knowledge base:

wizard(ron) .
hasWand(harry) .
quidditchPlayer(harry) .
wizard(X):- hasBroom(X), hasWand(X) .
hasBroom(X):- quidditchPlayer(X) .

%% How does Prolog respond to the following queries?

%% wizard(ron) .
%% witch(ron) .
%% wizard(hermione) .
%% witch(hermione) .
%% wizard(harry) .
%% wizard(Y) .
%% witch(Y) .

% true
% unknown procedure
% false
% unknown procedure
% true
% Y = ron ; Y = harry
% unknown procedure