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

To achieve this, we will be using two computational methods: Finite Automaton and Regular expressions

### Finite Automaton
Acording to Geek for geeks (2024)
> Finite automata are abstract machines used to recognize patterns in input sequences. 
>They consist of states, transitions, and input symbols, processing each symbol step-by-step. 
>If the machine ends in an accepting state after processing the input, the word is recognized as valid; otherwise, it is rejected. (GeeksforGeeks, 2024) 

Finite automaton can be classified as:
- Deterministic Finite Automaton (DFA) – A structured model where each state has a unique transition for every input symbol. (GeeksforGeeks, 2024)
- Non-Deterministic Finite Automaton (NFA) – A more flexible model where multiple transitions for the same input symbol can exist. (GeeksforGeeks, 2024)

### Choice of DFA
For this specific problem I decided to use a Deterministic Finite Automaton (DFA) to represent my solution, some of the reasons why I chose this are:
-	Since the words don’t require multiple possibilities or choices at each state, a DFA is more suited since each input symbol leads to one specific state.
-	An NFA would allow multiple possible transitions for a single input, which is not necessary in this case.
-	DFA is more efficient in terms of time complexity because it guarantees a single path through the states, without needing to explore multiple possible transitions.
-	Since my set of words is relatively small, a DFA will result in a small state machine that’s easy to implement.
-	If I make an NFA at the end I will need to translate it to a DFA to program it.

## Models
To represent and analyze our set of words, we will implement the two computational models mentioned before: Deterministic Finite Automaton (DFA) and Regular expressions.

### Derministic Finite Automaton (DFA)
Given our selected set of words:
**Amil, An, Anarya, Anca, And.**

We can define the alphabet as:
**Σ={A, a, d, c, i, l, m, n, r, y}**

By closely analyzing our set of words, we observe that our initial state will always be **‘A’**.

In the same way we can determine that our final states will correspond to the last letters of each word: **‘l’, ‘n’, ‘a’, and ‘d’.**

With this information we can build our Deterministic Finite Automaton:

**VERSION 1**

This is the initial design of my DFA, constructed by following the natural flow of the given set of words without applying reductions or optimizations. Each valid word is recognized while maintaining a deterministic structure.

![Image](https://github.com/user-attachments/assets/c7865433-162e-4d1c-8817-8a64521b3a74)

**VERSION 2**

In this second version of my DFA. I minimize the number of states and eliminate redundancies, resulting in a more efficient automa that requires fewer steps to determine whether a word is valid.

Although a formal state minimization methods exist, they were not applied in this case. Therefore, while this version is an improvement over the initial design, ther's still the possibility of a better optimization.

![Image](https://github.com/user-attachments/assets/5236cbf0-00a9-4920-b98a-cb572aa33b12)

### Regular expressions
>A regular expression is a sequence of characters that defines a certain pattern. Regular expressions are normally used to search text for a group of words >that matches the pattern. (Mathworks, n.d).

>The language accepted by a finite automaton (it can be DFA or NFA) can be easily described by a Regular expression. (TPoint Tech, n. d.).

Steps to construct the regular expression for the language accepted by our automaton by analyzing some patterns that our language follow:

**1.  Every word starts with the capital letter ‘A’**

In regular expressions, the symbol ^ means “start of the string”.

To ensure that every valid word starts with 'A', we begin our regular expression with:

    ^A

**2. Words start with 'A' followed by 'n' and other characters (d, ca, arya) or just the letter ‘n’**

In regular expressions:

( ) : Parentheses are used to group characters

| : Bar symbol is used as an ‘or’ operator, meaning one of several options can match.

? : The question mark means that the preceding part is optional

We want the word to start with ‘n’ and then be followed (or not) by a group of characters ‘d’, ‘ca’, or ‘arya’, we can express this like:

n(d|ca|arya)?

The ‘?’ makes the group (d|ca|arya) optional.  

So now, the regular expression becomes:

^A(n(d|ca|arya)?)

**3. Words start with 'A' and end with the string 'mil'**

Since it is only the string "mil", we can express this part simply as: 

(mil)

Finally, by putting everything together, we get:

    ^A((n(d|ca|arya)?)|mil)

The parentheses around ‘(n(d|ca|arya)?)|mil’ ensures that the word follows one of the two patterns.




## References
GeeksforGeeks. (2024, september 12). Introduction of Finite Automata. GeeksforGeeks. https://www.geeksforgeeks.org/introduction-of-finite-automata/

GeeksforGeeks. (2024, enero 29). Designing Deterministic Finite Automata (SET 11). GeeksforGeeks. https://www.geeksforgeeks.org/designing-deterministic-finite-automata-set-11/

Mathworks. (n. d.).  Regular expressions. https://www.mathworks.com/help/matlab/matlab_prog/regular-expressions.html 

Tim Randolph. (2022, 22 mayo). Example 1: Designing and Building a DFA [Vídeo]. YouTube. https://www.youtube.com/watch?v=mWqUR-N7Iqk

TPoint Tech. (n. d.). Regular expression. www.tpointtech.com. https://www.tpointtech.com/automata-regular-expression
