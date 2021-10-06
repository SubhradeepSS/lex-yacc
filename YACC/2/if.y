%{
	#include<stdio.h>
    int yylex(void);
    void yyerror(const char *str);
%}

%token NUMBER ID IF ELSE AND OR NOT LT GT LE GE EQ NE ADD SUB EQU MUL DIV SC OB CB OP CP INCR DECR
%nonassoc IFX
%nonassoc ELSE


%%

statement: 
  IF OP cond CP statement %prec IFX |
  IF OP cond CP statement ELSE statement |
  body ;
body:	OB stmts CB ;
stmts:	stmt SC stmts |
	stmt SC |
	statement ;
cond:	c AND cond |
	c OR cond |
	c ;
c:	f relop f |
	NOT f relop f ;
stmt:	ID EQU expr;
expr:	expr ADD term |
	expr SUB term |
	term;
term:	term MUL f |
	term DIV f |
	f;
f:	ID | 
	NUMBER;
relop:	LT | GT | LE | GE | EQ | NE;
		  	

%%


#include "lex.yy.c"

void yyerror(const char *str) {
	printf("Error in if else statement for given input\n");
}

int main(int argc, char *argv[]) {
    yyin = fopen(argv[1], "r");
    if (yyparse() == 0) 
      printf("No error in if else statement for given input\n");
    fclose(yyin);
}