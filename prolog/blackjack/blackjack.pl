:-['overflow.pl'].

readPlayerInput(Input) :-
    seeing(Old),
    see(user),
    write('Continue? (yes/no) '),
    read(Input),
    seen,
    see(Old).

waitingPlayer(FinalPoints) :-
    waitingPlayer([], FinalPoints).

waitingPlayer('no', Cards, FinalPoints) :-
    sum(Cards, 0, FinalPoints).
    
waitingPlayer('yes', Cards, FinalPoints) :-
    !,
    NewCards = [5|Cards],
    writeln(NewCards),
    sum(NewCards, 0, Result),
    notOverflow(Result, player),
    !,
    readPlayerInput(Input),
    waitingPlayer(Input, NewCards, FinalPoints).

waitingPlayer(_, Cards, FinalPoints) :-
    writeln('Only yes/no are acceptable.'),
    readPlayerInput(Input),
    waitingPlayer(Input, Cards, FinalPoints).    

waitingPlayer(InitCards, FinalPoints) :-
    readPlayerInput(Input),
    waitingPlayer(Input, InitCards, FinalPoints).

sum([], Final, Final) :- !.

sum([FirstCard|Rest], Current, Final) :-
    NewResult is FirstCard + Current,
    sum(Rest, NewResult, Final),
    !.

waitingComputer(PlayerPoints) :-
    waitingComputer([], PlayerPoints).

waitingComputer(Cards, PlayerPoints) :-
    NewCards = [4|Cards],
    write('Computer Cards: '),
    writeln(NewCards),
    sum(NewCards, 0, Result),
    notOverflow(Result, computer),
    !,
    notOverPlayer(NewCards, Result, PlayerPoints).

notOverPlayer(Cards, Result, PlayerPoints) :-
    (Result > PlayerPoints ->
        true, write('computer Win!'), !;
        waitingComputer(Cards, PlayerPoints)).

c(A) :- waitingComputer(A).

game :-
    waitingPlayer(PlayerPoints),
    !,
    waitingComputer(PlayerPoints).


