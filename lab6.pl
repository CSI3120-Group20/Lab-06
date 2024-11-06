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
filter_list([], _, Result) :- Result = [].

% Supplementary predicates
conditions(H, G, M) :- greater_than(H, G), multiple_of(H, M).
greater_than(A, B) :- A>B.
multiple_of(A, B) :- Remainder is A mod B, Remainder = 0.

% Question 3

% First Call
second_max([H|T], Result) :- second_max_recursive(T, H, H, Result).

% Error - List too small
second_max(_, Result) :- Result = 'Error: List must contain at least two distinct elements.'.

% Recurisve Case
second_max_recursive([H|T], _, Max, Result) :- H > Max, second_max_recursive(T, Max, H, Result1), Result=Result1.
second_max_recursive([H|T], SecondMax, Max, Result) :- H < Max, H > SecondMax, second_max_recursive(T, H, Max, Result1), Result=Result1.
second_max_recursive([H|T], SecondMax, Max, Result) :- SecondMax = Max, second_max_recursive(T, H, Max, Result1), Result=Result1. % This case is necessary to account for many instances of the Max
second_max_recursive([_|T], SecondMax, Max, Result) :- second_max_recursive(T, SecondMax, Max, Result1), Result=Result1.

% Base Case - Error - No two distinct elements
second_max_recursive([], SecondMax, Max, Result) :- SecondMax = Max, Result = 'Error: List must contain at least two distinct elements.'.
% Base Case
second_max_recursive([], SecondMax, _, Result) :- Result = SecondMax.


%  Task B
% This predicate recursively find the first person in the list who is taller than a
% specified height and the age between a minimum (Inclusive) and maximum (Exclisive) range.
% Once a match is found, the search should stop.
% 
% Return the result in `Result`

% The base case: if the input list is empty, the Result is 'No match found.'
taller_than([], _, _, 'No match found.').

% Recursive case: If the first person in the list is matched, return it.
taller_than([person(Name, Height, Age) | _], SpecHeight, age_in_range(MinAge, MaxAge), person(Name, Height, Age)) :-
    Height > SpecHeight,
    Age >= MinAge,
    Age < MaxAge,
    % Cut here to stop after finding the first match.
    !. 

% Recursive case: If the first person in the list doesn't match, check the rest of the person `Tail`.
% Tail refers to the rest of the person list
taller_than([_ | Tail], SpecHeight, AgeRange, Result) :-
    taller_than(Tail, SpecHeight, AgeRange, Result).

%  Task C
%Auxiliary function for checking if X is divisible by Y
divisible(X,Y):-
    N is Y*Y,
    N =< X,
    X mod Y =:= 0.
    
divisible(X,Y):-
    Y < X,
    Y1 is Y+1,
    divisible(X,Y1).

%Auxiliary function for checking if a number is prime
is_prime(X):-
    Y is 2, % smallest prime
    X > 1, % anything below 1 is not a prime
    \+divisible(X,Y).% checks if X is not divisible by Y

% Helper predicate to reverse digits of a number
reverse_digits(N, Reversed) :-
    number_chars(N, Digits), %converts N into a list of digits
    reverse(Digits, ReversedDigits),%reverse the list of digits
    number_chars(Reversed, ReversedDigits).%combine digits back into a number

% Main predicate with tail-recursive accumulator and cut operator
filter_and_transform(List, Result) :-
    filter_and_transform(List, [], Result, 0).

filter_and_transform(_, Acc, Result, Count) :-
    Count >= 5, !,  % Cut operator to stop after 5 results
    reverse(Acc, Result).  % Reverse the accumulator for the final output

filter_and_transform([H|T], Acc, Result, Count) :-
    is_prime(H),  % Check if the number is prime
    reverse_digits(H, Transformed), %reverse digits if so
    NewCount is Count + 1, %Track the number of transformed primes
    filter_and_transform(T, [Transformed|Acc], Result, NewCount),!.  % Add to accumulator, and cut to prevent backtracking

%recursive case for non-primes
filter_and_transform([_|T], Acc, Result, Count) :-
    filter_and_transform(T, Acc, Result, Count).  % Skip non-prime numbers

%Based case when the input list is empty
filter_and_transform([], Acc, Result, _) :-
    reverse(Acc, Result).  % Base case to reverse and return final result if fewer than 5 primes

