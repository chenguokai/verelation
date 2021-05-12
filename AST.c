//
// Created by xim on 5/11/21.
//

#include "AST.h"
#include "common.h"
#include <stdlib.h>
#include <string.h>

/*
 * We will generate AST module by module
 * */

struct TokenNode *token_ptr;
static struct ModuleNode * genASTModule();

void genTotalAST() {
    token_ptr = token_head.next;
    /*
     * We generate the total AST tree here
     * */
    /*
    while (token_ptr != NULL) {
        genASTModule();
    }
    */
    print_module(genASTModule());

}

static void expect(enum TokenType expected) {
    if (token_ptr->type != expected) {
        printf("Error: type mismatch on token %s at line %d\n", token_ptr->name, token_ptr->linenum);
        exit(1);
    }
}

static void consume() {
    token_ptr = token_ptr->next;
}

static struct SignalList *alloc_signal(enum SIGTYPE type) {
    struct SignalNode *ret = (struct SignalNode *)malloc(sizeof (struct SignalNode));
    struct SignalList *list = (struct SignalList *)malloc(sizeof (struct SignalList));

    ret->type = type;
    strncpy(ret->name, token_ptr->name, STRING_LEN);
    ret->associate_list.next = NULL;
    list->node = ret;
    list->next = NULL;

    return list;
}

static struct SignalList * find_old_signal(struct ModuleNode *module, char *name) {
    struct SignalNode *find = NULL; // we should find it inside
    struct SignalList *list = (struct SignalList *)malloc(sizeof (struct SignalList));
    struct SignalList *module_sig_list = module->sig_list.next;
    while (1) {
        if (module_sig_list == NULL) {
            printf("Cannot find defined signal %s\n", name);
            exit(1);
        }
        if (strncmp(module_sig_list->node->name, name, STRING_LEN) == 0) {
            find = module_sig_list->node;
            break;
        }
        module_sig_list = module_sig_list->next;
    }
    list->next = NULL;
    list->node = find;
    return list;
}

static void skip_number() {
    if (token_ptr->type == BRACKET) {
        consume();
        consume();
        consume();
    }
}

static void associate(struct ModuleNode * module, char *name, struct SignalList *associate_list) {
    // associate current signal with a name
    struct SignalList *head = module->sig_list.next;
    while (1) {
        // name is unique in a module
        if (strncmp((head->node->name), name, STRING_LEN) == 0) {
            break;
        }
        head = head->next;
        if (head == NULL) {
            printf("Cannot find symbol %s in module %s\n", name, module->name);
        }
    }
    struct SignalList *list = (struct SignalList *)malloc(sizeof (struct SignalList));
    list->next = associate_list->next;
    list->node = head->node;
    associate_list->next = list;
}

void deal_if(struct ModuleNode *module, struct StringNode *condition_table) {
    int if_condition_count;
    while (1) {
        // exit when we met an end at the beginning
        if (token_ptr->type == END) {
            consume();
            break;
        } else if (token_ptr->type == ENDMODULE) {
            break;
        }
        if (token_ptr->type == NAME) {
            // unconditional
            char *sig_name = token_ptr->name;
            struct SignalList *old_signal = find_old_signal(module, sig_name);
            consume();
            while (1) {
                if (token_ptr->type == SEMICOLON) {
                    consume();
                    break;
                }
                if (token_ptr->type == NAME) {
                    // associate this signal
                    associate(module, token_ptr->name, &(old_signal->node->associate_list));
                }
                consume();
            }
            // add signals from condition_table
            struct StringNode *ptr = condition_table->next;
            while (ptr != NULL) {
                associate(module, ptr->name, &(old_signal->node->associate_list));
                ptr = ptr->next;
            }
            continue;

        } else if (token_ptr->type == IF) {
            consume();
            expect(BRACKET);
            consume();
            // count used to recover
            if_condition_count = 0;
            while (1) {
                if (token_ptr->type == BEGIN) break;

                if (token_ptr->type == NAME) {
                    // allocate a new string node
                    struct StringNode *string_node = (struct StringNode *) malloc(sizeof (struct StringNode));
                    string_node->name = token_ptr->name;
                    string_node->next = condition_table->next;
                    condition_table->next = string_node;
                    ++if_condition_count;
                }
                consume();
            }
            // if ... BEGIN
            expect(BEGIN);
            consume();
            deal_if(module, condition_table);
            if (token_ptr->type == ELSE) {
                // we have an else to deal with
                consume();
                // if it begins with if, no begin needed
                // if it begins with begin, consume it
                if (token_ptr->type == BEGIN) {
                    consume();
                    deal_if(module, condition_table);
                    expect(END);
                    consume();
                } else {
                    deal_if(module, condition_table);
                }
            }
            // recover from added string_node
            struct StringNode *del;
            for (int i = 0; i < if_condition_count; ++i) {
                del = condition_table->next;
                condition_table->next = del->next;
                free(del);
            }
            continue;
        }
    }
}


static struct ModuleNode * genASTModule() {
    /*
     * We generate a per-module AST here
     * */
    struct ModuleNode *module = (struct ModuleNode *)malloc(sizeof (struct ModuleNode));
    module->sig_list.next = NULL;
    // first we expect a module token
    expect(MODULE);
    consume();
    expect(NAME);
    strncpy(module->name, token_ptr->name, STRING_LEN);
    consume();
    expect(BRACKET);
    consume();
    while (1) {
        // we identify tokens here
        expect(DIRECTION);
        struct SignalList *new_signal;
        if (strncmp(token_ptr->name, "input", 6) == 0) {
            consume();
            skip_number();
            expect(NAME);
            new_signal = alloc_signal(SIG_INPUT);
        } else {
            consume();
            skip_number();
            expect(NAME);
            new_signal = alloc_signal(SIG_OUTPUT);
        }
        consume(); // consume token name

        // add new_signal to module info
        new_signal->next = module->sig_list.next;
        module->sig_list.next = new_signal;

        if (token_ptr->type == COMMA) {
            consume();
        } else if (token_ptr->type == BRACKET) {
            consume();
            expect(SEMICOLON);
            consume();
            break;
        }
    }
    // after analysing the module declearation
    // we deal with internal signals

    while (1) {
        if (token_ptr->type == ENDMODULE) {
            break; // if we have reached the end of the module
        }
        if (token_ptr->type == TYPE_DECL) {
            struct SignalList *new_signal;
            // declear types
            consume();
            skip_number();
            if (token_ptr->type == NAME) {
                new_signal = alloc_signal(SIG_INTERNAL);
                // add new_signal to module info
                new_signal->next = module->sig_list.next;
                module->sig_list.next = new_signal;
                consume();
            } else {
                // invalid format
                expect(NAME);
            }
            skip_number();
            // may have an "= VAL"
            if (token_ptr->type == ASSOCIATE) {
                consume();
                while (1) {
                    if (token_ptr->type == SEMICOLON) {
                        consume();
                        break;
                    }
                    if (token_ptr->type == NAME) {
                        // we have found an associative value
                        associate(module, token_ptr->name, &(new_signal->node->associate_list));
                    }
                    consume();
                }
            } else {
                expect(SEMICOLON);
                consume();
            }
        } else if (token_ptr->type == ASSIGN) {
            // assign decleard signals
            consume();
            if (token_ptr->type == NAME) {
                char *sig_name = token_ptr->name;
                struct SignalList *old_signal = find_old_signal(module, sig_name);
                consume();
                expect(ASSOCIATE);
                consume();
                while (1) {
                    // all names following are associative with this signal
                    if (token_ptr->type == SEMICOLON) {
                        consume();
                        break;
                    }
                    if (token_ptr->type == NAME) {
                        associate(module, token_ptr->name, &(old_signal->node->associate_list));
                    }
                    consume();
                }
            } else {
                expect(NAME);
            }
        } else if (token_ptr->type == ALWAYS) {
            // an always @(clk) block
            expect(ALWAYS);
            consume();
            expect(AT);
            consume();
            expect(BRACKET);
            consume();
            expect(POSEDGE);
            consume();
            expect(NAME); // the driving clock
            consume();
            expect(BRACKET);
            consume();
            expect(BEGIN); // begin
            consume();

            // the head of condition table
            struct StringNode condition_table;
            condition_table.next = NULL;
            deal_if(module, &condition_table);
        } else if (token_ptr->type == NAME) {
            // defining a new module instance
            // we should associate all input signal of new module instance with our signal
            // and associate all output signal of new module instance with our signal

        } else {
            printf("Error: cannot understand token %s at line %d\n", token_ptr->name, token_ptr->linenum);
            exit(1);
        }
    }

    return module;
}

void print_module(struct ModuleNode *module) {
    // print the input and output signal infos
    printf("Module %s:\n", module->name);
    struct SignalList *list = module->sig_list.next;
    while (list != NULL) {
        printf("signal %s type %d\n", list->node->name, list->node->type);
        struct SignalList *associate = list->node->associate_list.next;
        while (associate != NULL) {
            printf("  depends on %s\n", associate->node->name);
            associate = associate->next;
        }
        list = list->next;
    }

}