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

% Question 3

%  Task B

%  Task C