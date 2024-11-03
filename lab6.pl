%  Task A

% Question 1
% Code based on a factorial program implemented in another course
factorial(N, _, R) :-
    N>0,
    N1 is N-1,
    factorial(N1, _, R1),
    /*go down to R1=1, then go back up again multiplying each R by N*/
    R is R1*N.

factorial(0, _, 1).
factorial(N, _, R) :- N < 0, R = 'Error: Input must be a non-negative integer.'. % Note that 'is' evaluates arithmetic expressions, '=' sets a variable to other datatypes

% Question 2
% Both True Case
filter_list([H|T], [G, M], Result) :- conditions(H, G, M), filter_list(T, [G, M], NewResult), Result = [H|NewResult].

% One False Case
filter_list([H|T], [G, M], Result) :- not(conditions(H, G, M)), filter_list(T, [G, M], Result).

% Base Case True
filter_list([H], [G, M], Result) :- conditions(H, G, M), Result = [H].

% Base Case False
filter_list([H], [G, M], Result) :- not(conditions(H, G, M)), Result = [].

% Supplementary predicates
conditions(H, G, M) :- greater_than(H, G), multiple_of(H, M).
greater_than(A, B) :- A>B.
multiple_of(A, B) :- Remainder is A mod B, Remainder = 0.

% Question 3

%  Task B

%  Task C