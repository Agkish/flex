%option noyywrap

%{
#include<stdio.h>
#include "token.h"
#include<stdlib.h>
FILE *ofp;
int line_num=0;
%}
ID	[a-zA-Z_][a-zA-Z0-9_]*
DIGIT 	[0-9]
CONST 	['][0-9]+[']
%%
"ADD"	return TOK_ADD;
"SUB"	return TOK_SUB;
"MULT" 	return TOK_MULT;
"DIV" 	return TOK_DIV;
"LOAD" 	return TOK_LOAD;
"STORE" 	return TOK_STORE;
"TRANS"	return TOK_TRANS;
"LOOP" 	return TOK_LOOP;
"PRINT"	return TOK_PRINT;
"READ" 	return TOK_READ;
"TRIM"	return TOK_TRIM;
"LIR"	return TOK_LIR;
"IIR" 	return TOK_IIR;
"START"	return TOK_START;
"STOP"	return TOK_STOP;
"DS"	return TOK_DS;
"DC" 	return TOK_DC;
"END"	return TOK_END;
{ID}	return TOK_ID;
{DIGIT}+	return TOK_NUM;
","	return TOK_COMMA;
{CONST}	return TOK_CONST;
"\n"	line_num++;
[ \t]+  
%%
int main()
{
	yyin = fopen("inp_ass1.txt","r");
	if(!yyin)
	{
		perror("Input:fopen");
		exit(1);
	}
	ofp = fopen("out_ass2.txt","w");
	if(!ofp)
	{
		perror("Output:fopen");
		exit(1);
	}
	int tok;
	while((tok = yylex())!=0)
	{
		if(tok == TOK_ID|| tok==TOK_CONST)
			fprintf(ofp,"%d(%s) ",tok,yytext);
		else if(tok == TOK_NUM)
			fprintf(ofp,"%d(%d) ",tok, atoi(yytext));
		else 
			fprintf(ofp,"%d ",tok);
	}
	fprintf(ofp,"\nTotal number of lines in the assembly program = %d",line_num);
	fclose(ofp);
	fclose(yyin);
	return 0;
}
		

