% very_simple_matcher.pl - The simplest possible word matcher

% Main predicate - just checks if specific words are in the tokens list
analyze_with_confidence(Tokens, Results, Confidence) :-
    % Process each word we're looking for
    check_word('ธนาคาร', Tokens, Bank),
    check_word('เงิน', Tokens, Money),
    check_word('บัญชี', Tokens, Account),
    check_word('ด่วน', Tokens, Urgent),
    
    % Collect results
    collect_results(Bank, Money, Account, Urgent, Results),
    
    % Count non-empty results for confidence
    count_matches([Bank, Money, Account, Urgent], Confidence),
    
    % Print consistent output format
    write('RESULT_START'), nl,
    write('Results='), write(Results), nl,
    write('Confidence='), write(Confidence), nl,
    write('RESULT_END'), nl.

% Check if a specific word is in the tokens list
check_word(Word, Tokens, Result) :-
    (member(Word, Tokens) -> 
        Result = scam(Word, Word)
    ;
        Result = ''
    ).

% Collect non-empty results
collect_results('', '', '', '', []).
collect_results(Bank, '', '', '', [Bank]) :- Bank \= '', !.
collect_results('', Money, '', '', [Money]) :- Money \= '', !.
collect_results('', '', Account, '', [Account]) :- Account \= '', !.
collect_results('', '', '', Urgent, [Urgent]) :- Urgent \= '', !.
collect_results(Bank, Money, '', '', [Bank, Money]) :- Bank \= '', Money \= '', !.
collect_results(Bank, '', Account, '', [Bank, Account]) :- Bank \= '', Account \= '', !.
collect_results(Bank, '', '', Urgent, [Bank, Urgent]) :- Bank \= '', Urgent \= '', !.
collect_results('', Money, Account, '', [Money, Account]) :- Money \= '', Account \= '', !.
collect_results('', Money, '', Urgent, [Money, Urgent]) :- Money \= '', Urgent \= '', !.
collect_results('', '', Account, Urgent, [Account, Urgent]) :- Account \= '', Urgent \= '', !.
collect_results(Bank, Money, Account, '', [Bank, Money, Account]) :- Bank \= '', Money \= '', Account \= '', !.
collect_results(Bank, Money, '', Urgent, [Bank, Money, Urgent]) :- Bank \= '', Money \= '', Urgent \= '', !.
collect_results(Bank, '', Account, Urgent, [Bank, Account, Urgent]) :- Bank \= '', Account \= '', Urgent \= '', !.
collect_results('', Money, Account, Urgent, [Money, Account, Urgent]) :- Money \= '', Account \= '', Urgent \= '', !.
collect_results(Bank, Money, Account, Urgent, [Bank, Money, Account, Urgent]) :- Bank \= '', Money \= '', Account \= '', Urgent \= '', !.

% Count non-empty matches
count_matches([], 0).
count_matches([''], Count) :- count_matches([], Count).
count_matches([X|Xs], Count) :-
    X \= '',
    count_matches(Xs, RestCount),
    Count is RestCount + 1.
count_matches([''|Xs], Count) :-
    count_matches(Xs, Count).