%%
%% Parser
%% 
%% prog -> statement*
%% statement -> '(' item+ ')'
%% item -> digit |
%%         identifer |
%%         '+' |
%%         '-' |
%%         '*' | 
%%         '/' |
%%         statement
%%

parser([], []).

parser(In, Statements) :-
    matchStatements(In, [], [], Statements).

matchStatements([], _, ReversedStatements, Statements) :- reverse(ReversedStatements, Statements).

matchStatements(In, Out, StatementsSoFar, Statements) :-
    matchStatement(In, TempOut, Statement),
    matchStatements(TempOut, Out, [Statement|StatementsSoFar], Statements).

matchStatement(In, Out, Items) :- 
    match(In, lp, AfterMatchLp),
    matchItems(AfterMatchLp, AfterMatchItems, [], Items),
    match(AfterMatchItems, rp, Out).

matchItems(In, Out, ItemsSoFar, Items) :-
    matchStatement(In, TempOut, ItemValue),
    matchItems(TempOut, Out, [ItemValue|ItemsSoFar], Items).

matchItems([rp|In], [rp|In], ItemsSoFar, Items) :-
    reverse(ItemsSoFar, Items).

matchItems(In, Out, ItemsSoFar, Items) :-
    match(In, Item, TempOut),
    matchItems(TempOut, Out, [Item|ItemsSoFar], Items).

match([Element|Out], Element, Out).

