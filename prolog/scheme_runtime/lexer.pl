%% 
%% The simple lexer supports a small set of scheme.  
%%
%% States:
%%  identifier digit start define error 
%%

getTokens(Input, Tokens) :- getTokens(Input, [], Tokens).

getTokens([], Tokens, ReservedTokens) :- reverse(ReservedTokens, Tokens). 

getTokens(Input, TokensSoFar, Tokens) :-
    getToken(Input, Rest, ws), 
    getTokens(Rest, TokensSoFar, Tokens).

getTokens(Input, TokensSoFar, Tokens) :-
    getToken(Input, Rest, OneToken), 
    getTokens(Rest, [OneToken|TokensSoFar], Tokens).

%%
%% getToken(StartState, EndState, MatchedChar, RestChars, Token)
%%

getToken([40|Rest], Rest, lp).          %% (
getToken([41|Rest], Rest, rp).          %% )
getToken([42|Rest], Rest, mult).        %% *
getToken([43|Rest], Rest, plus).        %% +
getToken([45|Rest], Rest, minus).       %% -
getToken([47|Rest], Rest, div).         %% /
getToken([100,101,102,105,110,101|Rest], Rest, define).         %% define
getToken([WS|Rest], Rest, ws) :-        %% white space
    whiteSpace(WS).
getToken([D|R], Rest, Digit) :-
    digit(D),
    getNumberToken([D|R], Rest, [], Digit).
    
getToken([I|R], Rest, Identifier) :-
    identifier(I),
    getIdentifierToken([I|R], Rest, [], T),
    Identifier = ident(T).

getNumberToken([D|R], Rest, Result, T) :-
    digit(D),
    getNumberToken(R, Rest, [D|Result], T).

getNumberToken([Ter|R], [Ter|R], Result, T) :-
    single(Ter),
    reverse(Result, R1),
    atom_chars(Acom, R1),
    atom_number(Acom, T).

getIdentifierToken([I|R], Rest, Result, T) :-
    identifier(I), 
    getIdentifierToken(R, Rest, [I|Result], T).

getIdentifierToken([D|R], Rest, Result, T) :-
    digit(D), 
    getIdentifierToken(R, Rest, [D|Result], T).

getIdentifierToken([Ter|R], [Ter|R], Result, T) :-
    single(Ter),
    reverse(Result, R1),
    atom_chars(T, R1).

whiteSpace(32).
whiteSpace(9).
whiteSpace(10).
digit(D) :-  47 < D, D < 58.
identifier(L) :- 64 < L, L < 91.
identifier(L) :- 96 < L, L < 123.
single(T) :- whiteSpace(T); T=40; T=41; T=42; T=43; T=45; T=47.

