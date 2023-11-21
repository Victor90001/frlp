a(moscow, omsk, 58).
a(omsk, samara, 23).
a(chelyaba, ufa, 15).
a(samara, krasnoyarsk, 52).
a(chelyaba, voronezh, 10).
a(krasnodar, omsk, 33).
a(krasnodar, voronezh, 5).
a(krasnodar, samara, 39).
a(krasnoyarsk, ufa, 25).


legal(X,[]).
legal(X,[H|T]):- \+ X = H, legal(X,T).

rev([],[]).
rev([H|T], L):-rev(T,Z), append(Z,[H],L).

go3(Routes, Dest, Route):-
    shortest(Routes, Shortest, RestRoutes),
    proceed(Shortest, Dest, RestRoutes, Route).

proceed(r(Dist, Route), Dest, _, Route):-
    Route=[Dest|_].
proceed(r(Dist, [Last|Trail]), Dest, Routes, Route):-
    findall(r(D1, [Z,Last|Trail]),legalnode(Last, Trail,Z,Dist,D1),List),
    append(List,Routes,NewRoutes),
    go3(NewRoutes, Dest,Route).

shortest([Route|Routes],Shortest,[Route|Rest]):-
    shortest(Routes, Shortest, Rest),
    shorter(Shortest, Route),!.
shortest([Route|Rest], Route, Rest).
shorter(r(M1,_),r(M2,_)):-M1<M2.

legalnode(X,Trail,Y,Dist,NewDist):-
    (   a(X,Y,Z);a(Y,X,Z)),
    legal(Y,Trail),
    NewDist is Dist + Z.

go(Start, Dest, Route):-
    go3([r(0,[Start])],Dest,R),
    rev(R, Route).

