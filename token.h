//
// Created by xim on 5/11/21.
//

#ifndef VERELATION_TOKEN_H
#define VERELATION_TOKEN_H
#include "common.h"

struct TokenNode{
    char name[STRING_LEN];
    int linenum;
    struct TokenNode *next;
};

void tokenize();
void print_token_info();

#endif //VERELATION_TOKEN_H
