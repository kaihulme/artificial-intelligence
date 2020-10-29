% clear screen
clear :- write('\33\[2J').

% This is the main predicate, and should be true only when A is your identity
% find_identity(-A)
find_identity(A) :- actor(A) .

% This is a helper predicate and should find all the links for a particular actor
% find_links_by_actor(+A,-L)
find_links_by_actor(A,L) :- wp(A, WikiText),
                            wt_link(WikiText, L).

find_secret_actor(A) :- actor(A),
                        wp(A, WikiText),
                        wt_link(WikiText, L),
                        agent_ask_oracle(A, o(1), L, Ans),
                        Ans \= 'I do not know' .


