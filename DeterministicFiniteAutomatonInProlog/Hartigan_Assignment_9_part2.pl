% CS390 Week 7 - Assignment #9 Part 2
% Developer: Matt Hartigan
% Date: 22-June-2019
% Description: Implement a family tree in Prolog.

male(conrad).
male(alfred).
male(jeff).
male(ken).
male(greg).
male(matthew).
male(charley).
male(harry).

female(nevada).
female(patricia).
female(beth).
female(audrey).
female(maude).
female(pam).
female(marcia).
female(sandi).
female(laura).
female(sarah).
female(maggie).

married(conrad, nevada).
married(alfred, patricia).
married(ken, audrey).
married(greg, maude).

parent(conrad, beth).
parent(conrad, audrey).
parent(conrad, maude).
parent(nevada, beth).
parent(nevada, audrey).
parent(nevada, maude).
parent(alfred, pam).
parent(alfred, jeff).
parent(alfred, ken).
parent(alfred, marcia).
parent(alfred, sandi).
parent(patricia, pam).
parent(patricia, jeff).
parent(patricia, ken).
parent(patricia, marcia).
parent(patricia, sandi).
parent(ken, matthew).
parent(ken, laura).
parent(ken, sarah).
parent(audrey, matthew).
parent(audrey, laura).
parent(audrey, sarah).
parent(greg, charley).
parent(greg, harry).
parent(greg, maggie).
parent(maude, charley).
parent(maude, harry).
parent(maude, maggie).

dog_owner(laura, nate).
dog_owner(sarah, beans).
dog_owner(audrey, chocolate).

% Returns true if Y is a grandparent of X.
grandparent(X, Y) :-
    parent(Z, Y),
    parent(X, Z).

% Returns true if Y is a sibling of X.
sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    x \== Y.

% Returns true if Y is a sister of X.
sister(X, Y) :-
    female(Y),
    sibling(X, Y),
    X \== Y.

% Returns true if Y is a brother of X.
brother(X, Y) :-
    male(Y),
    sibling(X, Y),
    X \== Y.

% Returns true if Y is the mother of X.
mother(X, Y) :-
    female(Y),
    parent(Y, X).

% Returns true if Y is the father of X.
father(X, Y) :-
    male(Y),
    parent(Y, X).

% Returns true if Y is X's aunt.
aunt(X, Y) :-
    parent(Z, X),
    sister(Z, Y).
aunt(X, Y) :-
    female(Y),
    parent(A, X),
    sibling(A, B),
    married(Y, B).

% Returns true if Y is X's uncle.
uncle(X, Y) :-
    parent(Z, X),
    brother(Z, Y).
uncle(X, Y) :-
    male(Y),
    parent(A, X),
    sibling(A, B),
    married(B, Y).

% Returns true if Y is X's cousin.
cousin(X, Y) :-
    parent(A, X),
    parent(B, Y),
    sibling(A, B),
    A \== B.

% Returns true if Y is X's niece.
niece(X, Y) :-
    parent(A, Y),
    sibling(X, A),
    A \== X.
niece(X, Y) :-
    parent(A, Y),
    sibling(B, A),
    married(X, B),
    A \== B.

% Returns true if Y is X's nephew.
nephew(X, Y) :-
    parent(A, Y),
    sibling(X, A),
    A \== X.
nephew(X, Y) :-
    parent(A, Y),
    sibling(B, A),
    married(X, B),
    A \== B.

% Returns true if Y is X's granddog.
granddog(X, Y) :-
    dog_owner(Z, Y),
    parent(A, Z),
    A = X.
