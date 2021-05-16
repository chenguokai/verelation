#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "common.h"
#include "preprocess.h"
#include "token.h"
#include "AST.h"
#include "shell.h"

int feature_preprocess = 0;
int feature_search_depth = 1;
int feature_search_ignore_chisel = 1;
char source_path[PATH_LEN];
FILE *source_file;
char *source_buffer;

static void print_help() {
    printf("Usage: verelation [flags] [verilog file]\n");
    printf("flags:\n");
    printf("-np/--no-preprocess: do not preprocess the verilog source file, note that it may cause problems\n");
    printf("-d/--depth [NUM]: limit the search depth to NUM, with default depth set to 1\n");
    printf("-nc/--no-chisel-ignore: do not ignore temporary signals start with _\n");
    printf("-h/--help: print this help\n");
}

static void parse_args(int argc, char **argv) {
    if (argc < 2) {
        // no arguments specified
        print_help();
    }
    int file_count = 0;
    for (int i = 1; i < argc; ++i) {
        if (strncmp(argv[i], "-h", 4) == 0 || strncmp(argv[i], "--help", 8) == 0) {
            print_help();
            exit(0);
        } else if (strcmp(argv[i], "-np") == 0 || strcmp(argv[i], "--no-preprocess") == 0) {
            feature_preprocess = 1;
        } else if (strcmp(argv[i], "--depth") == 0 || strcmp(argv[i], "-d") == 0) {
            sscanf(argv[i+1], "%d", &feature_search_depth);
            ++i; // skip next argument
        } else if (strcmp(argv[i], "-nc") == 0 || strcmp(argv[i], "--no-chisel-ignore") == 0) {
            feature_search_ignore_chisel = 0;
        } else if (file_count == 0) {
            strncpy(source_path, argv[i], PATH_LEN);
            ++file_count;
        } else {
            printf("Error parse agruments: too many file args\n");
        }
    }
}

int main(int argc, char **argv) {
    // printf("Hello, World!\n");
    parse_args(argc, argv);
    source_file = fopen(source_path, "r");
    if (source_file == NULL) {
        printf("Error opening source file: %s\n", source_path);
        exit(1);
    }
    preprocess(&source_buffer);

    /*
    for (int i = 0; source_buffer[i] != 0; ++i) {
        putchar(source_buffer[i]);
    }
    */

    tokenize();
    process_token_type();
    /*
    print_token_info();
    */

    genTotalAST();

    user_shell();

    return 0;
}
