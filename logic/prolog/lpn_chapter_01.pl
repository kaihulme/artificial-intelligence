%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% Learn Prolog Now! Chapter 1 Exercises %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% 1.1: Which of the following sequences of characters are atoms, which are
%%%      variables, and which are neither?
%
%     01: vINCENT
%     02: Footmassage
%     03: variable23
%     04: Variable2000
%     05: big_kahuna_burger
%     06: 'big kahuna burger'
%     07: big kahuna burger
%     08: 'Jules'
%     09: _Jules
%     10: '_Jules'
%
%% 01: atom
%% 02: var
%% 03: atom
%% 04: var
%% 05: atom
%% 06: atom
%% 07: neither
%% 08: atom
%% 09: var
%% 10: atom
%

%%% Exercise 1.2 Which of the following sequences of characters are atoms, which
%%%              are variables, which are complex terms, and which are not terms
%%%              at all? Give the functor and arity of each complex term.
%
%     01: loves(Vincent,mia)
%     02: 'loves(Vincent,mia)'
%     03: Butch(boxer)
%     04: boxer(Butch)
%     05: and(big(burger),kahuna(burger))
%     06: and(big(X),kahuna(X))
%     07: _and(big(X),kahuna(X))
%     08: (Butch kills Vincent)
%     09: kills(Butch Vincent)
%     10: kills(Butch,Vincent
%
%% 01: complex term: functor=loves, arity=2
%% 02: atom
%% 03: not a term
%% 04: complex term: functor=boxer, arity=1
%% 05: complex term: functor=and, arity=2
%% 06: complex term: functor=and, arity=2
%% 07: not a term
%% 08: not a term
%% 09: not a term
%% 10: not a term
%

%%% Exercise 1.3 How many facts, rules, clauses, and predicates are there in the
%%% following knowledge base? What are the heads of the rules, and what are the
%%% goals they contain?
%
%     1: woman(vincent).
%     2: woman(mia).
%     3: man(jules).
%     4: person(X):- man(X); woman(X).
%     5: loves(X,Y):- father(X,Y).
%     6: father(Y,Z):- man(Y), son(Z,Y).
%     7: father(Y,Z):- man(Y), daughter(Z,Y).
%
%% 1-3 are facts (3 facts)
%% 4-7 are rules (4 rules)
%% 1-7 are clauses (7 clauses)
%% woman, man, person, loves, father, son, daughter are predicates (7 predicates)
%
%% Head         Goal
%% person(X)    man(x), woman(x)
%% loves(X,Y)   father(X,Y)
%% father(Y,Z)  man(Y), son(Z,Y)
%% father(Y,Z)  man(Y), daughter(Z,Y)
%

%%% Exercise 1.4 Represent the following in Prolog:
%
%     Butch is a killer. Answer:killer(butch)
%     Mia and Marsellus are married.
%     Zed is dead.
%     Marsellus kills everyone who gives Mia a footmassage.
%     Mia loves everyone who is a good dancer.
%     Jules eats anything that is nutritious or tasty.
%
%% killer(butch).
%% married(Mia, Marsellus).
%% dead(Zed).
%% kills(Marsellus, X):- footmassage(X, Mia).
%% loves(Mia, X):- goodDancer(X).
%% eats(Jules, X):- nutritious(X) ; tasty(X).
%

%%% Exercise 1.5 Suppose we are working with the following knowledge base:
%
%     wizard(ron).
%     hasWand(harry).
%     quidditchPlayer(harry).
%     wizard(X):- hasBroom(X), hasWand(X).
%     hasBroom(X):- quidditchPlayer(X).
%
%%% How does Prolog respond to the following queries?
%
%     1: wizard(ron).
%     2: witch(ron).
%     3: wizard(hermione).
%     4: witch(hermione).
%     5: wizard(harry).
%     6: wizard(Y).
%     7: witch(Y).
%
%% 1: true
%% 2: unknown procedure
%% 3: false
%% 4: unknown procedure
%% 5: true
%% 6: Y = ron ; Y = harry
%% 7: unknown procedure
%
