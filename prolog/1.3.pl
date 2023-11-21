man(pasha).
man(anton).
man(bogdan).
man(eugen).
man(alex).
man(petr).
man(ivan).

woman(eva).
woman(alice).
woman(mary).
woman(hannah).
woman(elizabeth).

father(pasha,anton).
father(pasha,mary).
father(anton,ivan).
father(petr,bogdan).

mother(eva,mary).
mother(eva,anton).
mother(alice,ivan).
mother(elizabeth,bogdan).
mother(hannah,eugen).

parent(pasha, anton).
parent(eva,anton).
parent(pasha,mary).
parent(eva,mary).
parent(anton,ivan).
parent(alice,ivan).
parent(petr,bogdan).
parent(elizabeth,bogdan).
parent(hannah,eugen).

is_mother(X):-mother(X,Child),write(Child).
is_father(X):-father(X,Child),write(Child).
son(X):-man(X),parent(_,X).
is_sister(X,Y):-woman(X),parent(A,X),parent(A,Y).
grandfather(X,Y):-father(X,Z),parent(Z,Y).
common_parents(X,Y):-parent(Z,X),parent(Z,Y).
