//
// Created by xim on 5/11/21.
//

#include "token.h"
#include <stdlib.h>
#include "common.h"
static int current_linenum = 1; // line number usually start with 1
static struct TokenNode token_head;
static struct TokenNode *next_token, *token_tail;
static int source_buffer_offset = 0;


static void token_put_back() {
    --source_buffer_offset;
}
static int get_next_token() {
    int ret = 1;
    // use source buffer
    next_token = (struct TokenNode *)malloc(sizeof (struct TokenNode));
    next_token->next = NULL;
    int token_len = 0;

    // if we have got a complete token here
    int token_got = 0;
    // if we need to increase line number
    int line_inc = 0;
    while (1) {
        switch (source_buffer[source_buffer_offset]) {
            case '{':
            case '}':
            case ',':
                if (token_len != 0) {
                    // already have a token parsed
                    token_put_back(); // put_back
                    token_got = 1;
                } else {
                    // this is what we want to parse
                    next_token->name[0] = source_buffer[source_buffer_offset++];
                    next_token->name[1] = 0;
                    next_token->linenum = current_linenum;
                    return 1;
                }
                // will always generate a token

                break;
            case '\n':
                line_inc = 1;
                token_got = 1;
                break;
            case ' ':
                token_got = 1;
                break;
            case 0:
                ret = 0;
                // fall through
                token_got = 1;
                break;
        }
        if (token_got) {
            if (token_len == 0) {
                // may caused by space or bare '\n'
                free(next_token);
                next_token = NULL;
            } else {
                next_token->name[token_len] = 0; // string end with 0
                next_token->linenum = current_linenum;
            }
            ++source_buffer_offset;
            if (line_inc)  {
                ++current_linenum;
                line_inc = 0;
            }

            break;
        } else {
            next_token->name[token_len++] = source_buffer[source_buffer_offset++];
        }

    }
    return ret;
}

void tokenize() {
    token_tail = &token_head;
    token_head.next = NULL;
    while (get_next_token()) {
        if (next_token != NULL) {
            token_tail->next = next_token;
            token_tail = token_tail->next;
        }
    }
}

void print_token_info() {
    // print the line number and the tokens
    struct TokenNode *list_head = token_head.next;
    while (list_head->next != NULL) {
        printf("name: %s, line %d\n", list_head->name, list_head->linenum);
        list_head = list_head->next;
    }
}
