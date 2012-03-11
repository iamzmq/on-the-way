
:- ['date.pl'].
:- ['data.pl'].

training(Subject, Arrangements) :- 
    subject(Subject, Duration, [Month, Date]), 
    date(DayOfYear, Month, Date),
    subjectDuration(Subject, _Area, NumberOfGroup),
    Interval is DayOfYear // NumberOfGroup,
    BeginDay is DayOfYear - 1,
    collect(Subject, Interval, BeginDay, Duration, NumberOfGroup, [], Arrangements),
    report(Arrangements).

report([]).

report([H|R]) :-
    writeln(H),
    report(R).

collect(_Subject, _Interval, _BeginDay, _Duration, 0, Arrangements, Arrangements).

collect(Subject, Interval, BeginDay, Duration, NumberOfGroup, TempArrangements, FinalArrangements) :-
    collectOneClassInSubject(Subject, BeginDay, Duration, TempArrangements, T2),
    RestNumberOfGroup is NumberOfGroup - 1,
    NextBeginDay is BeginDay - Interval,
    collect(Subject, Interval, NextBeginDay, Duration, RestNumberOfGroup, T2, FinalArrangements).

collectOneClassInSubject(_Subject, _BeginDay, 0, Arrangements, Arrangements).

collectOneClassInSubject(Subject, BeginDay, Duration, ArrangementsForNow, FinalResult) :-
    date(BeginDay, Month, Date),
    TheArrangement = [Subject, Month, Date],
    RestDuration is Duration - 1,
    NextBeginDay is BeginDay - 1,
    collectOneClassInSubject(Subject, NextBeginDay, RestDuration, [TheArrangement|ArrangementsForNow], FinalResult).



    
