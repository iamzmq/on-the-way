%%
%% Read file
%%

file(FileName, FileContent) :-  
    open(FileName, read, Stream, [eof_action(eof_code)]),
    readFile(Stream, FileContent).

readFile(Stream, Content) :- 
    get0(Stream, A), 
    readFile(Stream, A, Content).

readFile(_, -1, []).

readFile(Stream, A, [A|Result]) :- 
    readFile(Stream, Result).

