run(Statements) :- createSymbolTable(Statements, ST), calculate(Statements, ST).

createSymbolTable(Statements, ST) :- createSymbolTable(Statements, [], ST).

createSymbolTable([], ST, ST).

createSymbolTable([H|T], STSoFar, ST) :- 
    processDefine(H, STSoFar, Temp),
    createSymbolTable(T, Temp, ST).

calculate([], _).

calculate([H|T], ST) :-
    process(H, Result, ST), 
    write(Result), nl,
    calculate(T, ST).


%% Pass 1: Creates symbol table.
processDefine([define, Var, Value], ST, [[Var, Value]|ST]).
processDefine(_, ST, ST).


%%
%% Pass 2: Get result.
%%

%%
%% Runtime operators
%%
process(Number,     Result,  _)  :- number(Number), Result is Number.
process(Id,         Result, ST)  :- Id = ident(_), search(Id, ST, Result).
process([plus|T],   Result, ST)  :- add(T, Result, ST).
process([minus|T],  Result, ST)  :- minus(T, Result, ST).
process([mult|T],   Result, ST)  :- mult(T, Result, ST).
process([div|T],    Result, ST)  :- div(T, Result, ST).
process([define|_], define, _).      %% Ingnore define cause symbol table has been created at pass 1.

%%
%% Operators supported by runtime
%%
add([H|[]], Result, ST) :- process(H, Result, ST).
add([F,S|T], Result, ST) :- process(F, FV, ST), process(S, SV, ST), Temp is FV + SV, add([Temp|T], Result, ST).

minus([H|[]], Result, ST) :- process(H, Result, ST).
minus([F,S|T], Result, ST) :- process(F, FV, ST), process(S, SV, ST), Temp is FV - SV, minus([Temp|T], Result, ST).

mult([H|[]], Result, ST) :- process(H, Result, ST).
mult([F,S|T], Result, ST) :- process(F, FV, ST), process(S, SV, ST), Temp is FV * SV, mult([Temp|T], Result, ST).

div([H|[]], Result, ST) :- process(H, Result, ST).
div([F,S|T], Result, ST) :- process(F, FV, ST), process(S, SV, ST), Temp is FV / SV, div([Temp|T], Result, ST).

search(_, [], _) :- fail.
search(I, [[I, Result]|_], Result).
search(I, [_|T], Result) :- search(I, T, Result).



