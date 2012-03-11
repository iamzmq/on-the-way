:- ['reader.pl'].
:- ['lexer.pl'].
:- ['parser.pl'].
:- ['scheme_runtime.pl']. 

scheme(A) :- 
    file(A, Content), 
    getTokens(Content, Tokens), 
    parser(Tokens, Statements),
    createSymbolTable(Statements, SymbolTable),
    calculate(Statements, SymbolTable).


