//
// Created by xim on 5/13/21.
//

#include "shell.h"
#include "common.h"
#include <string.h>

static char user_input[STRING_LEN];
static char module_name[STRING_LEN];
static char signal_name[STRING_LEN];
static struct ModuleList *module_list_ptr;
static struct ModuleNode *module_node;
static struct SignalList *signal_list_ptr;
static struct SignalNode *signal_node;

#define MAXSEARCHDEPTH 100

struct SignalInfo {
    char *module;
    char *signal;
} search_stack[MAXSEARCHDEPTH];

static void search_module_signal(char *module, char *signal, int depth, int display_depth) {
    // if we have reached the search limit
    if (depth > feature_search_depth) {
        return ;
    }
    for (int i = 1; i < depth; i++) {
        if (strcmp(search_stack[i].module, module) == 0 && strcmp(search_stack[i].signal, signal) == 0) {
            return ; // in a loop
        }
    }
    struct ModuleList *module_list_ptr;
    struct ModuleNode *module_node;
    struct SignalList *signal_list_ptr;
    struct SignalNode *signal_node;
    module_list_ptr = module_list.next;
    while (module_list_ptr != NULL) {
        if (strncmp(module_list_ptr->module->name, module_name, STRING_LEN) == 0) {
            module_node = module_list_ptr->module;
            break;
        }
        module_list_ptr = module_list_ptr->next;
    }
    if (module_list_ptr != NULL) {
        signal_list_ptr = module_node->sig_list.next;
        while (signal_list_ptr != NULL) {
            if (strncmp(signal_list_ptr->node->name, signal_name, STRING_LEN) == 0) {
                signal_node = signal_list_ptr->node;
                break;
            }
            signal_list_ptr = signal_list_ptr->next;
        }
        if (signal_list_ptr != NULL) {
            struct SignalList *list = signal_node->associate_list.next;
            while (list != NULL) {
                if (list->node->name[0] == '_' && feature_search_ignore_chisel) {
                    search_stack[depth].module = module;
                    search_stack[depth].signal = signal;
                    search_module_signal(list->node->module->name, list->node->name, depth + 1, display_depth);
                } else {
                    for (int i = 0; i < display_depth; i++) {
                        printf("  "); // indent
                    }
                    printf("depend on %s in module %s\n", list->node->name, list->node->module->name);
                    search_stack[depth].module = module;
                    search_stack[depth].signal = signal;
                    search_module_signal(list->node->module->name, list->node->name, depth + 1, display_depth + 1);
                }
                list = list->next;
            }
        } else {
            printf("Error: Cannot find signal %s in module %s\n", signal_name, module_name);
        }
    } else {
        printf("Error: Cannot find module %s\n", module_name);
    }
}

void user_shell() {
    // the user interface
    while (1) {
        printf("verelation>>");
        scanf("%s", user_input);
        if (strncmp(user_input, "exit", 5) == 0) {
            break;
        } else if (strncmp(user_input, "lookup", 7) == 0) {
            // lookup the signal name in module
            scanf("%s%s", module_name, signal_name);
            search_module_signal(module_name, signal_name, 1, 1);
        }
    }
}