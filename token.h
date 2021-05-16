//
// Created by xim on 5/11/21.
//

#ifndef VERELATION_TOKEN_H
#define VERELATION_TOKEN_H
#include "common.h"

/*
 * TokenTypes:
 *     TYPE_DECL: reg wire
 *     MODULE: module
 *     ENDMODULE: endmodule
 *     BRACKET: ( ) { }
 *     BEGIN: begin
 *     END: end
 *     ELSE: else
 *     COMMA: ,
 *     ASSIGN: assign
 *     SEMICOLON: ;
 *     NUMBER: a'hb [aa:bb]
 *     ASSOCIATE: =
 *     OPERATOR: + - ~ ! & | ^ ? : == >= <= << >> $signed >>> <<< * < >
 *     DIRECTION: input output
 *     IF: if
 *     ALWAYS: always
 *     AT: @
 *     POSEDGE: posedge
 *     NAME: other than above tokens
 *     Note that <= can also be associative, in always context
 *     Some operator like : is treated as operator seperated by spaces and a part of numbers otherwise, for simplicity
 * */

enum TokenType {TYPE_DECL, NAME, MODULE, ENDMODULE, OPERATOR, BRACKET, COMMA, SEMICOLON, ASSOCIATE, NUMBER, DIRECTION, IF, ASSIGN, ALWAYS, AT, POSEDGE, BEGIN, END, ELSE, DOT};

struct TokenNode{
    char name[STRING_LEN];
    int linenum;
    enum TokenType type;
    struct TokenNode *next;
};

void tokenize();
void print_token_info();
void process_token_type();

extern struct TokenNode token_head;
#endif //VERELATION_TOKEN_H
