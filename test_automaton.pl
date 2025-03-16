%Author: Luisa Fernanda Valdez Guill�n - A01711870
%Date: March 13, 2025
%Project: Lexical Analysis of Elven Language

%Load the main code file

:-["elven_automaton"].

%Test cases:

%Empty list
test0:-
    start_automaton([]).

%Accepting test cases
test1:-
    start_automaton([a,n]).

test2:-
    start_automaton([a,n,d]).

test3:-
    start_automaton([a,n,c,a]).

test4:-
    start_automaton([a,n,a,r,y,a]).

test5:-
    start_automaton([a,m,i,l]).

%Incorrect test cases

test6:-
    start_automaton([a]).

test7:-
    start_automaton([a,m]).

test8:-
    start_automaton([a,n,a]).

test9:-
    start_automaton([a,n,d,a]).

test10:-
    start_automaton([a,n,c,a,n,c,a]).

test11:-
    start_automaton([a,m,i,l,e]).

test12:-
    start_automaton([b,a,n]).

test13:-
    start_automaton([a,m,a,l]).

test14:-
    start_automaton([a,m,i]).

test15:-
    start_automaton([a,n,c,a,r,y,a]).

%Run test
run_tests :-
    write('Test 0: '), (test0 -> write('Success') ; write('Failed')), nl,
    write('Test 1: '), (test1 -> write('Success') ; write('Failed')), nl,
    write('Test 2: '), (test2 -> write('Success') ; write('Failed')), nl,
    write('Test 3: '), (test3 -> write('Success') ; write('Failed')), nl,
    write('Test 4: '), (test4 -> write('Success') ; write('Failed')), nl,
    write('Test 5: '), (test5 -> write('Success') ; write('Failed')), nl,
    write('Test 6: '), (test6 -> write('Success') ; write('Failed')), nl,
    write('Test 7: '), (test7 -> write('Success') ; write('Failed')), nl,
    write('Test 8: '), (test8 -> write('Success') ; write('Failed')), nl,
    write('Test 9: '), (test9 -> write('Success') ; write('Failed')), nl,
    write('Test 10: '), (test10 -> write('Success') ; write('Failed')), nl,
    write('Test 11: '), (test11 -> write('Success') ; write('Failed')), nl,
    write('Test 12: '), (test12 -> write('Success') ; write('Failed')), nl,
    write('Test 13: '), (test13 -> write('Success') ; write('Failed')), nl,
    write('Test 14: '), (test14 -> write('Success') ; write('Failed')), nl,
    write('Test 15: '), (test15 -> write('Success') ; write('Failed')), nl.
