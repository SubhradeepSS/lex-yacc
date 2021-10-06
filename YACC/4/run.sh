lex repeat-until.l
yacc repeat-until.y
g++ y.tab.c -lfl

echo ;

echo "Output for valid input:"
./a.out < correct_input.txt

echo ;

echo "Output for invalid input:"
./a.out < incorrect_input.txt

echo ;