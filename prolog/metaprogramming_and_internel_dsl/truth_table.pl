:-op(1000, xfy, 'and').
:-op(1000, xfy, 'or').
:-op(900, fy, 'not').

%
% Find variables in boolean expression.
%
find_vars(X, V, V) :- member(X, [0, 1]), !.
find_vars(X, VariablesFound, Anwser) :- atom(X), member(X, VariablesFound), Anwser = VariablesFound.
find_vars(X, VariablesFound, Anwser) :- atom(X), Anwser = [X|VariablesFound]. 
find_vars(X and Y, VariablesFound, Anwser) :- find_vars(X, VariablesFound, Temp), find_vars(Y, Temp, Anwser).
find_vars(X or Y,  VariablesFound, Anwser) :- find_vars(X, VariablesFound, Temp), find_vars(Y, Temp, Anwser).
find_vars(not X,   VariablesFound, Anwser) :- find_vars(X, VariablesFound, Anwser).

%
% Initlization of assign values.
%
init_assign([], []).
init_assign([_|T], [0|VT]) :- init_assign(T, VT).

%
% Binary add.
%
binary_add(X, Result) :- reverse(X, R), do_binary_add(R, ReversedResult), reverse(ReversedResult, Result).
do_binary_add([0|X], [1|X]).
do_binary_add([1|X], [0|Y]) :- do_binary_add(X, Y).

% truth_value(Expresion, Variables, AssignValues, Result).
% truth_value(x and (y or z), [x,y,z], [0, 0, 1], V).

truth_value(X, Variables, AssignValues, Result) :- 
    atom(X), search(X, Variables, AssignValues, Result).

truth_value(X and Y, Variables, AssignValues, Result) :-
    truth_value(X, Variables, AssignValues, R1),
    truth_value(Y, Variables, AssignValues, R2),
    boolean_and(R1, R2, Result).

truth_value(X or Y, Variables, AssignValues, Result) :-
    truth_value(X, Variables, AssignValues, R1),
    truth_value(Y, Variables, AssignValues, R2),
    boolean_or(R1, R2, Result).
    
truth_value(not X, Variables, AssignValues, Result) :-
    truth_value(X, Variables, AssignValues, R),
    boolean_not(R, Result).   

search(Atom, [Atom|_], [HA|_], HA).
search(Atom, [_|T], [_|T1], Result) :- search(Atom, T, T1, Result).

boolean_and(1, 1, 1).
boolean_and(_, _, 0).

boolean_or(0, 0, 0).
boolean_or(_, _, 1).

boolean_not(1, 0).
boolean_not(0, 1).

tt(BooleanExpression) :-
    find_vars(BooleanExpression, [], TempVariables),
    reverse(Variables, TempVariables),
    writeln(Variables),
    init_assign(Variables, InitAssign),
    display_result(BooleanExpression, Variables, InitAssign).

display_result(BooleanExpression, Variables, Assignment) :-
    truth_value(BooleanExpression, Variables, Assignment, R),
    write(Assignment),
    write('='),
    writeln(R),
    (binary_add(Assignment, NextAssignment) -> 
          display_result(BooleanExpression, Variables, NextAssignment) ; true).
