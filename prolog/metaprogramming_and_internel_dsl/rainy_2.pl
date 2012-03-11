:-op(700, xfy, becomes).
becomes(Area, Weather) :-
    Fact =.. [Weather, Area],
    Goal =.. [assert, Fact], 
    call(Goal).

:- beijing becomes rainy.
:- shanghai becomes rainy.
:- beijing becomes cold.
:- tianjin becomes cold.

freeze(Where) :- rainy(Where), cold(Where).
