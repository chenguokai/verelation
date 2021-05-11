//
// Created by xim on 5/11/21.
//

#ifndef VERELATION_AST_H
#define VERELATION_AST_H
#include "common.h"

enum ASTTYPE {VERILOG_MODULE, VERILOG_WIRE, VERILOG_REG};

struct ASTNode {
    struct ASTNode *left, *right;
    enum ASTTYPE type;
    char name[STRING_LEN];
    union data{
        int int_val;
    };
};

#endif //VERELATION_AST_H
