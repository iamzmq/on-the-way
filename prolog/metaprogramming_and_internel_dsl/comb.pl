comb([], []).
comb([X|T], [X|Comb]) :- comb(T, Comb).
comb([_|T], Comb) :- comb(T, Comb).
