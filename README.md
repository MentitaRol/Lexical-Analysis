# Implementation of Lexical Analysis (Automaton and Regular Expression)

## Description
In this first evidence, the principles of lexical analysis will be applied to the Elven language created by J.R.R. Tolkien. 
By defining a set of valid words and determining whether a given word conforms to the language´s rules, 
demonstrating the practical application of computational methods.

The selected set of words from the Elven language are:

- Amil - word for 'Mother'
- An - 'long'.
- Anarya - Quenya meaning 'Sun's-day', the second day of the Elvish week.
- Anca - Quenya word for 'Jaws'.
- And - 'long'.

To achieve this, we will be using two computational methods: Finite Automata and Regular expressions

### Finite Automata
Acording to Geek for geeks (2024)
> Finite automata are abstract machines used to recognize patterns in input sequences. 
>They consist of states, transitions, and input symbols, processing each symbol step-by-step. 
>If the machine ends in an accepting state after processing the input, the word is recognized as valid; otherwise, it is rejected. 

Finite automata can be classified as:
- Deterministic Finite Automata (DFA) – A structured model where each state has a unique transition for every input symbol. (GeeksforGeeks, 2024)
- Non-Deterministic Finite Automata (NFA) – A more flexible model where multiple transitions for the same input symbol can exist. (GeeksforGeeks, 2024)

## References
GeeksforGeeks. (2024, september 12). Introduction of Finite Automata. GeeksforGeeks. https://www.geeksforgeeks.org/introduction-of-finite-automata/