% CS390 Week 7 - Assignment #9 Part 1
% Developer: Matt Hartigan
% Date: 22-June-2019
% Description: DFA implemented in Prolog.

startingState(q1).

finalState(q4).

transition(df1, q1, '0', q2).
transition(df1, q1, '1', q2).
transition(df1, q1, '.', q3).
transition(df1, q2, '0', q2).
transition(df1, q2, '1', q2).
transition(df1, q2, '.', q4).
transition(df1, q3, '0', q4).
transition(df1, q3, '1', q4).
transition(df1, q3, '.', q5).
transition(df1, q4, '0', q4).
transition(df1, q4, '1', q4).
transition(df1, q4, '.', q5).
transition(df1, q5, '0', q5).
transition(df1, q5, '1', q5).

% Returns list of all unique states in the input DFA.
allStates(DFA, States) :-
    findall(X, transition(DFA, X, _, _), Y), list_to_set(Y, States).

% Returns true if the input string is accepted by the input DFA.
dfaAccept(DFA, InputStr) :-
    string_to_list(InputStr, InputList),
    startingState(CurrentState),
    dfaAccept(DFA, InputList, CurrentState).

dfaAccept(DFA, [], CurrentState).
dfaAccept(DFA, [H|T], CurrentState) :-
    char_code(Label, H),
    transition(DFA, CurrentState, Label, NextState),
    dfaAccept(DFA, T, NextState).


