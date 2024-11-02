%  Task A

% Question 1 (Jordan had already implemented this in another course)
factorial(N, R) :-
    N>0,
    N1 is N-1,
    factorial(N1, R1),
    write(R1), write(' '),
    /*go down to R1=1, then go back up again multiplying each R by N*/ R is R1*N.

factorial(0,1).

% Question 2

% Question 3

%  Task B

%  Task C