import re

pattern = r'^A((n(d|ca|arya)?)|mil)'

#Valid words
valid = ["An","And","Anca","Anarya","Amil"]

#Invalid words
invalid = ["A","Am","Ana","Anda","Ancanca","Amile","Ban","Amal","Ami","Ancarya"]

#Test valid words
for word in valid:
    if re.fullmatch(pattern, word):
        print(f"'{word} is a valid word")
    else:
        print(f"'{word} is not a valid word")

#Test invalid words
for word in invalid:
    if re.fullmatch(pattern, word):
        print(f"'{word} is a valid word")
    else:
        print(f"'{word} is not a valid word")

while True:
    userInput = input("\nTo exit the program write ‘exit’: ")
    if userInput.lower() == "exit":
        break
    if re.fullmatch(pattern, userInput):
        print(f"'{userInput} is a valid word")
    else:
        print(f"'{userInput} is not a valid word")
