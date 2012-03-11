notOverflow(0, _).
notOverflow(1, _).
notOverflow(2, _).
notOverflow(3, _).
notOverflow(4, _).
notOverflow(5, _).
notOverflow(6, _).
notOverflow(7, _).
notOverflow(8, _).
notOverflow(9, _).
notOverflow(10, _).
notOverflow(11, _).
notOverflow(12, _).
notOverflow(13, _).
notOverflow(14, _).
notOverflow(15, _).
notOverflow(16, _).
notOverflow(17, _).
notOverflow(18, _).
notOverflow(19, _).
notOverflow(20, _).
notOverflow(21, _).


notOverflow(_, Who) :-
    write('Overflow: '),
    write(Who),
    writeln(' failed.'),
    fail.
