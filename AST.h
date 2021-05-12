//
// Created by xim on 5/11/21.
//

#ifndef VERELATION_AST_H
#define VERELATION_AST_H
#include "common.h"
#include "token.h"

enum ASTTYPE {VERILOG_MODULE, VERILOG_WIRE, VERILOG_REG};

struct ASTNode {
    struct ASTNode *left, *right;
    enum ASTTYPE type;
    char name[STRING_LEN];
    union data{
        int int_val;
    };
};

enum SIGTYPE {SIG_INPUT, SIG_OUTPUT, SIG_INTERNAL};
struct SignalList {
    struct SignalList *next;
    struct SignalNode *node;
};

struct SignalNode {
    enum SIGTYPE type;
    char name[STRING_LEN];
    struct SignalList associate_list;
};

struct ModuleNode {
    /*
     * A Module should have its input and output signal identified
     * */
    char name[STRING_LEN];
    struct SignalList sig_list; // contains all known signals
};

struct ModuleList {
    struct ModuleList *next;
    struct ModuleNode *module;
};

void genTotalAST();
void print_module(struct ModuleNode *module);

struct StringNode {
    char *name;
    struct StringNode *next;
};
#endif //VERELATION_AST_H
