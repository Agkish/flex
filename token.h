#define TOK_ADD 1
#define TOK_SUB 2
#define TOK_MULT 3
#define TOK_DIV 4
#define TOK_LOAD 5
#define TOK_STORE 6
#define TOK_TRANS 7
#define TOK_LOOP 8
#define TOK_PRINT 9
#define TOK_READ 10
#define TOK_TRIM 11
#define TOK_LIR 12
#define TOK_IIR 13
#define TOK_START 14
#define TOK_STOP 15
#define TOK_DS 16
#define TOK_DC 17
#define TOK_END 18
#define TOK_ID 19
#define TOK_NUM 20
#define TOK_COMMA 21
#define TOK_CONST 22
typedef struct{
	char *mnemonic;
	int token;
}MnemonicTable;

extern MnemonicTable mnemonic_entry[];




