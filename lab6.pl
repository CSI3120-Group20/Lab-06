%  Task A

% Question 1
% Base Case
factorial(0, _, 1).

% Error Case
factorial(N, _, Result) :- N < 0, Result = 'Error: Input must be a non-negative integer.'. % Note that 'is' evaluates arithmetic expressions, '=' sets a variable to other datatypes

% Recursive Case
% Code based on a factorial program implemented in another course
factorial(N, _, Result) :- N1 is N-1, factorial(N1, _, Result1), Result is Result1*N.

% Question 2
% Both True Case
filter_list([H|T], [greater_than(G), multiple_of(M)], Result) :- conditions(H, G, M), filter_list(T, [greater_than(G), multiple_of(M)], NewResult), Result = [H|NewResult].

% One False Case
filter_list([H|T], [greater_than(G), multiple_of(M)], Result) :- not(conditions(H, G, M)), filter_list(T, [greater_than(G), multiple_of(M)], Result).

% Base Case True
filter_list([H], [greater_than(G), multiple_of(M)], Result) :- conditions(H, G, M), Result = [H].

% Base Case False
filter_list([H], [greater_than(G), multiple_of(M)], Result) :- not(conditions(H, G, M)), Result = [].

% Supplementary predicates
conditions(H, G, M) :- greater_than(H, G), multiple_of(H, M).
greater_than(A, B) :- A>B.
multiple_of(A, B) :- Remainder is A mod B, Remainder = 0.

% Question 3

%  Task B

%  Task C