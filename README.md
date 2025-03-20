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
Acording to Geek for geeks (2024):

Finite automata are abstract machines used to recognize patterns in input sequences. 
They consist of states, transitions, and input symbols, processing each symbol step-by-step. 
If the machine ends in an accepting state after processing the input, the word is recognized as valid; otherwise, it is rejected. (GeeksforGeeks, 2024) 

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
A regular expression is a sequence of characters that defines a certain pattern. Regular expressions are normally used to search text for a group of words that matches the pattern. (Mathworks, n.d).

The language accepted by a finite automaton (it can be DFA or NFA) can be easily described by a Regular expression. (TPoint Tech, n. d.).

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

## Implementation
Once we have established and created the models that we are going to be using to test our lexical analysis, we can move on to making the corresponding implementations for our automaton and our regular expression.

### Deterministic Finite Automaton (DFA)
For this implementation, I based my approach on version 2 of the automaton presented in the previous section.

We will be implementing our automaton using Prolog, and the implementation file is named ‘Elven_automaton.pl’

The first step is to model the transitions between states and the values that lead us to each of them.
To achive this, we define the structure of our automaton in our Prolog knowledge base as follows:
   
    transition (currentState, letter, nextState)

Each ‘transition’ fact represents a valid transition from CurrentState to NextState when we have a valid letter of our language.

To define the accepting states, we use the rule ‘final_state’ where we specify which states that are final states:

    final_state(q4).
    final_state(q6).

Once we have established our transitions and our final states, we can define the condition that will allow us to traverse the automaton through states recursively until we reach an accepted final state. We define the starting point of the automaton as follows:

    start_automaton(Word):-
        process_word(Word,q0).

In this rule, q0 represents the initial state.

Our base case which we reached when we have completely traversed the assigned word, and we verified whether the current state is an accepted final state
 
    process_word([],CurrentState):-
        final_state(CurrentState).

And our recursive case which allows us to analyze each letter of the word and the state it leads to:

    process_word([Letter|RestOfWord], CurrentState):-
        transition (CurrentState,NextState,Letter),
        process_word(RestOfWord,NextState).

Here, for each letter in the word, we apply the ‘transition’ fact to move from the current state to the next state and continue the process for the rest of the word.

### Regular expression:
To fully explore the implementation of both models, the regular expression was also implemented.

Our regular expression implementation will be done using Python, and our file name is ‘elven_regex.py’

To implement regular expressions in Python, we first import the 're' library, which allows us to work with regular expressions:

    import re

Next, we define our regular expression as a variable called 'pattern':

    pattern = r'^A((n(d|ca|arya)?)|mil)'

We also define two sets of words: one set with valid words and another with invalid words, used for testing purposes:

    valid = ["An","And","Anca","Anarya","Amil"]
    invalid = ["A","Am","Ana","Anda","Ancanca","Amile","Ban","Amal","Ami","Ancarya"]

To test our regular expression against our word sets, we run two for loops: one to check valid words and another to check invalid words. We use the 'fullmatch' function from the 're' library to verify that the entire word matches the regular expression:

    for word in valid:
        if re.fullmatch(pattern, word):
            print(f"'{word} is a valid word")
        else:
            print(f"'{word} is not a valid word")

    for word in invalid:
        if re.fullmatch(pattern, word):
            print(f"'{word} is a valid word")
        else:
            print(f"'{word} is not a valid word")

Finally, just implement a while loop with an input so the user can test their own words

    while True:
        userInput = input("\nTo exit the program write ‘exit’: ")
        if userInput.lower() == "exit":
            break
        if re.fullmatch(pattern, userInput):
            print(f"'{userInput} is a valid word")
        else:
            print(f"'{userInput} is not a valid word")

## Test

### Deterministic Finite Automaton (DFA)
In our test_automaton.pl file, we define several test cases to validate the correct functioning of our DFA. These include successful test cases, which represent valid words of our language, and failed test cases, which should be rejected by the automaton.

#### Successful test cases:
The following test cases contain words that are correctly recognized by our DFA. These are the only words that should return ‘Successful’ when processed:

This are our accepting test cases:

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

#### Failed test cases:
To verify that our DFA works correctly, we define test cases that include words similar to the valid words but that should be rejected. These tests ensure that the automaton only accepts the defined language.

This are our failed test cases:

    test0:-
        start_automaton([]).

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
        start_automaton([a,m,a,l]).

    test15:-
        start_automaton([a,n,c,a,r,y,a]).

To execute our automaton tests, follow these steps in the Prolog terminal:

**Load the test file:**

    [“test_automaton”].

**Execute the run function:**

    run_tests.

![Image](https://github.com/user-attachments/assets/e73f5be7-86b3-491a-96d1-1501ba7b9e84)

### Regular expression
In our file elven_regex.py, we define two lists of words:
- **Valid words:** A set of words that should be correctly matched by our regular expression.
- **Invalid words:** A set of words that should not be accepted, ensuring that our pattern correctly distinguishes between valid and invalid inputs.

To execute the regular expression test, use the following command in the terminal:
   
    python elven_regex.py

This will print whether each word is valid or invalid based on the defined pattern and will allow the user to enter different words to check.

![Image](https://github.com/user-attachments/assets/f137798a-8eba-44a9-9f73-d992a341321b)

## References
GeeksforGeeks. (2024, september 12). Introduction of Finite Automata. GeeksforGeeks. https://www.geeksforgeeks.org/introduction-of-finite-automata/

GeeksforGeeks. (2024, january 29). Designing Deterministic Finite Automata (SET 11). GeeksforGeeks. https://www.geeksforgeeks.org/designing-deterministic-finite-automata-set-11/

Mathworks. (n. d.).  Regular expressions. https://www.mathworks.com/help/matlab/matlab_prog/regular-expressions.html 

Tim Randolph. (2022, 22 may). Example 1: Designing and Building a DFA [Vídeo]. YouTube. https://www.youtube.com/watch?v=mWqUR-N7Iqk

TPoint Tech. (n. d.). Regular expression. www.tpointtech.com. https://www.tpointtech.com/automata-regular-expression
