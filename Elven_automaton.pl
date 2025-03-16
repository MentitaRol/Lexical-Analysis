%Author: Luisa Fernanda Valdez Guillén - A01711870
%Date: March 13, 2025
%Project: Lexical Analysis of Elven Language

%Transitions of the automaton
transition(q0,q1,a).
transition(q1,q2,m).
transition(q1,q4,n).
transition(q2,q3,i).
transition(q3,q4,l).
transition(q4,q5,c).
transition(q4,q6,d).
transition(q4,q7,a).
transition(q5,q4,a).
transition(q7,q8,r).
transition(q8,q5,y).

%Final or accepting states
final_state(q4).
final_state(q6).

% Start the automaton by processing the word from the initial state
start_automaton(Word):-
    process_word(Word,q0).

%Base case:
% If we have gone through the entire list
% check if we are in a final state.
process_word([],CurrentState):-
    final_state(CurrentState).

%Recursive case:
% If there are still elements in the word, check for valid transitions.
process_word([Letter|RestOfWord],CurrentState):-
    % Ensure a valid transition exists
    transition(CurrentState,NextState,Letter),
    % Call the recursive case
    process_word(RestOfWord,NextState).







