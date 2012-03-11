map(_F, [], []).
map(F, [H1|R1], [H2|R2]) :-
  call(F, H1, H2),
  map(F, R1, R2).

filter(_F, [], []).
filter(F, [HOrgi|ROrgi], Result) :-
  (call(F, HOrgi) -> Result = [HOrgi|Other]; Result = Other),
  filter(F, ROrgi, Other).

% foldr(_F, [A], A).
% foldr(F, [H|R], Result) :-
%   foldr(F, R, Result1),
%   call(F, H, Result1, Result).

foldr(_F, R, [], R).
foldr(F, E, [H|R], FinalResult) :-
  foldr(F, E, R, NewResult),
  call(F, H, NewResult, FinalResult).

foldl(_F, Result, [], Result).
foldl(F, CurrentResult, [H|R], FinalResult) :-
  call(F, CurrentResult, H, NewResult),
  foldl(F, NewResult, R, FinalResult).

