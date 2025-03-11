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
>If the machine ends in an accepting state after processing the input, the word is recognized as valid; otherwise, it is rejected. (GeeksforGeeks, 2024) 

Finite automata can be classified as:
- Deterministic Finite Automata (DFA) – A structured model where each state has a unique transition for every input symbol. (GeeksforGeeks, 2024)
- Non-Deterministic Finite Automata (NFA) – A more flexible model where multiple transitions for the same input symbol can exist. (GeeksforGeeks, 2024)

### Choice of DFA
For this specific problem I decided to use a Deterministic Finite Automata (DFA) to represent my solution, some of the reasons why I chose this are:
-	Since the words don’t require multiple possibilities or choices at each state, a DFA is more suited since each input symbol leads to one specific state.
-	An NFA would allow multiple possible transitions for a single input, which is not necessary in this case.
-	DFA is more efficient in terms of time complexity because it guarantees a single path through the states, without needing to explore multiple possible transitions.
-	Since my set of words is relatively small, a DFA will result in a small state machine that’s easy to implement.
-	If I make an NFA at the end I will need to translate it to a DFA to program it.

## Models
To represent and analyze our set of words, we will implement the two computational models mentioned before: Deterministic Finite Automata (DFA) and Regular expressions.

### Derministic Finite Automata (DFA)
Given our selected set of words:
**Amil, An, Anarya, Anca, And.**

We can define the alphabet as:
**Σ={A, a, d, c, i, l, m, n, r, y}**

By closely analyzing our set of words, we observe that our initial state will always be **‘A’**.

In the same way we can determine that our final states will correspond to the last letters of each word: **‘l’, ‘n’, ‘a’, and ‘d’.**

With this information we can build our Deterministic Finite Automata:

**VERSION 1**

This is the initial design of my DFA, constructed by following the natural flow of the given set of words without applying reductions or optimizations. Each valid word is recognized while maintaining a deterministic structure.

![Image](https://github.com/user-attachments/assets/c7865433-162e-4d1c-8817-8a64521b3a74)

**VERSION 2**

In this second version of my DFA. I minimize the number of states and eliminate redundancies, resulting in a more efficient automa that requires fewer steps to determine whether a word is valid.

Although a formal state minimization methods exist, they were not applied in this case. Therefore, while this version is an improvement over the initial design, ther's still the possibility of a better optimization.

![Image](https://github.com/user-attachments/assets/5236cbf0-00a9-4920-b98a-cb572aa33b12)

### Regular expressions



## References
GeeksforGeeks. (2024, september 12). Introduction of Finite Automata. GeeksforGeeks. https://www.geeksforgeeks.org/introduction-of-finite-automata/

GeeksforGeeks. (2024, enero 29). Designing Deterministic Finite Automata (SET 11). GeeksforGeeks. https://www.geeksforgeeks.org/designing-deterministic-finite-automata-set-11/

Tim Randolph. (2022, 22 mayo). Example 1: Designing and Building a DFA [Vídeo]. YouTube. https://www.youtube.com/watch?v=mWqUR-N7Iqk
