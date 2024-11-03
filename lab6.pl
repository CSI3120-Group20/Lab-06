%  Task A

% Question 1
% Base Case
factorial(0, Acc, Result) :- Result is Acc.

% Error Case
factorial(N, _, Result) :- N < 0, Result = 'Error: Input must be a non-negative integer.'. % Note that 'is' evaluates arithmetic expressions, '=' sets a variable to other datatypes

% Recursive Case
% Code based on a factorial program implemented in another course
factorial(N, Acc, Result) :- Acc1 is Acc*N, N1 is N-1, factorial(N1, Acc1, Result).

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

% First Call
second_maximum([H|T], Result) :- second_maximum_recursive(T, H, H, Result).

% Error - List too small
second_maximum(_, Result) :- Result = 'Error: List must contain at least two distinct elements.'.

% Recurisve Case
second_maximum_recursive([H|T], _, Max, Result) :- H > Max, second_maximum_recursive(T, Max, H, Result1), Result=Result1.
second_maximum_recursive([H|T], SecondMax, Max, Result) :- H < Max, H > SecondMax, second_maximum_recursive(T, H, Max, Result1), Result=Result1.
second_maximum_recursive([H|T], SecondMax, Max, Result) :- SecondMax = Max, second_maximum_recursive(T, H, Max, Result1), Result=Result1. % This case is necessary to account for many instances of the Max
second_maximum_recursive([_|T], SecondMax, Max, Result) :- second_maximum_recursive(T, SecondMax, Max, Result1), Result=Result1.

% Base Case - Error - No two distinct elements
second_maximum_recursive([], SecondMax, Max, Result) :- SecondMax = Max, Result = 'Error: List must contain at least two distinct elements.'.
% Base Case
second_maximum_recursive([], SecondMax, _, Result) :- Result = SecondMax.

%  Task B

%  Task C