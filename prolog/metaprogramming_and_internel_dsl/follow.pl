follow(guanyu, liubei).
follow(zhanfei, liubei).
follow(liubei, caocao).
follow(zhaoyun, caocao).
follow(caocao, boss).

searchFollower(A, B) :-
    follow(A, B).

searchFollower(A, B) :-
    follow(A, C),
    searchFollower(C, B).
