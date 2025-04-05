% Simple calculator operations in Prolog

% Addition
add(A, B, Result) :- 
    Result is A + B.

% Subtraction
subtract(A, B, Result) :- 
    Result is A - B.

% Multiplication
multiply(A, B, Result) :- 
    Result is A * B.

% Division
divide(A, B, Result) :- 
    B =\= 0,  % Avoid division by zero
    Result is A / B.

% Calculate all basic operations
calculate(A, B, Sum, Difference, Product, Quotient) :-
    add(A, B, Sum),
    subtract(A, B, Difference),
    multiply(A, B, Product),
    divide(A, B, Quotient).